---
description: "Lance une boucle Ralph avec un prompt libre (sans fichier PRD)"
argument-hint: "\"<prompt>\" [--max-iterations N] [--completion-promise TEXT]"
allowed-tools: ["Read", "Write", "Bash(${CLAUDE_PLUGIN_ROOT}/scripts/setup-ralph-loop.sh:*)"]
---

# Ralph Loop

Lance une boucle Ralph Pro avec un prompt libre, sans nécessiter de fichier PRD.

## Utilisation

```bash
/ralph-pro:ralph-loop "Refactore le module auth pour utiliser JWT"
/ralph-pro:ralph-loop "Ajoute des tests unitaires" --max-iterations 20
/ralph-pro:ralph-loop "Corrige tous les bugs" --completion-promise "BUGS FIXED"
```

## Options

- `--max-iterations N` ou `-m N` : Limite d'itérations (défaut: 30)
- `--completion-promise TEXT` ou `-p TEXT` : Phrase de complétion (défaut: "TASK COMPLETE")

## Arguments reçus

$ARGUMENTS

## Ce que tu dois faire

### 1. Parser les arguments

Extraire :
- Le prompt (texte entre guillemets)
- `--max-iterations` ou `-m` : nombre max d'itérations
- `--completion-promise` ou `-p` : phrase de complétion

### 2. Vérifier qu'aucune boucle n'est active

Si `.ralph/state.json` existe déjà :
```
❌ Une boucle Ralph est déjà active.
   Utilisez /ralph-pro:ralph-cancel pour l'annuler d'abord.
```

### 3. Créer l'état Ralph

Créer `.ralph/` si nécessaire, puis `.ralph/state.json` :

```json
{
  "mode": "loop",
  "prompt": "<le prompt fourni>",
  "prd_name": null,
  "prd_file": null,
  "iteration": 0,
  "max_iterations": 30,
  "completion_promise": "TASK COMPLETE",
  "started_at": "<timestamp>",
  "errors_count": 0,
  "no_progress_count": 0
}
```

### 4. Mettre à jour .ralph/PROGRESS.md (si existe)

```markdown
## <date> - Ralph Loop
- Prompt: "<prompt>"
- Max itérations: N
- Démarrage de la boucle
```

### 5. Afficher le message de démarrage

```
╔══════════════════════════════════════════════════════════════╗
║  RALPH PRO - Loop Mode                                       ║
╠══════════════════════════════════════════════════════════════╣
║  Mode: Prompt libre                                          ║
║  Max iterations: N                                           ║
║  Completion promise: <phrase>                                ║
╚══════════════════════════════════════════════════════════════╝

Prompt:
"<le prompt>"

🔄 La boucle Ralph Pro est maintenant active.
   Pour terminer: <promise><phrase></promise>
```

### 6. Commencer le travail

Maintenant, commence à travailler sur le prompt fourni.
Le hook Stop interceptera ta sortie et te renverra le même prompt.

## Différence avec /ralph-pro:ralph-prd

| /ralph-pro:ralph-loop | /ralph-pro:ralph-prd |
|-------------|------------|
| Prompt en argument | PRD dans un fichier |
| Pas de structure requise | Nécessite `.ralph/concepts/` |
| Idéal pour tâches ponctuelles | Idéal pour features complètes |
| Pas de @fix_plan.md | Tracking automatique |

## Exemples

### Refactoring rapide
```bash
/ralph-pro:ralph-loop "Refactore tous les console.log en utilisant un logger propre"
```

### Correction de bugs
```bash
/ralph-pro:ralph-loop "Corrige tous les bugs TypeScript" --completion-promise "NO ERRORS"
```

### Ajout de tests
```bash
/ralph-pro:ralph-loop "Ajoute des tests pour couvrir 80% du code" -m 50 -p "COVERAGE OK"
```

### Amélioration de code
```bash
/ralph-pro:ralph-loop "Améliore les performances des requêtes SQL" --max-iterations 20
```

## IMPORTANT

- Quand la tâche est COMPLÈTEMENT terminée, output: `<promise>TASK COMPLETE</promise>` (ou ta phrase custom)
- Le hook Stop interceptera ta sortie et te renverra le même prompt
- Tu verras ton travail précédent dans les fichiers
- Continue là où tu t'es arrêté à chaque itération
- NE MENS PAS sur la complétion - le promise doit être VRAI
