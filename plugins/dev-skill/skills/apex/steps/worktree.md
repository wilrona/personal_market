# 🌳 APEX - Étape WORKTREE : Création d'un Git Worktree Isolé

## Objectif

Créer un git worktree dans un répertoire isolé pour travailler sur la feature sans impacter la branche courante.

---

## Instructions

### 1. Génération du nom de branche

**Slugification de la description** :
- Minuscules
- Remplacer espaces et caractères spéciaux par des tirets
- Supprimer les accents
- Tronquer à ~50 caractères
- Exemple : "Ajoute un système de likes" → `ajoute-un-systeme-de-likes`

**Nom de branche** :
- Si `issue_number` existe → `feat/{issue_number}-{slug}`
- Sinon → `feat/{slug}`

### 2. Création du worktree

**Chemin cible** : `.worktrees/{nom-branche}`

Exécute via Bash :

```bash
git worktree add .worktrees/{nom-branche} -b {nom-branche}
```

### 3. Affichage du résumé

```
🌳 Worktree créé avec succès

Branche: {nom-branche}
Chemin: .worktrees/{nom-branche}
Commande: cd .worktrees/{nom-branche}
```

---

## 📍 Prochaine étape

Le worktree est créé.

{{#if auto_mode}}
**Mode auto activé** : Passage automatique à l'étape suivante.

- **Si l'analyse a déjà été faite** (c.-à-d. `issue_mode` était activé et l'analyse a été exécutée avant le worktree) → 👉 Lis `${CLAUDE_PLUGIN_ROOT}/steps/plan.md`
- **Sinon** (worktree sans issue, l'analyse n'a pas encore été faite) → 👉 Lis `${CLAUDE_PLUGIN_ROOT}/steps/analyse.md`
{{else}}
✅ **Worktree prêt.** Le workflow s'arrête ici.

Affiche :
```
✅ APEX terminé - Worktree prêt

Tu peux maintenant travailler dans : .worktrees/{nom-branche}
Pour lancer le workflow complet depuis le worktree :
  cd .worktrees/{nom-branche} && /apex -A [description]
```
{{/if}}
