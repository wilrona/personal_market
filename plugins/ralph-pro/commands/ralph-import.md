---
description: "Convertit un document en PRD compatible Ralph Pro"
argument-hint: "<fichier-source> [nom-prd]"
allowed-tools: ["Read", "Write", "Bash(file:*)", "Glob"]
---

# Ralph Import

Convertit un document existant en PRD compatible Ralph Pro.

## Utilisation

```bash
/ralph-pro:ralph-import specs/requirements.pdf feature-auth
/ralph-pro:ralph-import docs/cahier-des-charges.docx
/ralph-pro:ralph-import notes.txt api-users
```

## Formats supportés

| Format | Extensions | Méthode de lecture |
|--------|------------|-------------------|
| Markdown | .md | Lecture directe |
| Texte | .txt | Lecture directe |
| PDF | .pdf | Extraction avec Read tool |
| Word | .docx | Extraction du contenu |
| JSON | .json | Parse et extraction |

## Arguments

- `<fichier-source>` : Chemin vers le document à convertir (requis)
- `[nom-prd]` : Nom du PRD de sortie (optionnel, déduit du nom de fichier)

## Arguments reçus

$ARGUMENTS

## Ce que tu dois faire

### 1. Parser les arguments

Extraire :
- Le chemin du fichier source
- Le nom du PRD (si fourni, sinon utiliser le nom du fichier sans extension en kebab-case)

### 2. Vérifier que .ralph/ existe

Vérifier que le dossier `.ralph/` existe :
```
Glob: .ralph/concepts/*.md
```

Si `.ralph/` n'existe pas, informer l'utilisateur :
```
⚠️  Le dossier .ralph/ n'existe pas.
    Exécutez d'abord: /ralph-pro:ralph-init
```

### 3. Vérifier la numérotation existante

**IMPORTANT** : Avant de créer le PRD, tu DOIS vérifier les fichiers existants dans `.ralph/concepts/` pour déterminer le prochain numéro.

1. Utiliser Glob pour lister les fichiers existants :
   ```
   Glob: .ralph/concepts/*.md
   ```

2. Analyser les noms de fichiers pour trouver le pattern de numérotation :
   - Pattern attendu : `NNN-nom-feature.md` (ex: `001-auth.md`, `002-api-users.md`)
   - Extraire le plus grand numéro existant
   - Si aucun fichier n'existe ou pas de numérotation → commencer à 001

3. Stocker le prochain numéro disponible

**Exemple :**
```
Fichiers existants dans .ralph/concepts/:
  001-auth.md
  002-api-users.md

→ Prochain numéro: 003
→ Le nouveau PRD sera: .ralph/concepts/003-<nom-prd>.md
```

### 4. Vérifier le fichier source

- Vérifier que le fichier existe
- Identifier son format (extension)

### 5. Lire et analyser le contenu

Lire le fichier source et extraire :
- Le titre/objectif principal
- Les exigences/fonctionnalités demandées
- Les critères de succès/acceptance
- Les contraintes techniques
- Les dépendances

### 6. Générer le PRD formaté

Créer `.ralph/concepts/<NNN>-<nom-prd>.md` avec la numérotation continue :

```markdown
# <Titre du PRD>

> Importé depuis: <fichier-source>
> Date: <date>

## Objectif

<Description claire de l'objectif principal>

## Contexte

<Contexte extrait du document original>

## Exigences fonctionnelles

- [ ] Exigence 1
- [ ] Exigence 2
- [ ] Exigence 3
...

## Exigences techniques

- [ ] Contrainte technique 1
- [ ] Contrainte technique 2
...

## Critères de succès

- [ ] Critère 1
- [ ] Critère 2
- [ ] Tests passent
- [ ] Documentation à jour

## Notes

<Notes additionnelles ou informations importantes>

---
*PRD généré par Ralph Pro Import*
```

### 7. Mettre à jour la ROADMAP

Si `.ralph/ROADMAP.md` existe, ajouter une entrée pour le nouveau PRD :

```markdown
## Ajouté le <date> (import depuis <fichier-source>)

| #   | PRD                  | Statut       | Source           |
|-----|----------------------|--------------|------------------|
| 003 | 003-<nom-prd>.md     | ⏳ En attente | <fichier-source> |
```

### 8. Mettre à jour le @fix_plan.md

Mettre à jour `.ralph/@fix_plan.md` avec les tâches extraites :

```markdown
# Fix Plan - <nom-prd>

## Tâches extraites

- [ ] Tâche 1 (déduite de l'exigence 1)
- [ ] Tâche 2 (déduite de l'exigence 2)
...

## Prochaine étape

Analyser les exigences et commencer l'implémentation.
```

### 9. Afficher la confirmation

```
╔══════════════════════════════════════════════════════════════╗
║  RALPH PRO - Import réussi                                   ║
╠══════════════════════════════════════════════════════════════╣
║  Source: <fichier>                                           ║
║  PRD créé: .ralph/concepts/003-<nom>.md                      ║
║  Numéro attribué: 003                                        ║
║  Exigences extraites: N                                      ║
║  Tâches générées: M                                          ║
╚══════════════════════════════════════════════════════════════╝

Pour lancer Ralph sur ce PRD:
  /ralph-pro:ralph-prd 003-<nom>
```

## Exemples de conversion

### Document informel → PRD structuré

**Entrée (notes.txt):**
```
On veut un système de login avec:
- email/password
- remember me
- reset password
Faut que ça marche sur mobile aussi
```

**Sortie (si .ralph/concepts/ contient déjà 001-setup.md, 002-config.md):**
```
.ralph/concepts/003-login-system.md  (numéro 003 attribué automatiquement)
```

**Contenu de .ralph/concepts/003-login-system.md:**
```markdown
# Système de Login

> Importé depuis: notes.txt
> Date: 2026-01-19
> Numéro: 003

## Objectif
Implémenter un système d'authentification complet.

## Exigences fonctionnelles
- [ ] Authentification email/password
- [ ] Option "Se souvenir de moi"
- [ ] Fonctionnalité de reset password

## Exigences techniques
- [ ] Design responsive (mobile)

## Critères de succès
- [ ] Tous les flows d'auth fonctionnent
- [ ] Tests passent
- [ ] Responsive sur mobile

---
*PRD généré par Ralph Pro Import*
```

**Sortie (si .ralph/concepts/ est vide):**
```
.ralph/concepts/001-login-system.md  (commence à 001)
```

## Conseils

- Plus le document source est structuré, meilleur sera le PRD
- Revise toujours le PRD généré avant de lancer Ralph
- Ajoute des détails si les exigences sont trop vagues
