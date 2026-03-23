# ✅ APEX - Étape 4 : VALIDATE

## Objectif

Vérifier que TOUS les critères d'acceptation définis dans le PLAN sont respectés.

---

## Instructions

### 1. Récupération des critères

Récupère la liste des **Acceptance Criteria** définie à l'étape PLAN.

### 2. Validation systématique

Pour **CHAQUE critère** :

```markdown
### Critère X : [Description du critère]

**Vérification** :
- [Comment tu as vérifié ce critère]
- [Preuves : fichiers modifiés, code ajouté, etc.]

**Statut** : ✅ VALIDÉ / ❌ NON VALIDÉ
```

### 3. Correction si nécessaire

Si un critère n'est **PAS validé** :

1. **Identifie** ce qui manque
2. **Implémente** la correction immédiatement
3. **Re-vérifie** le critère
4. **Continue** avec les autres critères

### 4. Synthèse finale

À la fin de la validation, affiche :

```markdown
## 📊 Résultats de la validation

**Critères validés** : X/Y

{{#if tous_valides}}
✅ **TOUS les critères d'acceptation sont respectés !**
{{else}}
⚠️ **Critères non validés** :
- Critère A : Raison
- Critère B : Raison

Action : Correction en cours...
{{/if}}
```

### 5. Assure la complétude

⚠️ **CRITIQUE** : Ne passe à l'étape suivante que si **TOUS** les critères sont validés.

Si des critères ne sont pas validés :
- Corrige-les immédiatement
- Re-valide
- Répète jusqu'à ce que tout soit ✅

---

## 📍 Prochaine étape

Une fois TOUS les critères validés :

{{#if examine_mode}}
✅ **Mode examine activé** : Passe à la review du code.

Affiche : "✅ Validation terminée. Passage à l'examination du code..."

👉 **Charge maintenant** : `${CLAUDE_PLUGIN_ROOT}/steps/examine.md`
{{else}}
{{#if test_mode}}
✅ **Mode test activé** : Passe aux tests.

Affiche : "✅ Validation terminée. Passage aux tests..."

👉 **Charge maintenant** : `${CLAUDE_PLUGIN_ROOT}/steps/test.md`
{{else}}
{{#if pr_mode}}
✅ **Mode PR activé** : Passe à la création de la PR.

Affiche : "✅ Validation terminée. Passage à la création de la PR..."

👉 **Charge maintenant** : `${CLAUDE_PLUGIN_ROOT}/steps/pr.md`
{{else}}
✅ **Workflow terminé !**

Affiche : "🎉 Feature implémentée et validée avec succès !"

Propose à l'utilisateur :
- Tester manuellement
- Lancer les tests avec `/apex -T`
- Faire une review avec `/apex -X`
- Créer une PR avec `/apex -P`
{{/if}}
{{/if}}
{{/if}}
