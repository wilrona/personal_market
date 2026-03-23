# Guide Détaillé des Sections PRD

Ce guide décrit toutes les sections possibles pour chaque type de PRD, avec des explications détaillées sur quand et comment les utiliser.

---

## 📋 Sections Communes (Tous Types)

Ces sections apparaissent dans tous les types de PRD.

### 1. Métadonnées
**Obligatoire** | Placement: En-tête

Informations de base sur le document.

**Contenu**:
- Type de PRD (Technique, Produit, Stratégique)
- Date de création
- Auteur(s)
- Version
- Statut (Draft, Review, Approved)
- Priority (pour PRD Produit) ou Horizon (pour PRD Stratégique)

**Exemple**:
```markdown
- **Type**: PRD Produit
- **Date de création**: 2024-01-16
- **Auteur**: Product Team
- **Version**: 1.0
- **Statut**: Draft
- **Priority**: P1 (High)
```

### 2. Résumé Exécutif
**Obligatoire** | Placement: Début du document

Résumé court (3-5 phrases) pour donner une vue d'ensemble rapide.

**Questions à répondre**:
- Quoi ? (Qu'est-ce qui est construit/lancé ?)
- Pourquoi ? (Quelle opportunité/problème ?)
- Pour qui ? (Utilisateurs cibles)
- Quelle valeur ? (Impact business/technique/stratégique)

**Longueur**: 50-100 mots max

### 3. Contexte
**Obligatoire** | Placement: Après le résumé

Fournit le background nécessaire pour comprendre le PRD.

**Sous-sections communes**:
- **Problème**: Quel problème résolvons-nous ?
- **Solution Proposée**: Vue d'ensemble de la solution
- **Données & Insights**: Chiffres, recherche, analytics
- **Opportunité**: Pourquoi maintenant ?

### 4. Objectifs
**Obligatoire** | Placement: Après contexte

Objectifs mesurables que le PRD vise à atteindre.

**Format**:
- Objectifs SMART (Specific, Measurable, Achievable, Relevant, Time-bound)
- Séparation: Principaux (must-have) vs Secondaires (nice-to-have)
- Non-Objectifs: Clarifier ce qui est hors scope

**Exemple**:
```markdown
### Objectifs Principaux
- [ ] Augmenter conversions de 20% en 3 mois
- [ ] Réduire churn de 5% en 6 mois

### Non-Objectifs
- Ne vise PAS à remplacer le système existant
```

### 5. Métriques de Succès
**Obligatoire** | Placement: Vers la fin

Définir comment mesurer le succès de l'initiative.

**Format tableau recommandé**:
| Métrique | Baseline | Target | Timeframe |
|----------|----------|--------|-----------|
| [Nom] | [Valeur actuelle] | [Objectif] | [Timeline] |

### 6. Risques & Contraintes
**Obligatoire** | Placement: Avant le planning

Identifier les risques potentiels et les contraintes.

**Format tableau recommandé**:
| Risque | Impact | Probabilité | Mitigation |
|--------|--------|-------------|------------|
| [Description] | High/Medium/Low | High/Medium/Low | [Plan] |

### 7. Planning
**Obligatoire** | Placement: Vers la fin

Timeline avec phases et milestones clés.

**Format**:
- Phases avec durée et objectifs
- Milestones avec dates et owners
- Dépendances identifiées

### 8. Checklist de Validation
**Obligatoire** | Placement: Fin du document

Liste de vérifications avant chaque phase importante.

**Sections typiques**:
- Avant Design/Développement
- Avant Launch/Production
- Post-Launch (si applicable)

---

## 🔧 Sections Spécifiques PRD Technique

### 1. Architecture Technique
**Obligatoire** | PRD Technique uniquement

Description détaillée de l'architecture système.

**Contenu**:
- **Architecture de Haut Niveau**: Diagramme ou description
- **Composants Principaux**: Liste des composants avec responsabilités
- **Flux de Données**: Comment les données circulent
- **Stack Technique**: Technologies utilisées

**Diagramme ASCII recommandé**:
```
┌─────────────┐     ┌─────────────┐     ┌─────────────┐
│   Frontend  │────▶│   Backend   │────▶│  Database   │
└─────────────┘     └─────────────┘     └─────────────┘
```

### 2. Spécifications API
**Obligatoire si applicable** | PRD Technique avec API

Documentation détaillée des endpoints API.

**Format par endpoint**:
- **Method + Path**: `POST /api/v1/resource`
- **Description**: Ce que fait l'endpoint
- **Request**: Exemple de payload
- **Response Success**: Exemple de réponse (avec code status)
- **Response Error**: Exemples d'erreurs
- **Validation Rules**: Règles de validation des inputs

**Format JSON recommandé** pour les exemples.

### 3. Schéma de Base de Données
**Obligatoire si applicable** | PRD Technique avec database

Schémas SQL des tables.

**Contenu par table**:
- **CREATE TABLE** statement complet
- **Indexes**: Tous les indexes avec justification
- **Relations**: Foreign keys et types de relations
- **Migrations**: Plan de migration si database existante

**Exemple**:
```sql
CREATE TABLE users (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  email VARCHAR(255) UNIQUE NOT NULL,
  created_at TIMESTAMP DEFAULT NOW()
);

CREATE INDEX idx_users_email ON users(email);
```

### 4. Sécurité
**Obligatoire** | PRD Technique

Considérations de sécurité détaillées.

**Sous-sections**:
- **Authentification**: Mécanisme (JWT, OAuth, etc.)
- **Autorisation**: Rôles et permissions
- **Validation**: Validation et sanitization des inputs
- **Protection**: CSRF, XSS, SQL Injection, Rate limiting

### 5. Performance
**Recommandé** | PRD Technique

Objectifs et optimisations de performance.

**Contenu**:
- **Objectifs**: Response time, throughput, database queries
- **Optimisations**: Caching, indexing, etc.
- **Monitoring**: Métriques à surveiller

### 6. Tests
**Obligatoire** | PRD Technique

Stratégie de tests détaillée.

**Types de tests**:
- **Tests Unitaires**: Coverage target (ex: 80%+)
- **Tests d'Intégration**: Scénarios clés
- **Tests E2E**: Flows utilisateurs
- **Tests de Performance**: Load, stress testing

### 7. Déploiement
**Obligatoire** | PRD Technique

Stratégie de déploiement et configuration.

**Contenu**:
- **Environnements**: Dev, Staging, Production
- **Stratégie**: Blue-Green, Rolling, Canary
- **Rollback Plan**: Procédure de retour arrière
- **Configuration**: Variables d'environnement

### 8. Dépendances
**Recommandé** | PRD Technique

Liste des dépendances techniques.

**Format tableau**:
| Dépendance | Version | Raison |
|-----------|---------|--------|
| [Package] | [v1.2.3] | [Justification] |

---

## 🎨 Sections Spécifiques PRD Produit

### 1. Utilisateurs Cibles
**Obligatoire** | PRD Produit uniquement

Définir précisément qui sont les utilisateurs.

**Contenu**:
- **Personas**: Descriptions détaillées (nom, contexte, besoins, pain points)
- **Segments**: Pourcentage de la base, caractéristiques
- **Use Cases**: Scénarios d'utilisation

**Exemple Persona**:
```markdown
### Persona : Sophie, la Professionnelle Curieuse
- **Qui**: Professionnelle marketing, 28-35 ans
- **Contexte**: Utilise le produit 2-3x/semaine
- **Besoins**: Rester à jour, apprendre, gagner du temps
- **Pain Points**: Trop d'emails, manque contenu actionnable
```

### 2. User Stories
**Obligatoire** | PRD Produit

Stories au format standard avec critères d'acceptation.

**Format**:
```markdown
**En tant que** [type d'utilisateur]
**Je veux** [action/fonctionnalité]
**Afin de** [bénéfice/raison]

**Critères d'Acceptation**:
- [ ] Critère 1
- [ ] Critère 2

**Scénarios de Test**:
- Scénario 1: Given [context], When [action], Then [résultat]
```

**Priorités** (MoSCoW):
- **Must Have (P0)**: Critique pour launch
- **Should Have (P1)**: Important mais pas bloquant
- **Could Have (P2)**: Nice-to-have
- **Won't Have**: Explicitement exclu

### 3. Expérience Utilisateur
**Obligatoire** | PRD Produit

Description détaillée de l'UX.

**Sous-sections**:
- **User Flow Principal**: Steps du flow (numérotés ou diagramme)
- **Écrans/Interfaces**: Description par écran avec éléments UI
- **Interactions**: Comportements dynamiques
- **Edge Cases**: Gestion des cas limites et erreurs

**Format écran**:
```markdown
#### Écran : [Nom]
- **Description**: Ce que l'utilisateur voit
- **Éléments UI**: Liste des composants
- **Actions possibles**: Ce que l'utilisateur peut faire
- **États**: Loading, Success, Error, Empty
```

### 4. Spécifications Fonctionnelles
**Obligatoire** | PRD Produit

Description détaillée des features.

**Format par feature**:
- **Description**: Vue d'ensemble
- **Comportement**: Comment ça fonctionne
- **Règles Métier**: Logique métier
- **Validations**: Règles de validation

### 5. Notifications & Communications
**Si applicable** | PRD Produit

Toutes les notifications et communications.

**Types**:
- **Notifications In-App**: Quand, message, action
- **Emails**: Trigger, sujet, contenu, CTA
- **Push Notifications**: Si applicable
- **SMS**: Si applicable

### 6. Multi-Platform Considerations
**Si applicable** | PRD Produit

Comportement selon la plateforme.

**Contenu**:
- Différences Web Desktop vs Mobile Web vs App Native
- Tableau comparatif des features par plateforme

### 7. Accessibilité
**Obligatoire** | PRD Produit

Conformité WCAG et considérations d'accessibilité.

**Standards**:
- WCAG 2.1 Level AA (minimum)
- Screen reader compatible
- Keyboard navigation
- Color contrast

### 8. Internationalisation (i18n)
**Si applicable** | PRD Produit

Support multi-langues.

**Contenu**:
- Langues supportées
- Éléments à traduire
- Considérations (formatage dates, longueur textes)

### 9. Testing & Validation
**Recommandé** | PRD Produit

Plan de tests utilisateurs.

**Types**:
- **User Testing**: Nombre d'utilisateurs, méthode
- **Beta Testing**: Audience, durée
- **A/B Testing**: Variantes à tester

### 10. Plan de Lancement
**Obligatoire** | PRD Produit

Stratégie de rollout détaillée.

**Phases typiques**:
- Alpha (Internal)
- Beta (Privée)
- Rollout Progressif (10% → 100%)
- General Availability

**Communication**:
- En interne (équipe, support)
- En externe (users, blog, social)

### 11. Documentation
**Obligatoire** | PRD Produit

Liste de la documentation à créer.

**Types**:
- Help Center articles
- FAQ
- Video tutorials
- Release notes
- Support playbook

---

## 🌟 Sections Spécifiques PRD Stratégique

### 1. Vision & Mission
**Obligatoire** | PRD Stratégique uniquement

Vision à long terme et mission de l'initiative.

**Contenu**:
- **Vision Produit**: Où veut-on être dans 12-24 mois ?
- **Mission**: Mission spécifique de cette initiative
- **Alignment Stratégique**: Lien avec stratégie globale

### 2. Analyse du Marché
**Obligatoire** | PRD Stratégique

Analyse approfondie du marché.

**Sous-sections**:
- **Tendances du Marché**: Top 3-5 tendances avec impact
- **Analyse Concurrentielle**: Tableau comparatif
- **Taille du Marché**: TAM, SAM, SOM

**Format tableau concurrent**:
| Concurrent | Positionnement | Forces | Faiblesses | Opportunités |
|-----------|----------------|--------|------------|--------------|

### 3. OKRs (Objectives & Key Results)
**Obligatoire** | PRD Stratégique

Objectifs ambitieux avec résultats clés mesurables.

**Format**:
```markdown
#### Objective 1 : [Objectif ambitieux, qualitatif]
**Key Results**:
- [ ] KR1: [Résultat mesurable, quantitatif]
- [ ] KR2: [Résultat mesurable, quantitatif]
- [ ] KR3: [Résultat mesurable, quantitatif]
```

**Règle**: 1 Objective = 3-5 Key Results mesurables

### 4. Business Case
**Obligatoire** | PRD Stratégique

Justification business détaillée.

**Contenu**:
- **Problème Business**: Coût actuel du problème
- **Valeur Attendue**: Revenue, Cost, Strategic impact
- **ROI Projection**: Tableau Year 1, 2, 3

**Format ROI**:
| Timeframe | Investment | Revenue | Costs | Net Benefit | ROI % |
|-----------|-----------|---------|-------|-------------|-------|

### 5. Segments & Marché Cible
**Obligatoire** | PRD Stratégique

Définition précise des segments de marché.

**Contenu**:
- **TAM/SAM/SOM**: Tailles de marché
- **Segments Prioritaires**: Taille, caractéristiques, besoins, willingness to pay
- **Buyer Personas (B2B)**: Decision maker, Economic buyer, Technical buyer

### 6. Roadmap Stratégique
**Obligatoire** | PRD Stratégique

Roadmap par phases avec timeline.

**Format par phase**:
- **Objectif**: Qu'est-ce qu'on accomplit ?
- **Initiatives Clés**: Liste d'initiatives
- **Deliverables**: Livrables concrets
- **Success Metrics**: Métriques de succès

**Timeline visuelle recommandée** (ASCII art).

### 7. Budget & Ressources
**Obligatoire** | PRD Stratégique

Budget détaillé et ressources humaines.

**Contenu**:
- **Investment Breakdown**: Development, Operational costs
- **Total Investment**: Year 1, 2, 3
- **Ressources Humaines**: Team required, Hiring plan

**Format tableau** pour budgets.

### 8. North Star Metric
**Obligatoire** | PRD Stratégique

Métrique principale qui représente la valeur délivrée.

**Format**:
```markdown
**[Nom de la métrique]**
- **Current**: [Valeur actuelle]
- **Target (6 mois)**: [Objectif]
- **Target (12 mois)**: [Objectif]
```

### 9. Avantages Concurrentiels
**Obligatoire** | PRD Stratégique

En quoi sommes-nous uniques et meilleurs ?

**Sous-sections**:
- **Differentiation**: Qu'est-ce qui nous rend unique ?
- **Sustainable Advantage**: Avantages difficiles à copier
- **Moats**: Barrières à l'entrée (network effects, data, brand, tech)

### 10. Go-to-Market Strategy
**Obligatoire** | PRD Stratégique

Stratégie de mise sur le marché.

**Contenu**:
- **Positionnement**: Positioning statement
- **Messaging**: Value proposition, key messages
- **Canaux de Distribution**: Tableau avec CAC par canal
- **Pricing Strategy**: Model, tiers, rationale
- **Launch Strategy**: Comment lancer ?

### 11. Partenariats & Ecosystème
**Si applicable** | PRD Stratégique

Partenaires stratégiques et écosystème.

**Format tableau**:
| Partenaire | Type | Value | Status |
|-----------|------|-------|--------|

### 12. Organisation & Gouvernance
**Obligatoire** | PRD Stratégique

Structure de leadership et gouvernance.

**Contenu**:
- **Leadership Team**: Sponsors, leads par domaine
- **Decision-Making Framework**: Qui décide quoi ?
- **Governance**: Cadence des reviews (weekly, monthly, quarterly)

### 13. Success Criteria & Exit Strategy
**Obligatoire** | PRD Stratégique

Définition du succès et stratégie de sortie.

**Contenu**:
- **Definition of Success**: Critères de succès
- **Go/No-Go Decision Points**: Checkpoints avec critères
- **Pivot Strategy**: Quand pivoter ?
- **Exit Strategy**: Quand arrêter ?

---

## 📏 Recommandations Générales

### Longueur des Sections

**PRD Technique**:
- Total: 10-20 pages
- Architecture: 2-3 pages (la plus détaillée)
- API Specs: 1-2 pages par endpoint majeur

**PRD Produit**:
- Total: 15-30 pages
- User Stories: 3-5 pages (la plus détaillée)
- UX: 3-4 pages

**PRD Stratégique**:
- Total: 20-40 pages
- Business Case: 2-3 pages (très détaillé)
- Roadmap: 3-4 pages

### Ordre des Sections

**Recommandé**:
1. Métadonnées
2. Résumé Exécutif (toujours en 1er)
3. Contexte
4. Objectifs
5. [Sections spécifiques par type]
6. Métriques
7. Risques
8. Planning
9. Checklist

### Utilisation des Tableaux

**Quand utiliser des tableaux** :
- Comparaisons (concurrents, options)
- Métriques avec baseline/target
- Risques avec impact/probabilité
- Budget breakdown
- Planning/timeline

**Format Markdown** :
```markdown
| Colonne 1 | Colonne 2 | Colonne 3 |
|-----------|-----------|-----------|
| Donnée 1  | Donnée 2  | Donnée 3  |
```

### Utilisation des Diagrammes

**Pour PRD Technique** : Diagrammes architecture (ASCII art)
**Pour PRD Produit** : User flows (numérotés ou ASCII)
**Pour PRD Stratégique** : Timeline visuelle, matrice risques

### Checkboxes

**Utiliser checkboxes pour** :
- Objectifs (tracking)
- User stories / Critères d'acceptation
- Checklist de validation
- Tâches dans planning

**Format** : `- [ ] Item à faire`

---

## 🎯 Matrice de Décision : Quelle Section Inclure ?

| Section | Technique | Produit | Stratégique | Notes |
|---------|-----------|---------|-------------|-------|
| **Communes** | | | | |
| Métadonnées | ✅ Obl. | ✅ Obl. | ✅ Obl. | |
| Résumé Exécutif | ✅ Obl. | ✅ Obl. | ✅ Obl. | |
| Contexte | ✅ Obl. | ✅ Obl. | ✅ Obl. | |
| Objectifs | ✅ Obl. | ✅ Obl. | ✅ Obl. | OKRs pour Stratégique |
| Métriques | ✅ Obl. | ✅ Obl. | ✅ Obl. | North Star pour Stratégique |
| Risques | ✅ Obl. | ✅ Obl. | ✅ Obl. | |
| Planning | ✅ Obl. | ✅ Obl. | ✅ Obl. | Roadmap pour Stratégique |
| Checklist | ✅ Obl. | ✅ Obl. | ✅ Obl. | |
| **Spécifiques Tech** | | | | |
| Architecture | ✅ Obl. | ❌ | ❌ | Technique uniquement |
| API Specs | 🔶 Si API | ❌ | ❌ | Si applicable |
| Database Schema | 🔶 Si DB | ❌ | ❌ | Si applicable |
| Sécurité | ✅ Obl. | ❌ | ❌ | |
| Performance | 🟡 Rec. | ❌ | ❌ | Recommandé |
| Tests | ✅ Obl. | 🟡 Rec. | ❌ | Détaillé pour Tech |
| Déploiement | ✅ Obl. | ❌ | ❌ | |
| **Spécifiques Produit** | | | | |
| Utilisateurs Cibles | ❌ | ✅ Obl. | 🟡 Rec. | Segments pour Stratégique |
| User Stories | ❌ | ✅ Obl. | ❌ | |
| UX | ❌ | ✅ Obl. | ❌ | |
| Specs Fonctionnelles | ❌ | ✅ Obl. | ❌ | |
| Notifications | ❌ | 🔶 Si applic. | ❌ | |
| Multi-Platform | ❌ | 🔶 Si applic. | ❌ | |
| Accessibilité | ❌ | ✅ Obl. | ❌ | |
| i18n | ❌ | 🔶 Si applic. | ❌ | |
| Plan de Lancement | ❌ | ✅ Obl. | 🟡 Rec. | GTM pour Stratégique |
| **Spécifiques Stratégique** | | | | |
| Vision & Mission | ❌ | ❌ | ✅ Obl. | |
| Analyse Marché | ❌ | ❌ | ✅ Obl. | |
| Business Case | ❌ | ❌ | ✅ Obl. | |
| OKRs | ❌ | ❌ | ✅ Obl. | |
| Roadmap Stratégique | ❌ | ❌ | ✅ Obl. | Phases détaillées |
| Budget & Ressources | 🟡 Rec. | ❌ | ✅ Obl. | Détaillé pour Stratégique |
| Avantages Concurrentiels | ❌ | ❌ | ✅ Obl. | |
| GTM Strategy | ❌ | ❌ | ✅ Obl. | |
| Gouvernance | ❌ | ❌ | ✅ Obl. | |
| Success Criteria & Exit | ❌ | ❌ | ✅ Obl. | |

**Légende** :
- ✅ **Obligatoire** : Doit être présent
- 🟡 **Recommandé** : Fortement conseillé
- 🔶 **Si applicable** : Inclure si pertinent
- ❌ **Non applicable** : Ne pas inclure

---

Cette matrice vous aide à décider rapidement quelles sections inclure dans votre PRD selon son type.
