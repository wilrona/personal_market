---
description: "Initialise la structure Ralph Pro dans le projet courant"
allowed-tools: ["Bash(mkdir:*)", "Bash(touch:*)", "Write", "Read", "Glob"]
---

# Ralph Init

Initialise la structure Ralph Pro dans le projet courant.

## Structure à créer

```
projet/
└── .ralph/                    <- Dossier principal Ralph Pro
    ├── concepts/              <- PRDs numérotés
    │   └── .gitkeep
    ├── state.json             <- État de la boucle (créé au runtime)
    ├── @fix_plan.md           <- Tâches en cours
    ├── PROGRESS.md            <- Historique des sessions
    └── ROADMAP.md             <- Ordre d'exécution des PRDs
```

## Ce que tu dois faire

### 1. Vérifier si .ralph/ existe déjà

Utiliser Glob pour vérifier :
```
Glob: .ralph/**/*
```

Si le dossier existe et contient des fichiers, demander confirmation avant de continuer.

### 2. Créer la structure

```bash
mkdir -p .ralph/concepts
```

### 3. Créer les fichiers initiaux

#### .ralph/concepts/.gitkeep
Fichier vide pour que git track le dossier.

#### .ralph/@fix_plan.md

```markdown
# Fix Plan - Tâches en cours

> Ce fichier est géré automatiquement par Ralph Pro.
> Il track les tâches du PRD actif.

## Aucun PRD actif

Lancez `/ralph-pro:ralph-prd <nom-du-prd>` pour démarrer.

---
*Initialisé par Ralph Pro*
```

#### .ralph/PROGRESS.md

```markdown
# Historique Ralph Pro

> Ce fichier contient l'historique de toutes les sessions Ralph.
> Mis à jour automatiquement à chaque itération.

## Sessions

---
*Initialisé le <date>*
```

#### .ralph/ROADMAP.md

```markdown
# Roadmap du Projet

> Généré par Ralph Pro
> Dernière mise à jour: <date>

## Vue d'ensemble

| #   | PRD | Statut | Dépendances | Source |
|-----|-----|--------|-------------|--------|
| -   | -   | -      | -           | -      |

## Progression

*Aucun PRD importé pour l'instant.*

---
*Utilisez `/ralph-pro:ralph-import` ou `/ralph-pro:ralph-split` pour ajouter des PRDs*
```

### 4. Afficher la confirmation

```
╔══════════════════════════════════════════════════════════════╗
║  RALPH PRO - Initialisation réussie                          ║
╠══════════════════════════════════════════════════════════════╣
║  Dossier créé: .ralph/                                       ║
╚══════════════════════════════════════════════════════════════╝

Structure créée:
  .ralph/
  ├── concepts/        <- Tes PRDs iront ici
  ├── @fix_plan.md     <- Tâches en cours
  ├── PROGRESS.md      <- Historique
  └── ROADMAP.md       <- Ordre d'exécution

Prochaines étapes:
  1. Importer un document:  /ralph-pro:ralph-import <fichier>
  2. Ou diviser un PRD:     /ralph-pro:ralph-split <fichier>
  3. Ou créer manuellement: .ralph/concepts/001-ma-feature.md

Puis lancer Ralph:
  /ralph-pro:ralph-prd 001-ma-feature
```

## Notes

- Le dossier `.ralph/` est caché (commence par un point)
- Ajoute `.ralph/state.json` à ton `.gitignore` (état temporaire)
- Les autres fichiers peuvent être versionnés pour suivre la progression
