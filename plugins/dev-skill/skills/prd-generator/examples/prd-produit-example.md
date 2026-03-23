# PRD Produit : Inscription Newsletter

---

## 📋 Métadonnées

- **Type**: PRD Produit
- **Date de création**: 2024-01-16
- **Auteur**: Product Team
- **Version**: 1.0
- **Statut**: Approved
- **Priority**: P1 (High)

---

## 🎯 Résumé Exécutif

Permettre aux visiteurs du site de s'inscrire à notre newsletter pour recevoir des updates produit, des conseils et du contenu exclusif. Cette feature vise à augmenter notre base d'abonnés de 30% en 3 mois et à améliorer l'engagement utilisateur avec un taux d'ouverture cible de 25%.

---

## 📌 Contexte

### Problème Utilisateur
Actuellement, les visiteurs intéressés par nos contenus n'ont aucun moyen de rester informés des nouveautés. Nous perdons 80% du trafic qui ne reviendra jamais. Les utilisateurs nous demandent régulièrement via le support comment suivre nos actualités.

### Opportunité
La newsletter est un canal d'engagement à fort ROI (38$ de ROI pour 1$ investi en moyenne). Elle permet de nurture les leads, augmenter la rétention, et créer une communauté engagée.

### Données & Insights
- **Demandes utilisateurs**: 127 tickets support en 6 mois demandant "Comment rester informé?"
- **Données analytics**: 45% des visiteurs reviennent moins de 2 fois
- **Research**: 62% des utilisateurs interrogés sont intéressés par une newsletter hebdomadaire
- **Compétition**: 4 sur 5 de nos concurrents ont une newsletter active

---

## 👥 Utilisateurs Cibles

### Persona Principal : Sophie, la Professionnelle Curieuse
- **Qui**: Professionnelle en marketing digital, 28-35 ans, utilise notre produit 2-3x/semaine
- **Contexte**: Lit ses emails le matin avant de commencer à travailler
- **Besoins**: Rester à jour sur les features, apprendre des best practices, gagner du temps
- **Pain Points**: Trop d'emails non pertinents, manque de contenu actionnable

### Personas Secondaires
- David, le Visiteur Occasionnel : découvre le site, veut rester informé avant de s'engager
- Marie, l'Early Adopter : utilise le produit activement, veut être la première au courant

### Segments Utilisateurs
- **Segment 1**: Free users (60% de la base), cherchent à apprendre avant de passer Premium
- **Segment 2**: Paid users (30%), veulent maximiser leur utilisation du produit
- **Segment 3**: Visiteurs non-inscrits (10%), en phase de découverte

---

## 🎯 Objectifs Produit

### Objectifs Principaux
- [ ] Atteindre 10,000 abonnés newsletter dans les 3 mois
- [ ] Obtenir un taux d'ouverture moyen de 25%+
- [ ] Convertir 5% des abonnés newsletter en utilisateurs payants

### Objectifs Secondaires
- [ ] Réduire les demandes support sur "comment rester informé" de 80%
- [ ] Augmenter le trafic récurrent de 20%

### Non-Objectifs
- Cette initiative ne vise PAS à créer une plateforme complète d'email marketing
- Ne vise PAS à remplacer les notifications in-app existantes
- Ne vise PAS à envoyer des emails transactionnels (hors scope)

---

## 📖 User Stories

### Must Have (P0)

#### US1: S'inscrire depuis la homepage
**En tant que** visiteur du site
**Je veux** pouvoir m'inscrire à la newsletter depuis la homepage
**Afin de** recevoir les dernières actualités sans avoir à revenir sur le site

**Critères d'Acceptation**:
- [ ] Formulaire d'inscription visible sur la homepage (above the fold ou footer)
- [ ] Champ email obligatoire avec validation
- [ ] Message de confirmation après inscription
- [ ] Email de bienvenue envoyé automatiquement
- [ ] Double opt-in pour conformité RGPD

