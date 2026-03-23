# 🚀 APEX - Étape 8 : PR (Pull Request)

## Objectif

Créer automatiquement une Pull Request de qualité avec un titre et une description appropriés.

---

## Instructions

### 1. Vérification préalable

Avant de créer la PR, vérifie :

```bash
# Statut Git
git status

# Différences depuis main
git diff main...HEAD
```

### 2. Analyse des changements

Examine **TOUS les commits** depuis le point de divergence de la branche :

```bash
# Historique des commits de la branche
git log main..HEAD

# Différence complète
git diff main...HEAD
```

⚠️ **CRITIQUE** : Regarde **TOUS les commits**, pas juste le dernier !

### 3. Création du titre et de la description

#### A. Titre de la PR

Format : `[Type] Courte description (< 70 caractères)`

Types :
- `feat:` Nouvelle feature
- `fix:` Correction de bug
- `refactor:` Refactoring
- `perf:` Amélioration de performance
- `docs:` Documentation
- `test:` Ajout de tests

**Exemple** : `feat: Ajoute système de bookmarks publics`

#### B. Description de la PR

```markdown
## 📝 Summary

[1-3 bullet points résumant les changements principaux]

## 🎯 Motivation

[Pourquoi cette PR ? Quel problème elle résout ?]

## 🔧 Changes

[Liste détaillée des modifications par catégorie]

### Added
- Feature 1
- Feature 2

### Modified
- Component X
- Module Y

### Removed
- Old feature Z

## ✅ Testing

[Comment tester cette PR]

- [ ] Tests unitaires passent
- [ ] Tests d'intégration passent
- [ ] Testé manuellement
- [ ] Pas de régression

## 📸 Screenshots (si applicable)

[Si changements UI, ajoute des screenshots]

## 🔗 Related Issues

[Lien vers les issues si applicable]
```

### 4. Création de la PR

Utilise `gh` CLI pour créer la PR :

```bash
gh pr create --title "Le titre" --body "$(cat <<'EOF'
La description complète ici
EOF
)"
```

### 5. Gestion des erreurs

Si la branche n'est pas pushée :
```bash
git push -u origin $(git branch --show-current)
```

Si pas de commits :
```bash
# Informe l'utilisateur qu'il n'y a rien à committer
```

---

## 📍 Fin du workflow

Une fois la PR créée :

```markdown
✅ **Pull Request créée avec succès !**

🔗 URL : [URL de la PR]

**Prochaines étapes suggérées** :
1. Reviewer la PR sur GitHub
2. Demander une review à un collègue
3. Attendre les checks CI/CD
4. Merger une fois approuvée
```

🎉 **Workflow APEX terminé avec succès !**
