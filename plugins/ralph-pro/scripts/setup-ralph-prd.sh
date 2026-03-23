#!/bin/bash

# Ralph Pro - Setup PRD Loop
# Parse arguments and create initial state

set -euo pipefail

# Defaults
PRD_NAME=""
MAX_ITERATIONS=30

# Parse arguments
while [[ $# -gt 0 ]]; do
  case $1 in
    --max-iterations|-m)
      MAX_ITERATIONS="$2"
      shift 2
      ;;
    --max)
      MAX_ITERATIONS="$2"
      shift 2
      ;;
    -*)
      echo "Option inconnue: $1" >&2
      exit 1
      ;;
    *)
      PRD_NAME="$1"
      shift
      ;;
  esac
done

# Validate PRD name
if [[ -z "$PRD_NAME" ]]; then
  echo "❌ Erreur: Nom du PRD requis"
  echo ""
  echo "Usage: /ralph-prd <prd-name> [--max-iterations N]"
  echo ""
  echo "Exemple: /ralph-prd feature-auth --max-iterations 50"
  exit 1
fi

# Remove .md extension if provided
PRD_NAME="${PRD_NAME%.md}"

# Check PRD file exists
PRD_FILE="concepts/${PRD_NAME}.md"
if [[ ! -f "$PRD_FILE" ]]; then
  echo "❌ Erreur: Fichier PRD non trouvé: $PRD_FILE"
  echo ""
  echo "PRD disponibles:"
  if [[ -d "concepts" ]]; then
    ls -1 concepts/*.md 2>/dev/null | sed 's|concepts/||' | sed 's|\.md$||' | sed 's/^/  - /' || echo "  (aucun)"
  else
    echo "  Le dossier concepts/ n'existe pas. Lancez /ralph-init d'abord."
  fi
  exit 1
fi

# Check no active loop
if [[ -f ".ralph/state.json" ]]; then
  ACTIVE_PRD=$(jq -r '.prd_name' .ralph/state.json)
  echo "❌ Erreur: Une boucle Ralph est déjà active"
  echo ""
  echo "PRD actif: $ACTIVE_PRD"
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
cat > .ralph/state.json << EOF
{
  "prd_name": "$PRD_NAME",
  "prd_file": "$PRD_FILE",
  "iteration": 0,
  "max_iterations": $MAX_ITERATIONS,
  "completion_promise": "PRD COMPLETE",
  "started_at": "$TIMESTAMP",
  "errors_count": 0,
  "no_progress_count": 0
}
EOF

# Update PROGRESS.md
if [[ -f "PROGRESS.md" ]]; then
  echo "" >> PROGRESS.md
  echo "## $(date '+%Y-%m-%d %H:%M') - $PRD_NAME" >> PROGRESS.md
  echo "- Démarrage de la boucle Ralph Pro" >> PROGRESS.md
  echo "- Max itérations: $MAX_ITERATIONS" >> PROGRESS.md
fi

# Output success
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║  RALPH PRO - Démarrage                                       ║"
echo "╠══════════════════════════════════════════════════════════════╣"
echo "║  PRD: $PRD_FILE"
echo "║  Max iterations: $MAX_ITERATIONS"
echo "║  Completion promise: PRD COMPLETE"
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""
echo "🔄 La boucle Ralph Pro est maintenant active."
echo "   Quand tu termines, output: <promise>PRD COMPLETE</promise>"
