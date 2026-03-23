#!/bin/bash

# Ralph Pro Stop Hook
# Enhanced version with circuit breaker, progress tracking, and response analysis
# Supports both PRD mode and Loop mode (free prompt)
# Prevents session exit when a ralph-loop is active

set -euo pipefail

# Read hook input from stdin
HOOK_INPUT=$(cat)

# Check if ralph-pro is active
RALPH_STATE_FILE=".ralph/state.json"

if [[ ! -f "$RALPH_STATE_FILE" ]]; then
  # No active loop - allow exit
  exit 0
fi

# Read state from JSON
STATE=$(cat "$RALPH_STATE_FILE")
MODE=$(echo "$STATE" | jq -r '.mode // "prd"')
ITERATION=$(echo "$STATE" | jq -r '.iteration // 0')
MAX_ITERATIONS=$(echo "$STATE" | jq -r '.max_iterations // 0')
COMPLETION_PROMISE=$(echo "$STATE" | jq -r '.completion_promise // ""')
PRD_NAME=$(echo "$STATE" | jq -r '.prd_name // ""')
PRD_FILE=$(echo "$STATE" | jq -r '.prd_file // ""')
LOOP_PROMPT=$(echo "$STATE" | jq -r '.prompt // ""')
ERRORS_COUNT=$(echo "$STATE" | jq -r '.errors_count // 0')
NO_PROGRESS_COUNT=$(echo "$STATE" | jq -r '.no_progress_count // 0')
LAST_TASK_COMPLETED=$(echo "$STATE" | jq -r '.last_task_completed // ""')

# Validate numeric fields
if [[ ! "$ITERATION" =~ ^[0-9]+$ ]]; then
  echo "⚠️  Ralph Pro: État corrompu - iteration invalide" >&2
  rm "$RALPH_STATE_FILE"
  exit 0
fi

# Check max iterations
if [[ $MAX_ITERATIONS -gt 0 ]] && [[ $ITERATION -ge $MAX_ITERATIONS ]]; then
  echo "🛑 Ralph Pro: Limite d'itérations atteinte ($MAX_ITERATIONS)"
  echo ""
  echo "📊 Résumé:"
  echo "   PRD: $PRD_NAME"
  echo "   Itérations: $ITERATION"
  rm "$RALPH_STATE_FILE"
  exit 0
fi

# Get transcript path from hook input
TRANSCRIPT_PATH=$(echo "$HOOK_INPUT" | jq -r '.transcript_path')

if [[ ! -f "$TRANSCRIPT_PATH" ]]; then
  echo "⚠️  Ralph Pro: Fichier transcript non trouvé" >&2
  rm "$RALPH_STATE_FILE"
  exit 0
fi

# Read last assistant message from transcript
if ! grep -q '"role":"assistant"' "$TRANSCRIPT_PATH"; then
  echo "⚠️  Ralph Pro: Pas de message assistant dans le transcript" >&2
  rm "$RALPH_STATE_FILE"
  exit 0
fi

