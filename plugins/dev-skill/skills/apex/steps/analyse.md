# 📊 APEX - Étape 1 : ANALYSE

## Objectif

Explorer le code existant pour comprendre l'architecture et identifier les fichiers pertinents pour implémenter la feature.

---

## Instructions

### 1. Lancement des agents d'exploration

{{#if economy_mode}}
**Mode économie activé** : Lance UN SEUL agent Explore pour analyser le code.
{{else}}
**Mode normal** : Lance DEUX à TROIS agents Explore en parallèle pour :
- Analyser l'architecture globale
- Identifier les patterns existants
- Trouver les fichiers similaires à modifier
{{/if}}

**Utilise le tool Task avec subagent_type="Explore"** pour lancer les agents.

### 2. Questions à répondre

Les agents doivent répondre à :

- Quelle est l'architecture du projet ? (Next.js, React, Vue, etc.)
- Où se trouvent les fichiers similaires à la feature demandée ?
- Quels sont les patterns de code existants à respecter ?
- Y a-t-il des composants/utils réutilisables ?
- Quelles sont les dépendances nécessaires ?

### 3. Synthèse des résultats

Une fois que les agents ont terminé, **synthétise leurs découvertes** en une liste concise :

```markdown
## 📋 Résultats de l'analyse

**Architecture** : [Next.js App Router / React / etc.]

**Fichiers clés identifiés** :
- `path/to/file1.ts` - Description
- `path/to/file2.tsx` - Description

**Patterns à respecter** :
- Pattern 1
- Pattern 2

**Dépendances nécessaires** :
- package1
- package2

**Composants réutilisables** :
- Component1
- Component2
```

### 4. Mise à jour de l'issue (si applicable)

**Si `issue_number` existe** (c.-à-d. l'étape ISSUE a été exécutée avant) :

1. Compare les résultats de l'analyse avec le contenu actuel de l'issue
2. Si des incohérences ou des informations complémentaires importantes sont identifiées :
   - Met à jour le body de l'issue avec les nouvelles informations via :
   ```bash
   gh issue edit {issue_number} --body "$(cat <<'EOF'
   [body mis à jour avec les résultats de l'analyse]
   EOF
   )"
   ```
   - Affiche : `🔄 Issue #{issue_number} mise à jour avec les résultats de l'analyse`
3. Sinon, confirme : `✅ Issue #{issue_number} cohérente avec l'analyse, aucune mise à jour nécessaire`

---

## 📍 Prochaine étape

{{#if issue_mode}}
  {{#if worktree_mode}}
👉 **Charge maintenant** : `${CLAUDE_PLUGIN_ROOT}/steps/worktree.md`
  {{else}}
    {{#if auto_mode}}
👉 **Charge maintenant** : `${CLAUDE_PLUGIN_ROOT}/steps/plan.md`
    {{else}}
✅ **APEX terminé** - Issue créée et analyse effectuée. Le workflow s'arrête ici.
    {{/if}}
  {{/if}}
{{else}}
  {{#if auto_mode}}
✅ **Mode auto activé** : Passe automatiquement à la planification.
  {{else}}
❓ **Demande confirmation** : "Analyse terminée. Prêt à passer à la planification ?"

Attends la réponse de l'utilisateur avant de continuer.
  {{/if}}

👉 **Charge maintenant** : `${CLAUDE_PLUGIN_ROOT}/steps/plan.md`
{{/if}}
