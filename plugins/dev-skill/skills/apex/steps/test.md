# 🧪 APEX - Étape 7 : TEST

## Objectif

Lancer les tests pour vérifier que la feature fonctionne et qu'aucune régression n'a été introduite.

---

## Instructions

### 1. Identification de la commande de test

Détecte automatiquement la commande de test du projet :

```bash
# Vérifie package.json
cat package.json | grep '"test"'
```

Commandes courantes :
- `npm test`
- `npm run test`
- `pnpm test`
- `yarn test`
- `bun test`

### 2. Exécution des tests

Lance les tests avec la commande détectée :

```bash
# Exemple
npm test
```

### 3. Analyse des résultats

#### A. Si tous les tests passent ✅

```markdown
## ✅ Tests réussis

**Résultats** :
- X tests passés
- 0 tests échoués

Tous les tests passent avec succès !
```

#### B. Si des tests échouent ❌

```markdown
## ❌ Tests échoués

**Résultats** :
- X tests passés
- Y tests échoués

**Tests en échec** :
1. Test 1 : Description de l'erreur
2. Test 2 : Description de l'erreur

**Action** : Analyse et correction en cours...
```

### 4. Correction des tests en échec

Si des tests échouent :

1. **Analyse** l'erreur de chaque test
2. **Détermine** si c'est :
   - Un bug dans ton implémentation → Corrige le code
   - Un test obsolète → Demande à l'utilisateur s'il faut l'update
   - Un test qui doit être ajouté → Ajoute-le

3. **Corrige** le problème
4. **Re-lance** les tests
5. **Répète** jusqu'à ce que tous les tests passent

### 5. Boucle de correction

⚠️ **IMPORTANT** : Ne passe à l'étape suivante que si **TOUS** les tests passent.

Maximum 5 tentatives de correction. Si après 5 tentatives, des tests échouent encore :
- Affiche un résumé des problèmes
- Demande à l'utilisateur comment procéder

---

## 📍 Prochaine étape

Une fois TOUS les tests en succès :

{{#if pr_mode}}
✅ **Mode PR activé** : Passe à la création de la PR.

Affiche : "✅ Tous les tests passent. Passage à la création de la PR..."

👉 **Charge maintenant** : `${CLAUDE_PLUGIN_ROOT}/steps/pr.md`
{{else}}
✅ **Workflow terminé !**

Affiche : "🎉 Feature implémentée, validée, reviewée et testée avec succès !"

Propose à l'utilisateur :
- Créer une PR avec `/apex -P`
- Committer les changements
{{/if}}
