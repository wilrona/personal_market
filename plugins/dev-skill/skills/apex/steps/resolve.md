# 🔧 APEX - Étape 6 : RESOLVE

## Objectif

Corriger les findings critiques et moyens détectés lors de l'étape EXAMINE.

---

## Instructions

### 1. Priorisation

Récupère la liste des findings de l'étape EXAMINE et traite-les dans cet ordre :
1. **CRITICAL** en premier
2. **MEDIUM** ensuite
3. **LOW** uniquement si mode auto ET temps disponible

### 2. Résolution systématique

Pour **CHAQUE finding à corriger** :

```markdown
### Finding X : [Description]

**Criticité** : CRITICAL / MEDIUM / LOW

**Analyse** :
[Pourquoi c'est un problème]

**Solution** :
[Comment tu vas le corriger]

**Implémentation** :
[Modifications effectuées avec Write/Edit]

**Vérification** :
[Comment tu vérifies que c'est corrigé]

**Statut** : ✅ RÉSOLU
```

### 3. Règles de correction

⚠️ **IMPORTANT** :
- Ne casse pas le code existant
- Reste cohérent avec les patterns du projet
- Ne sur-corrige pas (garde la simplicité)
- Si un finding nécessite un refactoring majeur : demande confirmation à l'utilisateur

### 4. Re-validation après corrections

Une fois TOUS les findings critiques/medium corrigés :

1. **Vérifie** que le code compile toujours
2. **Re-vérifie** les critères d'acceptation du PLAN
3. **Assure** qu'aucune régression n'a été introduite

---

## 📍 Prochaine étape

Une fois les corrections terminées :

{{#if test_mode}}
✅ **Mode test activé** : Passe aux tests.

Affiche : "✅ Corrections appliquées. Passage aux tests..."

👉 **Charge maintenant** : `${CLAUDE_PLUGIN_ROOT}/steps/test.md`
{{else}}
{{#if pr_mode}}
✅ **Mode PR activé** : Passe à la création de la PR.

Affiche : "✅ Corrections appliquées. Passage à la création de la PR..."

👉 **Charge maintenant** : `${CLAUDE_PLUGIN_ROOT}/steps/pr.md`
{{else}}
✅ **Workflow terminé !**

Affiche : "🎉 Feature implémentée, validée, reviewée et corrigée avec succès !"

Propose à l'utilisateur :
- Tester manuellement
- Lancer les tests avec `/apex -T`
- Créer une PR avec `/apex -P`
{{/if}}
{{/if}}