**Scénarios de Test**:
- **Scénario 1**: Given je suis sur la homepage, When je saisis un email valide et clique "S'inscrire", Then je vois un message de succès et reçois un email de confirmation
- **Scénario 2**: Given je saisis un email invalide, When je clique "S'inscrire", Then je vois un message d'erreur et ne peux pas soumettre

#### US2: Email de bienvenue
**En tant que** nouvel abonné
**Je veux** recevoir un email de bienvenue personnalisé
**Afin de** confirmer mon inscription et découvrir ce que je vais recevoir

**Critères d'Acceptation**:
- [ ] Email envoyé dans les 2 minutes après inscription
- [ ] Contenu: bienvenue, fréquence des emails, lien vers préférences
- [ ] Design cohérent avec l'identité de marque
- [ ] Call-to-action : "Découvrir le produit"
- [ ] Lien de désinscription visible

#### US3: Se désinscrire
**En tant qu'** abonné
**Je veux** pouvoir me désinscrire facilement
**Afin de** ne plus recevoir d'emails si je ne suis plus intéressé

**Critères d'Acceptation**:
- [ ] Lien "Se désinscrire" dans chaque email
- [ ] Page de désinscription en 1 clic (pas de login requis)
- [ ] Message de confirmation de désinscription
- [ ] Option de feedback "Pourquoi vous désabonnez-vous?"

### Should Have (P1)

#### US4: Gérer les préférences
**En tant qu'** abonné
**Je veux** choisir la fréquence et les types de contenu que je reçois
**Afin de** recevoir uniquement ce qui m'intéresse

**Critères d'Acceptation**:
- [ ] Page préférences accessible via lien dans emails
- [ ] Options: Hebdomadaire, Bimensuel, Mensuel
- [ ] Catégories: Product Updates, Tips & Tricks, Company News
- [ ] Sauvegarder les préférences sans déconnexion

### Could Have (P2)

#### US5: Inscription depuis d'autres pages
- Formulaires d'inscription sur blog posts, page pricing, etc.

#### US6: Lead magnet
- Offrir un guide gratuit en échange de l'inscription

---

## 🎨 Expérience Utilisateur

### User Flow Principal

```
1. Visiteur arrive sur homepage
2. Scrolle jusqu'au footer OU voit popup d'intention de sortie
3. Voit formulaire newsletter avec CTA engageant
4. Saisit son adresse email
5. Clique sur bouton "S'inscrire"
6. Voit message de succès "Vérifiez vos emails!"
7. Reçoit email de confirmation double opt-in
8. Clique sur lien de confirmation dans l'email
9. Arrive sur page "Merci! Vous êtes inscrit(e)"
10. Reçoit email de bienvenue avec premier contenu
```

### Écrans/Interfaces Clés

#### Écran 1 : Formulaire d'inscription (Homepage Footer)
- **Description**: Section dédiée dans le footer de chaque page
- **Éléments UI**:
  - Titre: "Restez informé(e)"
  - Sous-titre: "Recevez nos derniers articles, tips et product updates"
  - Champ email avec placeholder "votre@email.com"
  - Bouton CTA "S'inscrire" (couleur primaire)
  - Checkbox "J'accepte de recevoir la newsletter" (RGPD)
  - Lien vers politique de confidentialité
- **Actions possibles**: Saisir email, cocher acceptation, cliquer s'inscrire
- **États**:
  - **Default**: Champ vide
  - **Focus**: Border bleue sur input
  - **Loading**: Spinner sur bouton pendant soumission
  - **Success**: Message vert "Vérifiez vos emails pour confirmer"
  - **Error**: Message rouge "Email invalide" ou "Email déjà inscrit"

#### Écran 2 : Page de confirmation double opt-in
- **Description**: Page landing après clic sur lien de confirmation
- **Éléments UI**:
  - Illustration de succès (checkmark)
  - Titre: "🎉 C'est confirmé!"
  - Message: "Vous recevrez votre première newsletter [jour de la semaine]"
  - CTA: "Découvrir le produit"
  - Lien: "Gérer mes préférences"
