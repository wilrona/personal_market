# 🔍 APEX - Étape 5 : EXAMINE

## Objectif

Lancer des agents spécialisés pour reviewer le code implémenté et identifier des problèmes potentiels.

---

## Instructions

### 1. Agents de review à lancer

Lance **EN PARALLÈLE** les agents suivants (utilise le tool Task) :

#### A. Code Reviewer (obligatoire)
```
subagent_type: "pr-review-toolkit:code-reviewer"
prompt: "Review le code récemment implémenté pour cette feature. Vérifie :
- Le respect des patterns du projet
- La qualité du code
- Les violations de style
- Les problèmes potentiels"
```

#### B. Silent Failure Hunter (obligatoire)
```
subagent_type: "pr-review-toolkit:silent-failure-hunter"
prompt: "Analyse le code implémenté pour détecter :
- Les erreurs silencieuses potentielles
- Les mauvaises gestions d'erreurs
- Les fallbacks inappropriés
- Les suppressions d'erreurs"
```

{{#if has_types}}
#### C. Type Design Analyzer (si TypeScript)
```
subagent_type: "pr-review-toolkit:type-design-analyzer"
prompt: "Analyse la qualité du design des types ajoutés :
- Encapsulation
- Expression des invariants
- Utilité des types
- Enforcement"
```
{{/if}}

### 2. Collecte des findings

Une fois que **TOUS** les agents ont terminé, collecte leurs findings :

```markdown
## 📋 Résultats de la review

### Code Reviewer
[Résumé des findings]

### Silent Failure Hunter
[Résumé des findings]

{{#if has_types}}
### Type Design Analyzer
[Résumé des findings]
{{/if}}
```

### 3. Triage des findings

Classe les findings par **criticité** :

```markdown
## 🚨 Findings par criticité

### CRITICAL (doit être fixé)
- Finding 1
- Finding 2

### MEDIUM (devrait être fixé)
- Finding 3
- Finding 4

### LOW (optionnel)
- Finding 5
- Finding 6
```

---

## 📍 Prochaine étape

Selon les findings :

{{#if has_critical_findings}}
⚠️ **Findings critiques détectés** : Passe à la résolution.

Affiche : "⚠️ Findings critiques détectés. Passage à la résolution..."

👉 **Charge maintenant** : `${CLAUDE_PLUGIN_ROOT}/steps/resolve.md`
{{else}}
{{#if auto_mode}}
✅ **Pas de findings critiques + mode auto** : Skip la résolution.

{{#if test_mode}}
Affiche : "✅ Review terminée sans findings critiques. Passage aux tests..."

👉 **Charge maintenant** : `${CLAUDE_PLUGIN_ROOT}/steps/test.md`
{{else}}
{{#if pr_mode}}
Affiche : "✅ Review terminée. Passage à la création de la PR..."

👉 **Charge maintenant** : `${CLAUDE_PLUGIN_ROOT}/steps/pr.md`
{{else}}
✅ **Workflow terminé !**

Affiche : "🎉 Feature implémentée, validée et reviewée avec succès !"
{{/if}}
{{/if}}
{{else}}
❓ **Demande à l'utilisateur** : "Review terminée. Findings détectés (voir ci-dessus). Voulez-vous que je les corrige ?"

Si oui → Charge `${CLAUDE_PLUGIN_ROOT}/steps/resolve.md`
Si non → Continue vers test ou PR selon les modes activés
{{/if}}
{{/if}}
