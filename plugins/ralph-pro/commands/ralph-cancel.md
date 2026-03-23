---
description: "Annule la boucle Ralph Pro active"
allowed-tools: ["Read", "Write", "Bash(rm:*)"]
---

# Ralph Cancel

Annule la boucle Ralph Pro active et sauvegarde la progression.

## Ce que tu dois faire

1. **Vérifier si une boucle est active**:
   - Lire `.ralph/state.json`
   - Si non, afficher "Aucune boucle Ralph active à annuler"

2. **Lire l'état actuel**:
   - Récupérer le nom du PRD
   - Récupérer le nombre d'itérations
   - Récupérer le timestamp de démarrage

3. **Mettre à jour .ralph/PROGRESS.md**:
   - Ajouter une entrée d'annulation:
     ```
     ### <date> - <prd-name> ANNULÉ
     - Itérations: N
     - Raison: Annulation manuelle
     ```

4. **Supprimer l'état**:
   - Supprimer `.ralph/state.json`

5. **Afficher la confirmation**:
   ```
   ╔══════════════════════════════════════════════════════════════╗
   ║  RALPH PRO - Annulé                                          ║
   ╠══════════════════════════════════════════════════════════════╣
   ║  PRD: <nom>                                                   ║
   ║  Itérations effectuées: N                                     ║
   ║  Progression sauvegardée dans .ralph/PROGRESS.md              ║
   ╚══════════════════════════════════════════════════════════════╝

   💡 Pour reprendre: /ralph-pro:ralph-prd <nom>
   ```
