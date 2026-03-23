---
description: "Divise un gros PRD en plusieurs petits PRDs par feature"
argument-hint: "<fichier-prd>"
allowed-tools: ["Read", "Write", "Glob", "AskUserQuestion"]
---

# Ralph Split

Analyse un PRD complet et le divise en plusieurs petits PRDs par feature/module.

## Utilisation

```bash
/ralph-pro:ralph-split specs/projet-complet.md
/ralph-pro:ralph-split docs/cahier-des-charges.pdf
```

## Arguments reçus

$ARGUMENTS

## Ce que tu dois faire

### Étape 0 : Vérifier que .ralph/ existe

Vérifier que le dossier `.ralph/` existe :
```
Glob: .ralph/concepts/*.md
```

Si `.ralph/` n'existe pas, informer l'utilisateur :
```
⚠️  Le dossier .ralph/ n'existe pas.
    Exécutez d'abord: /ralph-pro:ralph-init
```

### Étape 0b : Vérifier la numérotation existante

**IMPORTANT** : Avant de créer les PRDs, tu DOIS vérifier les fichiers existants dans `.ralph/concepts/` pour continuer la numérotation.

1. Utiliser Glob pour lister les fichiers existants :
   ```
   Glob: .ralph/concepts/*.md
   ```

2. Analyser les noms de fichiers pour trouver le pattern de numérotation :
   - Pattern attendu : `NNN-nom-feature.md` (ex: `001-auth.md`, `002-api-users.md`)
   - Extraire le plus grand numéro existant
   - Si aucun fichier n'existe ou pas de numérotation → commencer à 001

3. Stocker le prochain numéro disponible pour l'utiliser lors de la création

**Exemple :**
```
Fichiers existants dans .ralph/concepts/:
  001-auth.md
  002-api-users.md
  003-dashboard.md

→ Prochain numéro disponible: 004
→ Les nouveaux PRDs seront: 004-xxx.md, 005-xxx.md, etc.
```

### Étape 1 : Lire et analyser le document

1. Lire le fichier source fourni en argument
2. Analyser sa structure pour identifier :
   - Les grandes sections/chapitres
   - Les features/fonctionnalités distinctes
   - Les modules ou composants séparés
   - Les user stories ou épics

### Étape 2 : Détecter les features

Chercher des patterns comme :
- Titres de niveau 2 (## Feature X)
- Sections numérotées (1. Module Auth, 2. Module API...)
- Mots-clés : "feature", "module", "composant", "épic", "user story"
- Séparations logiques (auth, users, api, dashboard, etc.)

### Étape 3 : Proposer le découpage

Afficher la proposition avec la **numérotation continue** :

```
╔══════════════════════════════════════════════════════════════╗
║  RALPH PRO - Analyse du PRD                                  ║
╠══════════════════════════════════════════════════════════════╣
║  Source: <fichier>                                           ║
║  Features détectées: N                                       ║
║  PRDs existants: X (dernier: NNN)                            ║
║  Prochaine numérotation: NNN+1                               ║
╚══════════════════════════════════════════════════════════════╝

## Features détectées

| #   | Fichier              | Nom suggéré   | Exigences | Description                    |
|-----|----------------------|---------------|-----------|--------------------------------|
| 004 | 004-auth.md          | auth          | 8         | Authentification et sécurité   |
| 005 | 005-api-users.md     | api-users     | 12        | API REST pour les utilisateurs |
| 006 | 006-dashboard.md     | dashboard     | 15        | Interface d'administration     |
| 007 | 007-notifications.md | notifications | 6         | Système de notifications       |
| 008 | 008-billing.md       | billing       | 10        | Facturation et paiements       |

Total: 51 exigences réparties en 5 nouveaux PRDs (004-008)
```

### Étape 4 : Demander confirmation

Utiliser AskUserQuestion pour demander :
- Valider le découpage proposé ?
- Modifier les noms des PRDs ?
- Fusionner certaines features ?
- Exclure certaines features ?

### Étape 5 : Générer les PRDs

Pour chaque feature validée, créer `.ralph/concepts/<NNN>-<nom-feature>.md` avec la numérotation continue :

```markdown
# <Nom de la Feature>

> Extrait de: <fichier-source>
> Section: <numéro/nom de section>
> Date: <date>

## Objectif

<Objectif spécifique de cette feature>

## Contexte

Cette feature fait partie du projet global défini dans <fichier-source>.
Elle dépend de: <dépendances si identifiées>

## Exigences fonctionnelles

- [ ] Exigence 1
- [ ] Exigence 2
...

## Exigences techniques

- [ ] Contrainte 1
- [ ] Contrainte 2
...

## Critères de succès

- [ ] Critère 1
- [ ] Critère 2
- [ ] Tests passent

## Dépendances

- Requiert: <autres features requises avant celle-ci>
- Bloque: <features qui dépendent de celle-ci>

---
*PRD généré par Ralph Pro Split depuis <fichier-source>*
```

### Étape 6 : Mettre à jour la ROADMAP

**IMPORTANT** : Si `.ralph/ROADMAP.md` existe déjà, tu dois **l'étendre** (pas l'écraser).

