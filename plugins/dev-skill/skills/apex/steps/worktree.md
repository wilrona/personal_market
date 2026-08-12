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

Deux chemins possibles. **Vérifie d'abord si le projet expose son propre script
de création de worktree**, puis choisis en conséquence.

```bash
node -e "process.exit(require('./package.json').scripts?.['worktree:create']?0:1)" 2>/dev/null \
  && echo PROJECT_SCRIPT || echo GENERIC
```

#### Cas A — le projet a son script (`PROJECT_SCRIPT`)

Un `git worktree add` nu produirait un worktree **non démarrable** : dans la
plupart des projets le fichier d'environnement est ignoré par git, donc absent.
S'y ajoutent le port à choisir sans collision, les variables qui en dépendent, et
les dépendances à installer. Le script du projet sait tout cela ; pas nous.

```bash
yarn worktree:create {nom-branche}
```

Il crée la branche, le worktree, et le rend démarrable. **Lis sa sortie** : elle
indique le chemin réel du worktree et le port attribué — ne les devine pas, les
conventions varient d'un projet à l'autre.

Si la commande échoue, dis-le et bascule sur le cas B plutôt que de t'arrêter.
Précise alors que le worktree n'est pas configuré.

#### Cas B — pas de script (`GENERIC`)

**Chemin cible** : `.worktrees/{nom-branche}`

```bash
git worktree add .worktrees/{nom-branche} -b {nom-branche}
```

⚠️ Ce worktree n'a **ni fichier d'environnement, ni dépendances installées**. Il
convient pour écrire du code, lancer le lint et la vérification de types ; il ne
permet pas de démarrer l'application. Signale-le dans le résumé.

### 3. Affichage du résumé

Cas A :

```
🌳 Worktree créé avec succès (script du projet)

Branche: {nom-branche}
Chemin: {chemin retourné par le script}
Port: {port retourné par le script}
Commande: cd {chemin}
```

Cas B :

```
🌳 Worktree créé avec succès

Branche: {nom-branche}
Chemin: .worktrees/{nom-branche}
Commande: cd .worktrees/{nom-branche}

⚠️ Environnement non configuré — le projet n'expose pas de script de worktree.
   L'application n'est pas démarrable en l'état.
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
