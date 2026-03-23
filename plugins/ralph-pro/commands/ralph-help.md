---
description: "Affiche l'aide complète du plugin Ralph Pro"
---

# Ralph Pro Help

Affiche ce message d'aide à l'utilisateur:

```
╔══════════════════════════════════════════════════════════════════════════════╗
║                           RALPH PRO - AIDE                                   ║
║           Plugin de développement itératif avec support multi-PRD            ║
╚══════════════════════════════════════════════════════════════════════════════╝
```

## Qu'est-ce que Ralph Pro ?

Ralph Pro est une implémentation avancée de la technique Ralph Wiggum pour Claude Code.
Il permet de travailler sur des PRD (Product Requirements Documents) de manière itérative,
avec suivi automatique de la progression et détection des blocages.

## Commandes disponibles

```
┌─────────────────────────────────────────────────────────────────────────────────────┐
│ COMMANDE                                      │ DESCRIPTION                         │
├─────────────────────────────────────────────────────────────────────────────────────┤
│ /ralph-pro:ralph-init                         │ Initialise la structure du projet   │
│ /ralph-pro:ralph-import <fichier> [nom]       │ Convertit un doc en PRD Ralph       │
│ /ralph-pro:ralph-split <fichier>              │ Divise un gros PRD en plusieurs     │
│ /ralph-pro:ralph-prd <nom>                    │ Lance Ralph sur .ralph/concepts/    │
│ /ralph-pro:ralph-loop "<prompt>"              │ Lance Ralph avec un prompt libre    │
│ /ralph-pro:ralph-status                       │ Affiche l'état de la boucle active  │
│ /ralph-pro:ralph-cancel                       │ Annule la boucle en cours           │
│ /ralph-pro:ralph-help                         │ Affiche cette aide                  │
└─────────────────────────────────────────────────────────────────────────────────────┘
```

### Options pour /ralph-pro:ralph-prd et /ralph-pro:ralph-loop

| Option | Raccourci | Description |
|--------|-----------|-------------|
| `--max-iterations N` | `-m N` | Limite d'itérations (défaut: 30) |
| `--completion-promise TEXT` | `-p TEXT` | Phrase de complétion (défaut: TASK COMPLETE) |

## Démarrage rapide

```bash
# Étape 1: Initialiser le projet
/ralph-pro:ralph-init

# Étape 2a: Créer un PRD manuellement dans .ralph/concepts/
# Exemple: .ralph/concepts/feature-auth.md

# Étape 2b: OU importer un document existant
/ralph-pro:ralph-import specs/requirements.pdf feature-auth

# Étape 3: Lancer Ralph
/ralph-pro:ralph-prd feature-auth

# Ralph travaille automatiquement jusqu'à complétion!
```

## Importer un document existant

Tu peux convertir n'importe quel document en PRD compatible Ralph :

```bash
# Depuis un PDF
/ralph-pro:ralph-import docs/specs.pdf mon-feature

# Depuis un fichier texte
/ralph-pro:ralph-import notes.txt api-users

# Depuis un markdown existant
/ralph-pro:ralph-import old-specs/requirements.md nouvelle-feature

# Le nom du PRD est optionnel (déduit du nom de fichier)
/ralph-pro:ralph-import cahier-des-charges.docx
```

**Formats supportés:** .md, .txt, .pdf, .docx, .json

## Mode Loop (prompt libre)

Pour des tâches ponctuelles sans créer de fichier PRD :

```bash
# Refactoring
/ralph-pro:ralph-loop "Refactore tous les console.log en logger"

# Correction de bugs
/ralph-pro:ralph-loop "Corrige tous les bugs TypeScript" -p "NO ERRORS"

# Ajout de tests
/ralph-pro:ralph-loop "Ajoute des tests pour couvrir 80% du code" -m 50

# Avec options complètes
/ralph-pro:ralph-loop "Optimise les requêtes SQL" --max-iterations 20 --completion-promise "OPTIMIZED"
```

### Différence Loop vs PRD

