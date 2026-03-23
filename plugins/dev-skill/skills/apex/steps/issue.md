# 🎫 APEX - Étape ISSUE : Création ou Reprise d'une Issue GitHub

## Objectif

Créer une nouvelle issue GitHub ou reprendre une issue existante, puis s'assurer qu'elle est bien structurée.

---

## Instructions

### Déterminer le mode

- **Si `issue_number` est déjà défini** (l'utilisateur a passé `-I 42`) → **Mode REPRISE** (aller à la section "Reprise d'une issue existante")
- **Sinon** → **Mode CRÉATION** (aller à la section "Création d'une nouvelle issue")

---

## Mode CRÉATION : Nouvelle issue

### 1. Extraction du titre

Génère un titre concis (< 70 caractères) à partir de la demande utilisateur.
Le titre doit être clair, actionnable et en cohérence avec le style des issues existantes du repo.

### 2. Génération du body

Rédige un body structuré en markdown :

```markdown
## Contexte

[Description du besoin et du contexte fonctionnel]

## Critères d'acceptation

- [ ] Critère 1
- [ ] Critère 2
- [ ] Critère 3

## Notes techniques

- [Pistes d'implémentation ou contraintes identifiées]
```

### 3. Création de l'issue

Exécute la commande suivante via Bash :

```bash
gh issue create --title "Titre de l'issue" --body "$(cat <<'EOF'
[body généré]
EOF
)"
```

### 4. Capture et affichage

Capture le numéro de l'issue retourné par `gh issue create` et stocke-le dans `issue_number`.

Affiche le résumé :

```
🎫 Issue créée avec succès

Numéro: #[issue_number]
Titre: [titre]
URL: [url retournée par gh]
```

→ Passe à la section "Prochaine étape".

---

## Mode REPRISE : Issue existante

### 1. Récupération de l'issue

Récupère le contenu de l'issue via Bash :

```bash
gh issue view {issue_number} --json title,body,labels,state,url
```

### 2. Analyse du contenu

- Lis le titre et le body de l'issue
- Extrais la description de la feature / du bug à partir du contenu
- Cette description remplace la demande utilisateur comme contexte pour les étapes suivantes

### 3. Vérification de la structure

Vérifie que le body contient les sections attendues (Contexte, Critères d'acceptation, Notes techniques).

- **Si le body est bien structuré** → Confirme : `✅ Issue #[issue_number] récupérée - structure OK`
- **Si le body manque de structure ou d'informations** → Met à jour le body pour le compléter/restructurer :
  ```bash
  gh issue edit {issue_number} --body "$(cat <<'EOF'
  [body restructuré avec les sections manquantes]
  EOF
  )"
  ```
  Affiche : `🔄 Issue #[issue_number] restructurée avec les sections manquantes`

### 4. Affichage du résumé

```
🎫 Issue existante reprise

Numéro: #[issue_number]
Titre: [titre de l'issue]
URL: [url]
Description extraite: [résumé de la demande]
```

---

## 📍 Prochaine étape

L'issue est prête. **Tu DOIS maintenant charger l'étape d'analyse** :

👉 **Lis maintenant le fichier** : `${CLAUDE_PLUGIN_ROOT}/steps/analyse.md`

Une fois lu, suis les instructions de ce fichier. L'analyse pourra mettre à jour l'issue si nécessaire grâce à `issue_number`.
