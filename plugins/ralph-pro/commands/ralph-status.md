---
description: "Affiche l'état actuel de la boucle Ralph Pro"
allowed-tools: ["Read"]
---

# Ralph Status

Affiche l'état actuel de la boucle Ralph Pro.

## Ce que tu dois faire

1. **Vérifier si une boucle est active**:
   - Lire `.ralph/state.json` si il existe
   - Si non, afficher "Aucune boucle Ralph active"

2. **Identifier le mode** (dans state.json):
   - `mode: "prd"` → Mode PRD (basé sur fichier)
   - `mode: "loop"` → Mode Loop (prompt libre)

3. **Afficher l'état selon le mode**:

   **Mode PRD:**
   ```
   ╔══════════════════════════════════════════════════════════════╗
   ║  RALPH PRO - Status                                          ║
   ╠══════════════════════════════════════════════════════════════╣
   ║  Mode: PRD                                                    ║
   ║  PRD: <nom>                                                   ║
   ║  Fichier: .ralph/concepts/<nom>.md                            ║
   ║  Itération: X / Y                                             ║
   ║  Démarré: <timestamp>                                         ║
   ║  Erreurs consécutives: N                                      ║
   ║  Sans progrès: N                                              ║
   ╚══════════════════════════════════════════════════════════════╝
   ```

   **Mode Loop:**
   ```
   ╔══════════════════════════════════════════════════════════════╗
   ║  RALPH PRO - Status                                          ║
   ╠══════════════════════════════════════════════════════════════╣
   ║  Mode: Loop (Prompt libre)                                    ║
   ║  Prompt: "<début du prompt>..."                               ║
   ║  Itération: X / Y                                             ║
   ║  Démarré: <timestamp>                                         ║
   ║  Completion promise: <phrase>                                 ║
   ║  Erreurs consécutives: N                                      ║
   ║  Sans progrès: N                                              ║
   ╚══════════════════════════════════════════════════════════════╝
   ```

4. **Si mode PRD, afficher le résumé de .ralph/@fix_plan.md**:
   - Compter les tâches [x] complétées
   - Compter les tâches [ ] restantes
   - Afficher le ratio

5. **Afficher les dernières entrées de .ralph/PROGRESS.md**:
   - Les 5 dernières lignes
