# Bonnes Pratiques d'Écriture de PRD

Ce guide présente les bonnes pratiques pour rédiger des PRD efficaces, clairs et actionnables.

---

## ✍️ Principes Généraux d'Écriture

### 1. Clarté et Concision

**DO** ✅:
- Phrases courtes et directes
- Vocabulaire simple et précis
- Une idée par phrase
- Paragraphes courts (3-4 lignes max)

**DON'T** ❌:
- Jargon inutile ou termes ambigus
- Phrases à rallonge avec multiples propositions
- Redondance et répétitions

**Exemple Mauvais** ❌:
```
Le système devrait potentiellement pouvoir, dans la mesure du possible,
permettre aux utilisateurs de, éventuellement, soumettre leurs informations
personnelles de manière sécurisée, en fonction des conditions...
```

**Exemple Bon** ✅:
```
Le système permet aux utilisateurs de soumettre leurs informations
personnelles de manière sécurisée via HTTPS.
```

### 2. Spécificité et Mesurabilité

**DO** ✅:
- Objectifs chiffrés avec timeline
- Critères de succès mesurables
- Seuils de performance explicites

**DON'T** ❌:
- Termes vagues: "améliorer", "optimiser", "rapidement"
- Objectifs non mesurables
- Absence de timeline

**Exemple Mauvais** ❌:
```
Objectif: Améliorer la performance du système
```

**Exemple Bon** ✅:
```
Objectif: Réduire le temps de réponse API à < 100ms (P95) d'ici Q2 2024
```

### 3. Structure et Organisation

**DO** ✅:
- Utiliser des titres et sous-titres clairs (H1, H2, H3)
- Numéroter les listes d'étapes
- Utiliser des tableaux pour comparaisons
- Ajouter une table des matières pour PRD > 10 pages

**DON'T** ❌:
- Longs paragraphes sans structure
- Informations dispersées
- Absence de hiérarchie visuelle

### 4. Visual Aids

**DO** ✅:
- Diagrammes pour architecture/flows
- Tableaux pour données structurées
- Checkboxes pour items à tracker
- Emojis pour repérage rapide (📋 🎯 ⚠️)

**Exemples** :
- User Flow: Utiliser des steps numérotés ou diagramme ASCII
- Architecture: Diagramme en boxes et flèches
- Risques: Tableau avec Impact/Probabilité
- Planning: Timeline visuelle

---

## 📝 Best Practices par Type de PRD

### PRD Technique

#### 1. Architecture d'Abord
**Commencer par le big picture** avant les détails.

Structure recommandée :
1. Architecture de haut niveau (diagramme)
2. Composants principaux (description)
3. Détails techniques par composant
4. APIs et interfaces

#### 2. Code Examples
Inclure des exemples de code pour :
- Schémas database (SQL)
- Request/Response API (JSON)
- Configuration (YAML, ENV)

**Format** : Utiliser des code blocks avec syntax highlighting
````markdown
```sql
CREATE TABLE users (...);
```

```json
{
  "user_id": "123",
  "name": "John Doe"
}
```
````

#### 3. Performance Quantifiée
**Toujours** donner des chiffres précis :
- Response time: < 100ms (P95)
- Throughput: 100 req/s
- Database queries: < 3 per request

**Pas de** : "Le système sera rapide"

#### 4. Sécurité Non-Négociable
Toujours inclure une section sécurité couvrant :
- Authentification
- Autorisation
- Validation inputs
- Protection (CSRF, XSS, SQL Injection)

#### 5. Rollback Plan
**Obligatoire** : Plan de rollback en cas de problème

**Contenu** :
- Critères de rollback (quand ?)
- Procédure step-by-step
- Data integrity (comment garantir ?)
- Temps estimé de rollback

### PRD Produit

#### 1. User-Centric
**Toujours** partir de l'utilisateur :
1. Qui est l'utilisateur ? (Personas)
2. Quel est son problème ? (Pain points)
3. Comment la feature résout le problème ? (Solution)
4. Quelle valeur apporte-t-elle ? (Benefits)

#### 2. User Stories Format Rigoureux
Format standard :
```markdown
**En tant que** [rôle]
**Je veux** [action]
**Afin de** [bénéfice]

**Critères d'Acceptation**:
- [ ] Critère 1 (mesurable, testable)
- [ ] Critère 2
```

**Éviter** :
- Stories techniques ("En tant que développeur...")
- Absence de "Afin de" (le WHY est crucial)
- Critères vagues ("ça fonctionne bien")

#### 3. Prioritization MoSCoW
Classifier toutes les user stories :
- **Must Have (P0)** : Bloquant pour launch
- **Should Have (P1)** : Important mais pas bloquant
- **Could Have (P2)** : Nice-to-have
- **Won't Have** : Explicitement exclu (pour clarifier scope)

