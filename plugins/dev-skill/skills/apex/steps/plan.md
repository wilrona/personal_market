# 📐 APEX - Étape 2 : PLAN

## Objectif

Créer un plan d'implémentation détaillé avec architecture, étapes techniques et critères d'acceptation.

---

## Instructions

### 1. Analyse de la demande

Basé sur :
- La demande utilisateur originale
- Les résultats de l'analyse de l'étape précédente

### 2. Crée un plan détaillé

Ton plan doit inclure **OBLIGATOIREMENT** :

#### A. Architecture Overview

```markdown
## 🏗️ Architecture

**Approche** : [Description de l'approche technique]

**Composants à créer** :
- Component1 : Responsabilité
- Component2 : Responsabilité

**Composants à modifier** :
- ExistingComponent1 : Modifications nécessaires
- ExistingComponent2 : Modifications nécessaires

**Flux de données** :
1. Étape 1
2. Étape 2
3. Étape 3
```

#### B. Implementation Steps

```markdown
## 📝 Étapes d'implémentation

### Étape 1 : [Titre]
- Fichier : `path/to/file`
- Action : Description précise
- Raison : Pourquoi cette modification

### Étape 2 : [Titre]
- Fichier : `path/to/file`
- Action : Description précise
- Raison : Pourquoi cette modification

[...] Toutes les étapes nécessaires
```

#### C. Testing Strategy

```markdown
## 🧪 Stratégie de test

**Tests à implémenter** :
- Test 1 : Description
- Test 2 : Description

**Scénarios à vérifier** :
- Scénario 1
- Scénario 2
```

#### D. Acceptance Criteria

```markdown
## ✅ Critères d'acceptation

- [ ] Critère 1 : Description précise et vérifiable
- [ ] Critère 2 : Description précise et vérifiable
- [ ] Critère 3 : Description précise et vérifiable

**Ces critères seront vérifiés à l'étape VALIDATE.**
```

#### E. Risks & Considerations

```markdown
## ⚠️ Risques et considérations

**Risques identifiés** :
- Risque 1 : Description et mitigation
- Risque 2 : Description et mitigation

**Points d'attention** :
- Point 1
- Point 2
```

---

## 📍 Prochaine étape

Une fois le plan créé et affiché :

{{#if auto_mode}}
✅ **Mode auto activé** : Passe automatiquement à l'exécution.

Affiche : "✅ Plan créé. Passage automatique à l'exécution..."
{{else}}
❓ **Demande validation** : "Plan créé. Souhaitez-vous que je procède à l'implémentation ?"

Attends la réponse de l'utilisateur. Si l'utilisateur demande des modifications au plan, modifie-le avant de continuer.
{{/if}}

👉 **Charge maintenant** : `${CLAUDE_PLUGIN_ROOT}/steps/execute.md`
