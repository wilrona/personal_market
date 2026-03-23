# Questions Checklist pour Création de PRD

Ce guide fournit une liste complète de questions à se poser (ou à poser à l'utilisateur) avant de rédiger chaque type de PRD.

---

## 🎯 Questions Générales (Tous Types de PRD)

Poser ces questions au début, quel que soit le type de PRD.

### Contexte Basique

1. **Quel est le nom du projet/feature/initiative ?**
   - Nom court et descriptif

2. **Quel type de PRD est nécessaire ?**
   - Technique
   - Produit
   - Stratégique

3. **Quel est le problème principal à résoudre ?**
   - Description en 2-3 phrases
   - Impact actuel du problème

4. **Pourquoi maintenant ?**
   - Timing: pourquoi est-ce urgent/important maintenant ?
   - Opportunité ou menace ?

5. **Qui sont les stakeholders ?**
   - Qui doit approuver ce PRD ?
   - Qui va l'exécuter ?
   - Qui sera impacté ?

### Scope & Timeline

6. **Quel est le scope ?**
   - Qu'est-ce qui est inclus ?
   - Qu'est-ce qui est explicitement exclu ?

7. **Quelle est la timeline idéale ?**
   - Date de livraison souhaitée
   - Y a-t-il des contraintes de timing (event, deadline légale, etc.) ?

8. **Quelles sont les dépendances ?**
   - Autres projets/features dont on dépend
   - Équipes externes impliquées

### Success Metrics

9. **Comment mesurer le succès ?**
   - Quelles métriques principales ?
   - Quelle est la valeur actuelle (baseline) ?
   - Quelle est la valeur cible ?

10. **Quels sont les risques majeurs ?**
    - Top 3 risques identifiés
    - Comment les atténuer ?

---

## 🔧 Questions Spécifiques PRD Technique

### Architecture & Design

11. **Quelle est l'architecture actuelle (si existante) ?**
    - Monolithe, microservices, serverless ?
    - Stack technique actuel

12. **Quelles sont les contraintes techniques ?**
    - Performance (latency, throughput)
    - Scalabilité (combien d'utilisateurs/requêtes ?)
    - Disponibilité (uptime requis)

13. **Quels sont les composants principaux à développer ?**
    - Liste des composants avec responsabilités

14. **Y a-t-il des APIs à exposer ?**
    - APIs REST, GraphQL, WebSocket ?
    - Qui va consommer ces APIs ?

### Database & Data

15. **Quelle est la stratégie de données ?**
    - Nouvelles tables ou modification existantes ?
    - Relations entre entités
    - Migration de données nécessaire ?

16. **Quel volume de données est attendu ?**
    - Nombre de records
    - Taille des données
    - Croissance prévue

### Sécurité & Compliance

17. **Quelles sont les exigences de sécurité ?**
    - Données sensibles manipulées ?
    - Authentification/autorisation requise ?
    - Compliance (RGPD, HIPAA, etc.) ?

18. **Qui a accès à quoi ?**
    - Rôles et permissions
    - Niveaux d'accès

### Performance

19. **Quels sont les objectifs de performance ?**
    - Response time (P50, P95, P99)
    - Throughput (requêtes par seconde)
    - Nombre de queries database par requête

20. **Y a-t-il des besoins de caching ?**
    - Quoi cacher ? (données, requêtes, pages)
    - Stratégie (Redis, CDN, etc.)

### Testing & Deployment

21. **Quelle est la stratégie de tests ?**
    - Coverage target (ex: 80%+)
    - Types de tests (unit, integration, e2e, performance)

22. **Comment sera déployé le système ?**
    - Environnements (dev, staging, prod)
    - Stratégie de déploiement (blue-green, canary, rolling)
    - Rollback plan

23. **Y a-t-il des dépendances externes ?**
    - Services tiers (APIs, cloud providers)
    - Librairies/frameworks spécifiques

---

## 🎨 Questions Spécifiques PRD Produit

### Utilisateurs

24. **Qui sont les utilisateurs cibles ?**
    - Personas principaux et secondaires
    - Nombre d'utilisateurs potentiels

25. **Quels sont leurs pain points actuels ?**
    - Problèmes spécifiques rencontrés
    - Fréquence et impact de ces problèmes

26. **Que font-ils aujourd'hui en absence de cette feature ?**
    - Workarounds actuels
    - Solutions concurrentes

### Valeur & Priorité

27. **Quelle valeur apporte cette feature aux utilisateurs ?**
    - Gain de temps ? Économies ? Nouvelle capacité ?
    - Quantifiable si possible

28. **Quelle est la priorité business ?**
    - P0 (Critical), P1 (High), P2 (Medium), P3 (Low)
    - Justification de la priorité

29. **Y a-t-il des demandes utilisateurs existantes ?**
    - Tickets support, feedback, surveys
    - Nombre de demandes

### User Experience

30. **Quel est le user flow principal ?**
    - Étapes du flow de A à Z
    - Points de décision

31. **Quels sont les écrans/interfaces nécessaires ?**
    - Liste des écrans
    - Éléments UI par écran

32. **Quels sont les cas limites (edge cases) ?**
    - Erreurs possibles
    - États vides (no data)
    - Permissions insuffisantes

33. **Y a-t-il des designs existants ?**
    - Mockups, wireframes, prototypes ?
    - Lien vers Figma/Sketch

### Features & Specs

34. **Quelles sont les features must-have (P0) ?**
    - Fonctionnalités critiques pour launch

35. **Quelles sont les features nice-to-have (P1, P2) ?**
    - Fonctionnalités importantes mais non bloquantes

36. **Qu'est-ce qui est explicitement exclu (Won't Have) ?**
    - Clarifier le scope

### Multi-Platform & Accessibilité

37. **Sur quelles plateformes sera disponible la feature ?**
    - Web desktop, mobile web, app iOS, app Android ?
    - Différences par plateforme

38. **Quelles sont les exigences d'accessibilité ?**
    - WCAG Level (A, AA, AAA)
    - Support screen readers, keyboard navigation

39. **Quelles langues doivent être supportées ?**
    - i18n nécessaire ?
    - Quelles langues ?

### Communication & Notifications

40. **Y a-t-il des notifications à envoyer ?**
    - In-app, email, push, SMS ?
    - Quand et pourquoi ?

41. **Quel est le contenu de ces notifications ?**
    - Sujet, message, CTA

### Analytics & Testing

42. **Quels events analytics faut-il tracker ?**
    - Actions utilisateurs à mesurer
    - Properties à capturer

43. **Comment tester la feature avant launch ?**
    - User testing (combien d'users, quand)
    - Beta testing
    - A/B testing (variantes)

### Launch & Support

44. **Quelle est la stratégie de lancement ?**
    - Rollout progressif ou big bang ?
    - Communication (blog, email, social)

45. **Comment former l'équipe support ?**
    - Documentation à créer
    - FAQ, playbook

46. **Qu'est-ce qui peut mal tourner ?**
    - Risques produit
    - Plan de contingence

---

## 🌟 Questions Spécifiques PRD Stratégique

### Vision & Opportunité

47. **Quelle est la vision à long terme ?**
    - Où veut-on être dans 12-24 mois ?

48. **Comment cette initiative s'aligne avec la stratégie d'entreprise ?**
    - Lien avec objectifs globaux

49. **Quelle est l'opportunité de marché ?**
    - Taille du marché (TAM, SAM, SOM)
    - Croissance du marché
    - Part de marché cible

### Business Case

50. **Quel est le coût actuel du problème ?**
    - Pertes financières
    - Inefficacités
    - Churn

51. **Quel est le retour sur investissement (ROI) attendu ?**
    - Revenue impact
    - Cost savings
    - Timeline to profitability

52. **Quel est l'investissement requis ?**
    - Budget total (development + operational)
    - Breakdown par catégorie
    - Timeline de dépenses

53. **Quel est le break-even point ?**
    - Quand devient-on rentable ?

### Marché & Compétition

54. **Qui sont les concurrents principaux ?**
    - Direct competitors
    - Indirect competitors
    - Nouveaux entrants potentiels

55. **Qu'est-ce que les concurrents font bien ?**
    - Leurs forces
    - Parts de marché

56. **Quelles sont leurs faiblesses ?**
    - Opportunités pour nous

57. **Comment nous différencions-nous ?**
    - Unique value proposition
    - Avantages concurrentiels

### Segments & Clients

58. **Quels sont les segments de marché cibles ?**
    - Priorité par segment
    - Taille et caractéristiques

59. **Qui est le buyer persona (B2B) ?**
    - Decision maker
    - Economic buyer
    - Technical buyer
    - End users

60. **Quelle est leur willingness to pay ?**
    - Prix acceptable
    - Sensibilité au prix

### Strategy & OKRs

61. **Quels sont les Objectives (OKRs) ?**
    - 2-3 objectifs ambitieux
    - 3-5 key results par objective

62. **Quelle est la North Star Metric ?**
    - UNE métrique qui représente la valeur

63. **Quels sont les KPIs clés à suivre ?**
    - Acquisition, Activation, Retention, Revenue, Efficiency

### Roadmap & Phases

64. **Comment phaser le rollout ?**
    - Phase 1 (Foundation)
    - Phase 2 (Growth)
    - Phase 3 (Scale)

65. **Quels sont les milestones critiques ?**
    - Dates et deliverables clés

66. **Quelles sont les dépendances entre phases ?**
    - Critical path

### Go-to-Market

67. **Quelle est la stratégie de pricing ?**
    - Modèle (freemium, subscription, usage-based)
    - Tiers et prix
    - Rationale

68. **Quels sont les canaux de distribution ?**
    - Direct, Partners, Marketplaces ?
    - CAC (Customer Acquisition Cost) par canal

69. **Quel est le positioning ?**
    - Positioning statement
    - Value proposition
    - Key messages

70. **Comment lancer sur le marché ?**
    - Launch plan
    - Communication strategy

### Ressources & Organisation

71. **Quelles ressources humaines sont nécessaires ?**
    - Engineering, Product, Design, Marketing, Sales, Support
    - FTEs par fonction

72. **Faut-il recruter ?**
    - Nouveaux rôles
    - Timeline de hiring

73. **Qui sont les leaders de l'initiative ?**
    - Executive sponsor
    - Strategic lead
    - Functional leads

74. **Quelle est la gouvernance ?**
    - Cadence de reviews
    - Decision-making framework
    - Escalation path

### Risques Stratégiques

75. **Quels sont les risques majeurs ?**
    - Market risk (et si le marché n'existe pas ?)
    - Execution risk (et si on ne livre pas ?)
    - Competitive risk (et si concurrent nous devance ?)
    - Financial risk (et si coûts dépassent budget ?)

76. **Quels sont les assumptions critiques ?**
    - Hypothèses sur lesquelles repose le plan
    - Comment valider ces hypothèses ?

77. **Y a-t-il des dépendances externes ?**
    - Partenaires, régulations, technologies tierces

### Success & Exit

78. **Comment définir le succès ?**
    - Critères de succès explicites
    - Seuils quantitatifs

79. **Quels sont les Go/No-Go decision points ?**
    - Checkpoints avec critères
    - Continue, Pivot, ou Stop ?

80. **Quelle est la stratégie de sortie (exit) ?**
    - Dans quelles conditions arrêter l'initiative ?
    - Comment arrêter proprement ?

### Partenariats

81. **Y a-t-il des partenaires stratégiques nécessaires ?**
    - Type (tech, channel, strategic)
    - Valeur apportée
    - Statut (discussion, signed)

82. **Comment cette initiative s'intègre dans un écosystème ?**
    - Écosystème plus large
    - Synergies potentielles

---

## 📝 Comment Utiliser Cette Checklist

### Approche Recommandée

**Étape 1** : Identifier le type de PRD
- Questions générales (1-10) pour tous
- Questions spécifiques selon le type

**Étape 2** : Session de Questions
- Poser les questions par catégorie
- Prendre des notes détaillées
- Clarifier ambiguïtés

**Étape 3** : Identifier Gaps
- Quelles questions n'ont pas de réponse ?
- Qui peut fournir ces réponses ?
- Recherche/analyse nécessaire ?

**Étape 4** : Rédiger le PRD
- Utiliser les réponses pour remplir le template
- Structurer selon les sections du template
- Références aux sources d'information

### Tips pour Poser les Questions

**DO** ✅:
- Poser une question à la fois
- Reformuler pour clarifier
- Demander des exemples concrets
- Creuser avec "Pourquoi ?"

**DON'T** ❌:
- Bombarder avec 10 questions d'un coup
- Accepter des réponses vagues ("on verra plus tard")
- Sauter des questions importantes
- Faire des assumptions

### Priorité des Questions

**Haute Priorité** (Blocker) :
- Questions 1-10 (Générales)
- Questions liées aux objectifs et métriques
- Questions liées aux risques majeurs

**Moyenne Priorité** :
- Questions de détails techniques/produit
- Questions d'organisation

**Basse Priorité** :
- Nice-to-have
- Détails qui peuvent être affinés plus tard

---

## 💡 Questions Follow-up Utiles

Pour chaque réponse, considérer ces follow-ups :

### "Pourquoi ?"
Creuser la raison sous-jacente
- "Pourquoi est-ce important ?"
- "Pourquoi maintenant ?"

### "Comment mesurer ?"
Rendre concret
- "Comment saurez-vous que c'est un succès ?"
- "Quelle métrique capturera cela ?"

### "Qu'est-ce qui peut mal tourner ?"
Identifier risques
- "Quel est le pire scénario ?"
- "Comment atténuer ce risque ?"

### "Et si... ?"
Explorer alternatives
- "Et si on fait X au lieu de Y ?"
- "Et si ça prend 2x plus de temps ?"

### "Qui d'autre ?"
Identifier stakeholders
- "Qui d'autre sera impacté ?"
- "Qui doit approuver ?"

---

## ✅ Checklist de Complétude

Avant de commencer à rédiger le PRD, vérifier :

### PRD Technique
- [ ] Architecture claire (high-level + composants)
- [ ] Performance requirements quantifiés
- [ ] Security considérations identifiées
- [ ] Tests strategy définie
- [ ] Rollback plan défini

### PRD Produit
- [ ] User personas définis
- [ ] User stories avec critères d'acceptation
- [ ] UX décrite (flows + écrans)
- [ ] Success metrics définis
- [ ] Launch plan défini

### PRD Stratégique
- [ ] Business case avec ROI
- [ ] Analyse marché et concurrence
- [ ] OKRs définis
- [ ] Budget et ressources identifiés
- [ ] Roadmap multi-phases
- [ ] Go/No-Go decision points

---

Cette checklist garantit qu'aucune question critique n'est oubliée avant de rédiger un PRD. Adapter selon le contexte spécifique du projet.