- **Actions possibles**: Découvrir produit, gérer préférences
- **États**: Page statique (pas d'états dynamiques)

#### Écran 3 : Page de désinscription
- **Description**: Page landing après clic sur "Se désinscrire"
- **Éléments UI**:
  - Titre: "Vous vous désinscrivez?"
  - Message: "On est triste de vous voir partir..."
  - Bouton: "Confirmer la désinscription"
  - Lien: "Finalement, rester inscrit(e)"
  - Formulaire feedback optionnel: "Pourquoi?" (dropdown)
- **Actions possibles**: Confirmer désinscription, annuler, donner feedback
- **États**:
  - **Default**: Formulaire actif
  - **Loading**: Spinner pendant traitement
  - **Success**: "Vous êtes désinscrit(e). Au revoir!"

### Interactions & Comportements

#### Interaction 1 : Validation email en temps réel
- **Trigger**: Utilisateur saisit dans le champ email
- **Comportement**: Validation regex de format email après blur
- **Feedback**: Icon checkmark verte si valide, croix rouge si invalide + message

#### Interaction 2 : Popup d'intention de sortie (P2)
- **Trigger**: Curseur sort de la fenêtre (desktop uniquement)
- **Comportement**: Modal avec formulaire newsletter + "Ne manquez rien!"
- **Feedback**: Modal slide-in depuis le haut

### Edge Cases & États d'Erreur

| Cas | Comportement Attendu |
|-----|---------------------|
| Email déjà inscrit | Message: "Cet email est déjà inscrit. Vérifiez votre boîte mail." |
| Email invalide | Message: "Format d'email invalide" en temps réel |
| Réseau indisponible | Message: "Erreur de connexion. Réessayez." + bouton Retry |
| Bot/spam | Honeypot hidden field + rate limiting backend |
| Email non confirmé après 48h | Email de rappel envoyé automatiquement |
| Désinscription d'email non existant | Message: "Email non trouvé" (pour éviter l'énumération) |

---

## ✨ Spécifications Fonctionnelles

### Feature 1 : Inscription Newsletter

**Description**: Formulaire d'inscription permettant aux visiteurs de s'abonner à la newsletter

**Comportement**:
- Formulaire visible sur toutes les pages (footer)
- Validation côté client ET serveur
- Soumission asynchrone (AJAX)
- Double opt-in obligatoire (RGPD)
- Rate limiting: max 3 tentatives par IP par heure

**Règles Métier**:
- Email doit être unique dans la base
- Checkbox acceptation RGPD obligatoire
- Token de confirmation valide 7 jours
- Après 7 jours, token expire et email doit se réinscrire

**Validations**:
- Email: format valide RFC 5322
- Email: max 255 caractères
- Checkbox: doit être cochée
- Honeypot: champ caché doit rester vide (anti-bot)

### Feature 2 : Emails automatisés

**Description**: Système d'envoi automatique d'emails transactionnels

**Comportement**:
- Email confirmation envoyé immédiatement après inscription
- Email bienvenue envoyé après confirmation du double opt-in
- Email rappel envoyé J+2 si pas de confirmation
- Tous les emails sont responsive (mobile-friendly)

**Règles Métier**:
- Maximum 1 email de rappel (pas de spam)
- Emails envoyés via queue (background job)
- Retry automatique en cas d'échec (3 tentatives)
- Tracking ouverture et clics (pixel + liens)

**Validations**:
- Template email: doit contenir lien de désinscription
- Sender: adresse vérifié (SPF/DKIM)
- Contenu: pas de mots spam (filtre)

### Feature 3 : Gestion préférences

**Description**: Interface permettant aux abonnés de gérer leurs préférences d'emails

**Comportement**:
- Accessible via lien unique dans chaque email
- Pas de login requis (token dans URL)
- Modifications sauvegardées immédiatement
- Confirmation visuelle après sauvegarde

