#!/bin/bash

# Ralph Pro - Setup Loop Mode
# Parse arguments and create initial state for prompt-based loop

set -euo pipefail

# Defaults
PROMPT=""
MAX_ITERATIONS=30
COMPLETION_PROMISE="TASK COMPLETE"

# Parse arguments
while [[ $# -gt 0 ]]; do
  case $1 in
    --max-iterations|-m)
      MAX_ITERATIONS="$2"
      shift 2
      ;;
    --completion-promise|-p)
      COMPLETION_PROMISE="$2"
      shift 2
      ;;
    -*)
      echo "Option inconnue: $1" >&2
      exit 1
      ;;
    *)
      # Si c'est le prompt (premier argument non-option)
      if [[ -z "$PROMPT" ]]; then
        PROMPT="$1"
      fi
      shift
      ;;
  esac
done

# Validate prompt
if [[ -z "$PROMPT" ]]; then
  echo "❌ Erreur: Prompt requis"
  echo ""
  echo "Usage: /ralph-loop \"<prompt>\" [--max-iterations N] [--completion-promise TEXT]"
  echo ""
  echo "Exemples:"
  echo "  /ralph-loop \"Refactore le module auth\""
  echo "  /ralph-loop \"Ajoute des tests\" --max-iterations 20"
  echo "  /ralph-loop \"Corrige les bugs\" -p \"BUGS FIXED\""
  exit 1
fi

# Check no active loop
if [[ -f ".ralph/state.json" ]]; then
  MODE=$(jq -r '.mode // "prd"' .ralph/state.json)
  if [[ "$MODE" == "loop" ]]; then
    ACTIVE_PROMPT=$(jq -r '.prompt' .ralph/state.json | head -c 50)
    echo "❌ Erreur: Une boucle Ralph Loop est déjà active"
    echo ""
    echo "Prompt actif: \"${ACTIVE_PROMPT}...\""
  else
    ACTIVE_PRD=$(jq -r '.prd_name' .ralph/state.json)
    echo "❌ Erreur: Une boucle Ralph PRD est déjà active"
    echo ""
    echo "PRD actif: $ACTIVE_PRD"
  fi
  echo ""
  echo "Options:"
  echo "  /ralph-cancel  - Annuler la boucle active"
  echo "  /ralph-status  - Voir l'état actuel"
  exit 1
fi

# Create .ralph directory if needed
mkdir -p .ralph

# Create state file
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

# Use jq to properly escape the prompt
jq -n \
  --arg mode "loop" \
  --arg prompt "$PROMPT" \
  --argjson iteration 0 \
  --argjson max_iterations "$MAX_ITERATIONS" \
  --arg completion_promise "$COMPLETION_PROMISE" \
  --arg started_at "$TIMESTAMP" \
  --argjson errors_count 0 \
  --argjson no_progress_count 0 \
  '{
    mode: $mode,
    prompt: $prompt,
    prd_name: null,
    prd_file: null,
    iteration: $iteration,
    max_iterations: $max_iterations,
    completion_promise: $completion_promise,
    started_at: $started_at,
    errors_count: $errors_count,
    no_progress_count: $no_progress_count
  }' > .ralph/state.json

# Update PROGRESS.md if exists
if [[ -f "PROGRESS.md" ]]; then
  echo "" >> PROGRESS.md
  echo "## $(date '+%Y-%m-%d %H:%M') - Ralph Loop" >> PROGRESS.md
  echo "- Prompt: \"$(echo "$PROMPT" | head -c 100)...\"" >> PROGRESS.md
  echo "- Max itérations: $MAX_ITERATIONS" >> PROGRESS.md
  echo "- Démarrage de la boucle" >> PROGRESS.md
fi

# Output success
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║  RALPH PRO - Loop Mode                                       ║"
echo "╠══════════════════════════════════════════════════════════════╣"
echo "║  Mode: Prompt libre                                          ║"
echo "║  Max iterations: $MAX_ITERATIONS"
echo "║  Completion promise: $COMPLETION_PROMISE"
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""
echo "Prompt:"
echo "\"$PROMPT\""
echo ""
echo "🔄 La boucle Ralph Pro est maintenant active."
echo "   Pour terminer: <promise>$COMPLETION_PROMISE</promise>"