1. **Si .ralph/ROADMAP.md existe** :
   - Lire le fichier existant
   - Trouver la section "## Vue d'ensemble" et ajouter les nouvelles lignes au tableau
   - Trouver la section "## Progression" et ajouter les nouvelles entrées
   - Ajouter une section "## Ajouté le <date>" avec les nouveaux PRDs

2. **Si .ralph/ROADMAP.md n'existe pas** :
   - Créer le fichier complet

**Format pour mise à jour (ajouter à l'existant)** :

```markdown
## Ajouté le <date> (depuis <fichier-source>)

| #   | PRD              | Statut       | Dépendances       |
|-----|------------------|--------------|-------------------|
| 004 | 004-auth.md      | ⏳ En attente | -                 |
| 005 | 005-api-users.md | ⏳ En attente | 004-auth          |
| 006 | 006-dashboard.md | ⏳ En attente | 005-api-users     |

### Ordre d'exécution pour ce batch

1. **004-auth** - Fondation du système
   ```bash
   /ralph-pro:ralph-prd 004-auth
   ```

2. **005-api-users** - Dépend de 004-auth
   ```bash
   /ralph-pro:ralph-prd 005-api-users
   ```
```

**Format pour nouveau fichier** :

```markdown
# Roadmap du Projet

> Généré par Ralph Pro Split
> Dernière mise à jour: <date>

## Vue d'ensemble

| #   | PRD              | Statut       | Dépendances       | Source         |
|-----|------------------|--------------|-------------------|----------------|
| 001 | 001-auth.md      | ⏳ En attente | -                 | <fichier>.md   |
| 002 | 002-api-users.md | ⏳ En attente | 001-auth          | <fichier>.md   |
| 003 | 003-dashboard.md | ⏳ En attente | 002-api-users     | <fichier>.md   |

## Progression

- [ ] 001-auth
- [ ] 002-api-users
- [ ] 003-dashboard

---
*Mettez à jour ce fichier au fur et à mesure de l'avancement*
```

### Étape 7 : Afficher le résumé

```
╔══════════════════════════════════════════════════════════════╗
║  RALPH PRO - Split terminé                                   ║
╠══════════════════════════════════════════════════════════════╣
║  PRDs créés: 5 (numérotés 004-008)                           ║
║  Emplacement: .ralph/concepts/                               ║
║  Roadmap: .ralph/ROADMAP.md (mise à jour)                    ║
╚══════════════════════════════════════════════════════════════╝

PRDs générés:
  ✅ .ralph/concepts/004-auth.md (8 exigences)
  ✅ .ralph/concepts/005-api-users.md (12 exigences)
  ✅ .ralph/concepts/006-dashboard.md (15 exigences)
  ✅ .ralph/concepts/007-notifications.md (6 exigences)
  ✅ .ralph/concepts/008-billing.md (10 exigences)

Pour commencer:
  /ralph-pro:ralph-prd 004-auth

Voir la roadmap:
  cat .ralph/ROADMAP.md
```

## Conseils pour un bon découpage

### Critères de séparation

Une feature devrait être séparée si :
- Elle a un **domaine fonctionnel distinct** (auth ≠ billing)
- Elle peut être **développée indépendamment** (après ses dépendances)
- Elle a des **critères de succès mesurables**
- Elle représente **10-20 exigences max** (sinon la re-diviser)

### Gestion des dépendances

- Identifier les features "fondation" (auth, config, setup)
- Les mettre en premier dans la roadmap
- Marquer les dépendances explicitement

### Si le PRD est mal structuré

Si le document source n'a pas de structure claire :
1. Proposer une structure basée sur l'analyse sémantique
2. Demander à l'utilisateur de valider/ajuster
3. Suggérer de restructurer le PRD source d'abord

## Exemple complet

**Entrée (projet-ecommerce.md):**
```markdown
# Projet E-commerce

## 1. Authentification
- Login/Register
- OAuth Google
- Reset password

## 2. Catalogue produits
- Liste produits
- Recherche
- Filtres

## 3. Panier
- Ajouter/Supprimer
- Modifier quantités

## 4. Checkout
- Paiement Stripe
- Validation commande

## 5. Admin
- Gestion produits
- Gestion commandes
```

**Sortie (si .ralph/concepts/ est vide):**
```
.ralph/concepts/
├── 001-auth.md
├── 002-catalogue.md
├── 003-panier.md
├── 004-checkout.md
└── 005-admin.md

.ralph/ROADMAP.md (avec ordre: 001-auth → 002-catalogue → 003-panier → 004-checkout → 005-admin)
```

**Sortie (si .ralph/concepts/ contient déjà 001-setup.md, 002-config.md, 003-db.md):**
```
.ralph/concepts/
├── 001-setup.md       (existant)
├── 002-config.md      (existant)
├── 003-db.md          (existant)
├── 004-auth.md        (nouveau)
├── 005-catalogue.md   (nouveau)
├── 006-panier.md      (nouveau)
├── 007-checkout.md    (nouveau)
└── 008-admin.md       (nouveau)

.ralph/ROADMAP.md (mise à jour avec les nouveaux PRDs 004-008)
```