**Règles Métier**:
- Token préférences valide 30 jours
- Si au moins 1 catégorie cochée, abonnement actif
- Si 0 catégorie cochée, équivalent à désinscription
- Historique des modifications conservé (audit)

---

## 🔔 Notifications & Communications

### Emails

#### Email 1 : Confirmation double opt-in
- **Trigger**: Immédiatement après soumission formulaire
- **Sujet**: "Confirmez votre inscription à notre newsletter"
- **Contenu**:
  - "Merci de votre intérêt!"
  - "Cliquez sur le bouton ci-dessous pour confirmer"
  - CTA: "Confirmer mon inscription" (lien vers confirmation)
  - "Ce lien expire dans 7 jours"
- **CTA**: Lien de confirmation (contient token unique)

#### Email 2 : Bienvenue
- **Trigger**: Après confirmation double opt-in
- **Sujet**: "Bienvenue! Voici ce qui vous attend"
- **Contenu**:
  - "🎉 Vous êtes officiellement inscrit(e)!"
  - "Vous recevrez nos emails chaque [fréquence]"
  - "Au programme: [liste des contenus]"
  - "Premiers conseils": [contenu utile immédiat]
  - Lien vers profil/préférences
  - Lien vers "Découvrir le produit"
- **CTA**: "Commencer à explorer"

#### Email 3 : Rappel confirmation
- **Trigger**: J+2 si email confirmation pas validé
- **Sujet**: "Vous avez presque terminé votre inscription"
- **Contenu**:
  - "Il ne reste qu'une étape!"
  - "Cliquez pour confirmer votre inscription"
  - "Ce lien expire dans 5 jours"
- **CTA**: "Confirmer maintenant"

---

## 📱 Multi-Platform Considerations

### Web Desktop
- Formulaire dans footer (100% largeur, max 600px centré)
- Popup intention de sortie (si activé)

### Web Mobile
- Formulaire footer responsive (stack vertical)
- Pas de popup (mauvaise UX mobile)
- Bouton CTA pleine largeur

### Différences par Plateforme
| Feature | Web Desktop | Mobile Web |
|---------|-------------|------------|
| Formulaire footer | ✅ Horizontal layout | ✅ Vertical stack |
| Popup intention sortie | ✅ Activé | ❌ Désactivé (mauvaise UX) |
| Validation temps réel | ✅ On blur | ✅ On blur |
| Auto-focus champ email | ✅ Oui (si popup) | ❌ Non (éviter clavier) |

---

## ♿ Accessibilité

### Standards
- [ ] WCAG 2.1 Level AA compliance
- [ ] Labels associés aux inputs (<label for="">)
- [ ] Keyboard navigation complète (Tab, Enter)
- [ ] Contrast ratio 4.5:1 pour textes
- [ ] Messages d'erreur annoncés (aria-live)
- [ ] Focus visible sur tous les éléments interactifs

### Considérations Spécifiques
- Screen reader: annonce "Formulaire inscription newsletter, email requis"
- Erreurs: aria-describedby pour associer message d'erreur à input
- Bouton submit: état loading annoncé "Chargement en cours"
- Success message: aria-live="polite" pour annoncer succès

---

## 🌍 Internationalisation (i18n)

### Langues Supportées
- [ ] Français (FR) - par défaut
- [ ] Anglais (EN)

### Éléments à Traduire
- [ ] Labels formulaire: "Email", "S'inscrire", etc.
- [ ] Messages validation: "Email invalide", "Champ requis"
- [ ] Messages succès/erreur
- [ ] Contenu des emails (sujet + body)
- [ ] Page confirmation et désinscription

### Considérations i18n
- Dates dans emails: format selon locale (FR: DD/MM/YYYY, EN: MM/DD/YYYY)
- "Jour de la semaine": traduit selon langue (FR: "Lundi", EN: "Monday")
- Longueur variable: bouton "S'inscrire" vs "Subscribe" (design flexible)

---

## 📈 Métriques de Succès