| /ralph-pro:ralph-loop | /ralph-pro:ralph-prd |
|-------------|------------|
| Prompt en argument | PRD dans un fichier |
| Pas de structure requise | Nécessite `.ralph/concepts/` |
| Idéal pour tâches ponctuelles | Idéal pour features complètes |
| Pas de @fix_plan.md auto | Tracking automatique |

## Diviser un gros PRD en plusieurs

Si tu as un PRD complet avec plusieurs features, utilise `/ralph-pro:ralph-split` :

```bash
/ralph-pro:ralph-split specs/projet-complet.md
```

**Ce que ça fait :**
1. Analyse le document et détecte les features/sections
2. Propose un découpage (tu peux ajuster)
3. Génère plusieurs PRDs dans `.ralph/concepts/`
4. Crée une `.ralph/ROADMAP.md` avec l'ordre d'exécution

**Exemple :**
```
specs/projet-ecommerce.md     →     .ralph/concepts/
├── 1. Auth                          ├── 001-auth.md
├── 2. Catalogue                     ├── 002-catalogue.md
├── 3. Panier                        ├── 003-panier.md
├── 4. Checkout                      ├── 004-checkout.md
└── 5. Admin                         └── 005-admin.md

                                     .ralph/ROADMAP.md (ordre suggéré)
```

## Structure du projet

Après `/ralph-pro:ralph-init`, ton projet aura cette structure:

```
mon-projet/
└── .ralph/                    # Dossier principal Ralph Pro
    ├── concepts/              # Tes PRD vont ici (numérotés)
    │   ├── 001-feature-auth.md
    │   ├── 002-feature-api.md
    │   └── ...
    ├── state.json             # État interne (auto-géré)
    ├── @fix_plan.md           # Tâches en cours (auto-géré)
    ├── PROGRESS.md            # Historique des sessions
    └── ROADMAP.md             # Ordre d'exécution des PRDs
```

## Format d'un PRD

Crée tes PRD dans `.ralph/concepts/` avec ce format (numérotation automatique) :

```markdown
# .ralph/concepts/001-mon-feature.md

## Objectif
Description courte de ce que tu veux construire.

## Exigences
- Exigence 1: Détails...
- Exigence 2: Détails...
- Exigence 3: Détails...

## Critères de succès
- [ ] Critère 1
- [ ] Critère 2
- [ ] Tests passent
```

## Circuit Breaker (Protection anti-blocage)

Ralph Pro s'arrête automatiquement pour éviter les boucles infinies:

| Condition                    | Seuil | Action suggérée                    |
|------------------------------|-------|-----------------------------------|
| Erreurs consécutives         | 5     | Vérifiez les logs d'erreur        |
| Itérations sans progrès      | 3     | Simplifiez la tâche               |
| Limite d'itérations atteinte | N     | Augmentez avec `--max-iterations` |

## Signal de complétion

Pour terminer la boucle, Claude doit output:

```
<promise>PRD COMPLETE</promise>
```

Cela signale que TOUTES les exigences du PRD sont implémentées.

## Exemples d'utilisation

### Exemple 1: Feature simple
```bash
/ralph-pro:ralph-prd login-page
```

### Exemple 2: Feature complexe avec plus d'itérations
```bash
/ralph-pro:ralph-prd api-complète --max-iterations 100
```

### Exemple 3: Vérifier où en est Ralph
```bash
/ralph-pro:ralph-status
```

### Exemple 4: Arrêter pour modifier le PRD
```bash
/ralph-pro:ralph-cancel
# Modifier le PRD...
/ralph-pro:ralph-prd mon-feature  # Reprendre
```

## Différences avec ralph-wiggum standard

| Fonctionnalité        | ralph-wiggum | ralph-pro |
|-----------------------|--------------|-----------|
| Support multi-PRD     | Non          | Oui       |
| Circuit breaker       | Non          | Oui       |
| Tracking progression  | Non          | Oui       |
| Structure projet      | Non          | Oui       |
| Agents spécialisés    | Non          | Oui       |

## Besoin d'aide ?

- Voir les PRD disponibles: `ls .ralph/concepts/`
- Voir l'état actuel: `/ralph-pro:ralph-status`
- Annuler la boucle: `/ralph-pro:ralph-cancel`