LAST_LINE=$(grep '"role":"assistant"' "$TRANSCRIPT_PATH" | tail -1)
LAST_OUTPUT=$(echo "$LAST_LINE" | jq -r '
  .message.content |
  map(select(.type == "text")) |
  map(.text) |
  join("\n")
' 2>/dev/null || echo "")

if [[ -z "$LAST_OUTPUT" ]]; then
  echo "⚠️  Ralph Pro: Message assistant vide" >&2
  rm "$RALPH_STATE_FILE"
  exit 0
fi

# ============================================
# CIRCUIT BREAKER - Détection des blocages
# ============================================

# Détecter les erreurs répétées
ERROR_PATTERNS="error|Error|ERROR|failed|Failed|FAILED|exception|Exception"
if echo "$LAST_OUTPUT" | grep -qE "$ERROR_PATTERNS"; then
  ERRORS_COUNT=$((ERRORS_COUNT + 1))
else
  ERRORS_COUNT=0
fi

# Circuit breaker: 5 erreurs consécutives = stop
if [[ $ERRORS_COUNT -ge 5 ]]; then
  echo "🔴 Ralph Pro: Circuit breaker activé - 5 erreurs consécutives"
  echo ""
  echo "📊 Résumé:"
  echo "   PRD: $PRD_NAME"
  echo "   Itérations: $ITERATION"
  echo "   Erreurs consécutives: $ERRORS_COUNT"
  echo ""
  echo "💡 Conseil: Vérifiez les erreurs et relancez avec /ralph-prd $PRD_NAME"
  rm "$RALPH_STATE_FILE"
  exit 0
fi

# Détecter l'absence de progrès (patterns de complétion sans vraie avancée)
PROGRESS_PATTERNS="\[x\]|✅|completed|terminé|done|fixed|implémenté|créé|ajouté"
if echo "$LAST_OUTPUT" | grep -qiE "$PROGRESS_PATTERNS"; then
  NO_PROGRESS_COUNT=0
else
  NO_PROGRESS_COUNT=$((NO_PROGRESS_COUNT + 1))
fi

# Circuit breaker: 3 itérations sans progrès = stop
if [[ $NO_PROGRESS_COUNT -ge 3 ]]; then
  echo "🔴 Ralph Pro: Circuit breaker activé - 3 itérations sans progrès"
  echo ""
  echo "📊 Résumé:"
  echo "   PRD: $PRD_NAME"
  echo "   Itérations: $ITERATION"
  echo ""
  echo "💡 Conseil: Le travail semble bloqué. Vérifiez @fix_plan.md"
  rm "$RALPH_STATE_FILE"
  exit 0
fi

# ============================================
# DÉTECTION EXIT_SIGNAL
# ============================================

# Vérifier le completion promise
if [[ -n "$COMPLETION_PROMISE" ]] && [[ "$COMPLETION_PROMISE" != "null" ]]; then
  PROMISE_TEXT=$(echo "$LAST_OUTPUT" | perl -0777 -pe 's/.*?<promise>(.*?)<\/promise>.*/$1/s; s/^\s+|\s+$//g; s/\s+/ /g' 2>/dev/null || echo "")

  if [[ -n "$PROMISE_TEXT" ]] && [[ "$PROMISE_TEXT" = "$COMPLETION_PROMISE" ]]; then
    echo "✅ Ralph Pro: Tâche terminée - <promise>$COMPLETION_PROMISE</promise>"
    echo ""
    echo "📊 Résumé final:"
    echo "   PRD: $PRD_NAME"
    echo "   Itérations: $((ITERATION + 1))"

    # Mettre à jour PROGRESS.md avec la complétion
    if [[ -f "PROGRESS.md" ]]; then
      echo "" >> PROGRESS.md
      echo "### $(date '+%Y-%m-%d %H:%M') - $PRD_NAME TERMINÉ" >> PROGRESS.md
      echo "- Itérations totales: $((ITERATION + 1))" >> PROGRESS.md
    fi

    rm "$RALPH_STATE_FILE"
    exit 0
  fi
fi

# ============================================
# CONTINUER LA BOUCLE
# ============================================

NEXT_ITERATION=$((ITERATION + 1))

# Mettre à jour l'état
NEW_STATE=$(echo "$STATE" | jq \
  --argjson iteration "$NEXT_ITERATION" \
  --argjson errors "$ERRORS_COUNT" \
  --argjson no_progress "$NO_PROGRESS_COUNT" \
  '.iteration = $iteration | .errors_count = $errors | .no_progress_count = $no_progress')

echo "$NEW_STATE" > "$RALPH_STATE_FILE"

# Mettre à jour PROGRESS.md
if [[ -f "PROGRESS.md" ]]; then
  echo "- Itération $NEXT_ITERATION: $(date '+%H:%M')" >> PROGRESS.md 2>/dev/null || true
fi

# Construire le prompt selon le mode
if [[ "$MODE" == "loop" ]]; then
  # Mode Loop: prompt libre
  PROMPT_TEXT="# Ralph Pro - Itération $NEXT_ITERATION

## Mode: Loop (Prompt libre)

## Ta tâche

$LOOP_PROMPT

---

## Rappel
- Tu vois ton travail précédent dans les fichiers
- Continue là où tu t'es arrêté
- Ne refais pas le travail déjà fait
- Quand la tâche est COMPLÈTEMENT terminée, output: <promise>$COMPLETION_PROMISE</promise>"

  SYSTEM_MSG="🔄 Ralph Pro [Loop] - Itération $NEXT_ITERATION/$MAX_ITERATIONS | Pour terminer: <promise>$COMPLETION_PROMISE</promise>"

else
  # Mode PRD: basé sur fichier
  if [[ ! -f "$PRD_FILE" ]]; then
    echo "⚠️  Ralph Pro: Fichier PRD non trouvé: $PRD_FILE" >&2
    rm "$RALPH_STATE_FILE"
    exit 0
  fi

  PRD_CONTENT=$(cat "$PRD_FILE")

  PROMPT_TEXT="# Ralph Pro - Itération $NEXT_ITERATION

## PRD actif: $PRD_NAME
Fichier: $PRD_FILE

## Instructions
1. Lis le PRD ci-dessous pour comprendre les spécifications
2. Consulte @fix_plan.md pour voir les tâches en cours
3. Implémente la prochaine tâche logique
4. Met à jour @fix_plan.md (coche les tâches terminées)
5. Quand TOUT est terminé, output: <promise>$COMPLETION_PROMISE</promise>

## Contenu du PRD

$PRD_CONTENT

---

## Rappel
- Tu vois ton travail précédent dans les fichiers
- Continue là où tu t'es arrêté
- Ne refais pas le travail déjà fait
- Met à jour @fix_plan.md après chaque tâche"

  SYSTEM_MSG="🔄 Ralph Pro [$PRD_NAME] - Itération $NEXT_ITERATION/$MAX_ITERATIONS | Pour terminer: <promise>$COMPLETION_PROMISE</promise>"
fi

# Output JSON pour bloquer et continuer
jq -n \
  --arg prompt "$PROMPT_TEXT" \
  --arg msg "$SYSTEM_MSG" \
  '{
    "decision": "block",
    "reason": $prompt,
    "systemMessage": $msg
  }'

exit 0