### Métriques Primaires
| Métrique | Baseline | Target 3 mois | Timeframe |
|----------|----------|---------------|-----------|
| Nombre d'abonnés | 0 | 10,000 | 3 mois |
| Taux d'ouverture | N/A | 25%+ | Après 1er email |
| Conversion newsletter→paid | N/A | 5% | 6 mois |

### Métriques Secondaires
- **Taux de confirmation double opt-in**: Target 60%+
- **Taux de clics (CTR)**: Target 3%+
- **Taux de désinscription**: < 2% par email
- **Temps moyen avant confirmation**: < 24h

### Analytics & Tracking

#### Events à Tracker
```javascript
// Event 1: Vue formulaire
track('newsletter_form_viewed', {
  page: 'homepage',
  location: 'footer',
  timestamp: timestamp
});

// Event 2: Soumission formulaire
track('newsletter_signup_submitted', {
  email_domain: emailDomain, // ex: "gmail.com" (anonymisé)
  source: 'footer' | 'popup' | 'blog',
  timestamp: timestamp
});

// Event 3: Confirmation email
track('newsletter_confirmed', {
  time_to_confirm_hours: hours,
  reminder_sent: true | false,
  timestamp: timestamp
});

// Event 4: Ouverture email
track('newsletter_email_opened', {
  email_type: 'welcome' | 'newsletter',
  device: 'mobile' | 'desktop',
  timestamp: timestamp
});

// Event 5: Clic dans email
track('newsletter_email_clicked', {
  link_url: url,
  link_position: 'cta' | 'footer' | 'content',
  timestamp: timestamp
});

// Event 6: Désinscription
track('newsletter_unsubscribed', {
  reason: feedbackReason,
  emails_received: count,
  timestamp: timestamp
});
```

---

## ⚠️ Risques & Contraintes

### Risques Produit
| Risque | Impact | Probabilité | Mitigation |
|--------|--------|-------------|------------|
| Faible taux d'inscription | High | Medium | Tester différents CTAs, positions, lead magnet |
| Emails marqués spam | High | Low | Configurer SPF/DKIM, éviter mots spam, warm-up sender |
| Faible engagement (ouvertures) | Medium | Medium | A/B test sujets, contenu de qualité, fréquence adaptée |
| Non-conformité RGPD | Critical | Low | Double opt-in obligatoire, mentions légales claires |

