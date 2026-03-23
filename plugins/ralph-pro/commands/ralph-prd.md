---
description: "Lance Ralph Pro sur un PRD spécifique"
argument-hint: "<prd-name> [--max-iterations N]"
allowed-tools: ["Bash(${CLAUDE_PLUGIN_ROOT}/scripts/setup-ralph-prd.sh:*)", "Read", "Write", "Glob", "Grep"]
---

# Ralph PRD

Lance une boucle Ralph Pro sur le PRD spécifié.

## Utilisation

```
/ralph-pro:ralph-prd feature-auth
/ralph-pro:ralph-prd feature-auth --max-iterations 50
```

## Ce que tu dois faire

1. **Parser les arguments**: Extraire le nom du PRD et les options
   - Premier argument: nom du PRD (sans extension .md)
   - `--max-iterations N` ou `-m N`: limite d'itérations (défaut: 30)

2. **Vérifier les prérequis**:
   - Le dossier `.ralph/` existe (sinon → `/ralph-pro:ralph-init`)
   - Le fichier `.ralph/concepts/<prd-name>.md` existe
   - Pas de boucle Ralph déjà active (`.ralph/state.json`)

3. **Lire et analyser le PRD**:
   - Lire le contenu de `.ralph/concepts/<prd-name>.md`
   - Extraire les tâches/exigences du PRD
   - Créer/mettre à jour `.ralph/@fix_plan.md` avec les tâches extraites

4. **Créer l'état Ralph**:
   - Créer `.ralph/state.json` avec:
     ```json
     {
       "mode": "prd",
       "prd_name": "<nom>",
       "prd_file": ".ralph/concepts/<nom>.md",
       "iteration": 0,
       "max_iterations": 30,
       "completion_promise": "PRD COMPLETE",
       "started_at": "<timestamp>",
       "errors_count": 0,
       "no_progress_count": 0
     }
     ```

5. **Mettre à jour .ralph/PROGRESS.md**:
   - Ajouter une entrée de démarrage

6. **Afficher le message de démarrage**:
   ```
   ╔══════════════════════════════════════════════════════════════╗
   ║  RALPH PRO - Démarrage                                       ║
   ╠══════════════════════════════════════════════════════════════╣
   ║  PRD: .ralph/concepts/<nom>.md                               ║
   ║  Max iterations: N                                           ║
   ║  Completion promise: PRD COMPLETE                            ║
   ╚══════════════════════════════════════════════════════════════╝
   ```

7. **Commencer le travail**:
   - Lire le PRD
   - Lire `.ralph/@fix_plan.md`
   - Implémenter la première tâche non complétée
   - Mettre à jour `.ralph/@fix_plan.md`

## Arguments reçus

$ARGUMENTS

## IMPORTANT

- Quand TOUTES les tâches du PRD sont terminées, output: `<promise>PRD COMPLETE</promise>`
- Le hook Stop interceptera ta sortie et te renverra le même contexte
- Tu verras ton travail précédent dans les fichiers
- Continue là où tu t'es arrêté à chaque itération