**Règle** : Si tout est P0, rien n'est P0. Être honnête sur les priorités.

#### 4. UX Détaillée
Pour chaque écran décrire :
- **Description** : Ce que l'utilisateur voit
- **Éléments UI** : Liste exhaustive des composants
- **Actions** : Ce que l'utilisateur peut faire
- **États** : Loading, Success, Error, Empty

**Bonus** : Lien vers designs Figma/Sketch

#### 5. Edge Cases & Erreurs
**Ne pas oublier** les cas limites :
- Email invalide → Message d'erreur clair
- Réseau indisponible → Retry mechanism
- État vide (no data) → Empty state avec CTA
- Permissions insuffisantes → Message explicite

**Format tableau recommandé** :
| Cas | Comportement Attendu |
|-----|---------------------|

#### 6. Analytics Tracking
Définir **tous** les events à tracker :
```javascript
track('feature_action', {
  property1: value1,
  property2: value2
});
```

**Inclure** :
- Event name (snake_case)
- Properties (ce qu'on track)
- Quand tracker (trigger)

### PRD Stratégique

#### 1. Business Case Solide
Le business case doit être **convaincant** avec :
- **Problème quantifié** : Coût actuel du problème ($)
- **Opportunité quantifiée** : Taille du marché ($)
- **ROI projeté** : Tableau Year 1, 2, 3 avec break-even

**Sans chiffres = pas de business case**

#### 2. Storytelling
Un PRD stratégique raconte une histoire :
1. **Acte 1** : Situation actuelle (problème)
2. **Acte 2** : Solution proposée (comment)
3. **Acte 3** : Futur état (vision)

**Utiliser** : Langage inspirant mais data-driven

#### 3. Competitive Intelligence
Analyse concurrentielle approfondie :
- Qui sont les concurrents ?
- Qu'est-ce qu'ils font bien ? (Forces)
- Où sont leurs faiblesses ? (Opportunités)
- Comment nous différencions-nous ?

**Format tableau** pour comparaisons visuelles

#### 4. Roadmap Multi-Phases
Diviser en phases avec :
- **Phase 1** : Foundation (bases)
- **Phase 2** : Growth (croissance)
- **Phase 3** : Scale (échelle)

Chaque phase :
- Objectif clair
- Initiatives clés
- Success metrics
- Timeline

#### 5. Risques Stratégiques
Identifier les **big risks** :
- Market risk (et si le marché n'existe pas ?)
- Execution risk (et si on n'arrive pas à livrer ?)
- Competitive risk (et si un concurrent nous devance ?)

**Pour chaque risque** :
- Mitigation (comment réduire probabilité)
- Contingency (plan B si ça arrive)

#### 6. Go/No-Go Decision Points
**Crucial** : Définir des checkpoints pour décider :
- Continue (on avance)
- Pivot (on change de direction)
- Stop (on arrête)

**Exemple** :
```markdown
#### Checkpoint 1 (End of Phase 1)
- **Criteria**: 10K users acquired, < $5 CAC
- **Decision**: Continue | Pivot | Stop
- **Date**: Q2 2024
```

#### 7. North Star Metric
**Une seule métrique** qui représente la valeur :
- Airbnb: Nights booked
- Facebook: Daily Active Users
- Stripe: Payment volume

**Pas de** : 10 métriques "importantes". UNE seule North Star.

---

## 🎯 Checklist Qualité PRD

### Avant de Partager un PRD

#### Complétude
- [ ] Toutes les sections obligatoires présentes
- [ ] Aucune section "[TBD]" ou "[TODO]"
- [ ] Références/liens fonctionnent
- [ ] Exemples concrets fournis

#### Clarté
- [ ] Résumé exécutif compréhensible en < 2 min
- [ ] Aucun terme ambigu ou jargon non défini
- [ ] Diagrammes/tableaux aident à la compréhension
- [ ] Structure logique avec titres clairs

#### Actionnabilité
- [ ] Objectifs mesurables avec timeline
- [ ] Critères de succès explicites
- [ ] Owners identifiés pour chaque phase
- [ ] Next steps clairs

#### Complétude Technique (PRD Technique)
- [ ] Architecture diagrammée
- [ ] APIs documentées (request/response)
- [ ] Database schema défini
- [ ] Tests strategy définie
- [ ] Security considérée

#### Complétude Produit (PRD Produit)
- [ ] Personas définis
- [ ] User stories avec critères d'acceptation
- [ ] UX décrite par écran
- [ ] Edge cases couverts
- [ ] Analytics events définis

#### Complétude Stratégique (PRD Stratégique)
- [ ] Business case avec ROI
- [ ] Analyse marché et concurrence
- [ ] Roadmap multi-phases
- [ ] Budget détaillé
- [ ] Risques stratégiques identifiés

---

## ❌ Anti-Patterns à Éviter

### 1. Le PRD Catalogue
**Problème** : Liste de features sans contexte, priorités, ou justification

**Solution** : Expliquer le WHY avant le WHAT. Chaque feature doit avoir une justification.

### 2. Le PRD Vague
**Problème** : Objectifs non mesurables, timeline floue, "TBD" partout

**Exemple** ❌:
```
Objectif: Améliorer l'expérience utilisateur
Timeline: Bientôt
```

**Solution** ✅:
```
Objectif: Réduire le temps de chargement de 5s à 2s
Timeline: Q2 2024
```

### 3. Le PRD Roman
**Problème** : 50 pages de texte dense sans structure

**Solution** : Utiliser progressive disclosure. Résumé → Détails. Tableaux et diagrammes.

### 4. Le PRD Incomplet
**Problème** : Sections critiques manquantes (risques, tests, rollback)

**Solution** : Utiliser les templates et checklists pour ne rien oublier

### 5. Le PRD Wishlist
**Problème** : Tout est P0, aucune priorisation réelle

**Solution** : Être honnête. Si tout est critique, rien n'est critique. Utiliser MoSCoW.

### 6. Le PRD Sans Métrics
**Problème** : Aucun moyen de mesurer le succès

**Solution** : Définir 3-5 métriques clés avec baseline et target

### 7. Le PRD Statique
**Problème** : PRD écrit puis jamais mis à jour

**Solution** : PRD = document vivant. Mettre à jour avec learnings, versioning.

---

## 🔄 Lifecycle d'un PRD

### 1. Draft
- Rédigé par PM/Tech Lead
- Sections principales complétées
- Peut contenir [TBD] sur détails mineurs

### 2. Review
- Partagé avec stakeholders
- Feedback collecté
- Itération sur contenu

**Reviewers typiques** :
- **PRD Technique** : Engineering team, Architect, Security
- **PRD Produit** : Design, Engineering, Marketing, Support
- **PRD Stratégique** : Executive team, Finance, Board

### 3. Approved
- Toutes les sections complètes
- Stakeholders ont validé
- Ready pour execution

### 4. Living Document
- Mis à jour pendant l'exécution
- Learnings intégrés
- Versioning (v1.0, v1.1, v2.0)

**Quand mettre à jour** :
- Changement de scope
- Nouveau learning majeur
- Pivot de direction
- Post-mortem après launch

---

## 💡 Tips par Audience

### Pour les Executives
Focus sur :
- Résumé exécutif (1 page max)
- Business case et ROI
- Risques majeurs
- Timeline et budget

**Format** : Executive summary séparé si PRD > 20 pages

### Pour les Engineers
Focus sur :
- Architecture technique
- API specs
- Performance requirements
- Security considerations

**Format** : Liens vers specs techniques détaillées (séparées si nécessaire)

### Pour les Designers
Focus sur :
- User personas et pain points
- User flows
- Écrans et interactions
- Edge cases et états d'erreur

**Format** : Liens vers Figma/prototypes

### Pour le Support
Focus sur :
- Qu'est-ce qui change pour l'utilisateur ?
- Nouveaux flows
- Messages d'erreur possibles
- FAQ anticipée

**Format** : Support playbook séparé basé sur le PRD

---

## 📚 Resources Additionnelles

### Templates
Utiliser les templates fournis dans `assets/` :
- `template-technique.md`
- `template-produit.md`
- `template-strategique.md`

### Examples
Consulter les exemples dans `examples/` :
- `prd-technique-example.md` - Système de gestion de stock
- `prd-produit-example.md` - Inscription newsletter
- `prd-strategique-example.md` - Migration cloud

### Validation
Utiliser le script de validation :
```bash
bash scripts/validate-prd.sh chemin/vers/prd.md
```

---

## ✅ Final Checklist

Avant de considérer un PRD terminé :

- [ ] **Clarté** : Quelqu'un qui découvre le sujet peut comprendre
- [ ] **Complétude** : Toutes sections obligatoires présentes
- [ ] **Actionnabilité** : Équipe sait quoi faire après lecture
- [ ] **Mesurabilité** : On saura si c'est un succès ou non
- [ ] **Réalisme** : Timeline et ressources sont réalistes
- [ ] **Review** : Au moins 2 personnes ont reviewé
- [ ] **Approval** : Stakeholders clés ont approuvé
- [ ] **Versioning** : Document versionné (v1.0)

---

Un bon PRD est :
- **Clair** : Facile à comprendre
- **Complet** : Répond à toutes les questions
- **Concis** : Pas de fluff
- **Actionnable** : L'équipe sait quoi faire
- **Vivant** : Mis à jour avec learnings

**Remember** : Un PRD n'est pas une spec technique exhaustive. C'est un document de décision et d'alignment. Les détails d'implémentation peuvent venir après.