### Contraintes
- **Légal**: Conformité RGPD (double opt-in, droit à l'oubli, portabilité)
- **Technique**: Rate limiting pour éviter abuse (max 1000 inscriptions/jour initialement)
- **Budget**: Coût email provider (ex: SendGrid) basé sur volume (~10,000 emails/mois)
- **Ressources**: Besoin contenu régulier pour emails (1 copywriter à 20% temps)

---

## 🧪 Testing & Validation

### User Testing
- [ ] **Prototype Testing**: 10 utilisateurs, wireframes Figma
- [ ] **Beta Testing**: 100 early adopters, 2 semaines avant launch
- [ ] **A/B Testing**:
  - Variante A: CTA "S'inscrire"
  - Variante B: CTA "Recevoir les tips"
  - Métrique: taux de soumission

### Test Cases
| Test Case | Objectif | Success Criteria |
|-----------|----------|------------------|
| Inscription happy path | Tester flow complet | Email confirmation reçu en < 2 min |
| Validation email invalide | Tester gestion erreur | Message d'erreur clair affiché |
| Double inscription | Tester détection doublon | Message "déjà inscrit" sans créer doublon |
| Désinscription | Tester processus sortie | Plus d'emails reçus après désabonnement |
| Gestion préférences | Tester personnalisation | Fréquence modifiée = emails respectent choix |

---

## 🚀 Plan de Lancement

### Phase 1 : Alpha (Internal)
- **Audience**: Équipe interne (20 personnes)
- **Duration**: 1 semaine
- **Objectif**: Identifier bugs majeurs, tester emails

### Phase 2 : Beta (Privée)
- **Audience**: 100 utilisateurs early adopters (invitations)
- **Duration**: 2 semaines
- **Objectif**: Valider UX, taux de confirmation, premier feedback

### Phase 3 : Rollout Progressif
- **Week 1**: Homepage uniquement (50% trafic A/B test)
- **Week 2**: Homepage 100% + blog posts
- **Week 3**: Toutes les pages + popup intention sortie (desktop)
- **Week 4**: General Availability + campagne marketing

### Communication

#### En Interne
- [ ] Présentation équipe produit (Kickoff)
- [ ] Formation équipe support (scripts réponse)
- [ ] Documentation interne (Notion)

#### En Externe
- [ ] Blog post announcement: "Découvrez notre newsletter"
- [ ] Social media (LinkedIn, Twitter): teaser avant launch
- [ ] In-app banner: "Nouveau! Inscrivez-vous à notre newsletter"
- [ ] Email aux utilisateurs existants: invitation à s'inscrire

---

## 📚 Documentation

### Documentation à Créer
- [ ] Help Center article: "Comment s'inscrire à la newsletter?"
- [ ] FAQ: Fréquence, contenu, désinscription, données personnelles
- [ ] Support playbook: réponses aux questions récurrentes
- [ ] Guide interne: processus d'envoi newsletter hebdomadaire

---

## 📅 Planning & Milestones

### Timeline
| Phase | Duration | Start | End | Owner |
|-------|----------|-------|-----|-------|
| Discovery | 1 week | Jan 15 | Jan 22 | PM |
| Design | 1 week | Jan 22 | Jan 29 | Designer |
| Development | 2 weeks | Jan 29 | Feb 12 | Dev Team |
| QA | 3 days | Feb 12 | Feb 15 | QA |
| Beta | 2 weeks | Feb 15 | Mar 1 | PM |
| Launch | 1 week | Mar 1 | Mar 8 | All |

### Dependencies
- Email provider setup (SendGrid account, domain verification)
- Design system: besoin composant Form Input et Button
- Legal review: validation textes RGPD
- Content team: rédaction premier email newsletter

---

## 👥 Équipe & Stakeholders

### Core Team
- **Product Manager**: Sarah Chen
- **Designer**: Lucas Martin
- **Tech Lead**: Antoine Dubois
- **Frontend Engineer**: Marie Leroy
- **Backend Engineer**: Karim Benali
- **QA**: Sophie Lambert

### Stakeholders
- **Marketing Lead**: Impliqué pour stratégie contenu et campagne launch
- **Legal/Compliance**: Review pour RGPD avant launch
- **Support Lead**: Formation sur nouveau processus

---

## 🔗 Références

- [User research summary](https://notion.so/research-newsletter)
- [Designs Figma](https://figma.com/file/newsletter-designs)
- [Technical spec](https://docs.google.com/doc/tech-spec-newsletter)
- [Email templates](https://notion.so/email-templates)
- [Analytics dashboard](https://analytics.company.com/newsletter)

---

## ✅ Checklist de Validation

### Avant Design ✅
- [x] User research complété (62% intéressés)
- [x] User stories validées avec PM et stakeholders
- [x] Success metrics définies (10k abonnés, 25% open rate)
- [x] Stakeholders alignés (Marketing, Legal)

### Avant Développement
- [ ] Designs approuvés par Design Lead
- [ ] Specs techniques reviewées par Tech Lead
- [ ] Analytics events définis et documentés
- [ ] Copy/traductions FR+EN prêtes
- [ ] Email provider (SendGrid) configuré

### Avant Launch
- [ ] QA complété (fonctionnel + accessibilité WCAG AA)
- [ ] Performance testée (< 2s load time)
- [ ] Beta feedback intégré (taux confirmation > 60%)
- [ ] Documentation publiée (Help Center)
- [ ] Support team formé (playbook prêt)
- [ ] Analytics configuré et testé
- [ ] Legal review complété (RGPD conforme)
- [ ] Rollback plan prêt (en cas de problème majeur)
