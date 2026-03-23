---
name: prd-generator
description: This skill should be used when the user asks to "créer un PRD", "générer un PRD", "PRD technique", "PRD produit", "PRD stratégique", "rédiger un PRD complet", or mentions creating a Product Requirements Document. Generates comprehensive PRDs (Technical, Product, or Strategic) in French using structured templates, examples, and best practices.
version: 1.0.0
---

# PRD Generator Skill

Generate comprehensive Product Requirements Documents (PRDs) in French for three types of initiatives: Technical, Product, and Strategic.

---

## 🎯 Purpose

Create professional, complete, and actionable PRDs that serve as the single source of truth for technical projects, product features, or strategic initiatives. Each PRD type follows industry best practices and includes all necessary sections for successful execution.

---

## 📖 When to Use This Skill

Use this skill when the user:
- Asks to create a PRD: "Crée un PRD pour..."
- Specifies a type: "Je veux un PRD technique/produit/stratégique"
- Describes a project needing documentation: "Je veux faire un PRD pour une application de gestion de stock"
- Requests comprehensive project documentation

---

## 🎨 PRD Types Overview

### 1. PRD Technique
**For**: Technical implementations, architecture, APIs, systems
**Focus**: Architecture, database schema, API specifications, security, performance, deployment
**Example use cases**:
- "PRD technique d'une application de gestion de stock"
- "PRD technique pour une API REST de paiement"
- "PRD technique d'un système de notifications temps réel"

**Template**: `assets/template-technique.md`
**Example**: `examples/prd-technique-example.md` (Stock management system)

### 2. PRD Produit
**For**: Product features, user-facing functionality
**Focus**: User stories, UX flows, personas, acceptance criteria, launch plan
**Example use cases**:
- "PRD produit de l'ajout des inscriptions à la newsletter"
- "PRD produit pour un tableau de bord utilisateur"
- "PRD produit d'une fonctionnalité de recherche avancée"

**Template**: `assets/template-produit.md`
**Example**: `examples/prd-produit-example.md` (Newsletter signup)

### 3. PRD Stratégique
**For**: Strategic initiatives, market expansion, organizational change
**Focus**: Business case, market analysis, OKRs, roadmap, go-to-market strategy
**Example use cases**:
- "PRD stratégique pour la migration cloud"
- "PRD stratégique d'expansion internationale"
- "PRD stratégique de transformation digitale"

**Template**: `assets/template-strategique.md`
**Example**: `examples/prd-strategique-example.md` (Cloud migration)

---

## 🔄 Workflow: How to Create a PRD

### Step 1: Identify PRD Type

Ask the user or infer from context which type of PRD is needed:
- **Technical**: Architecture, APIs, databases, systems
- **Product**: Features, UX, user stories
- **Strategic**: Business initiatives, market expansion, transformation

If unclear, ask: "Quel type de PRD souhaitez-vous créer : Technique, Produit, ou Stratégique ?"

### Step 2: Gather Information

Use the questions checklist to gather necessary information. Consult `references/questions-checklist.md` for comprehensive questions by PRD type.

**Key questions for all types**:
1. Nom du projet/feature/initiative ?
2. Quel problème résout-on ?
3. Pourquoi maintenant ?
4. Quels sont les objectifs mesurables ?
5. Quelle est la timeline ?
6. Quels sont les risques principaux ?

**Type-specific questions**: See `references/questions-checklist.md` for detailed questions (80+ questions total).

### Step 3: Select and Customize Template

Load the appropriate template from `assets/`:
- `assets/template-technique.md` for technical PRDs
- `assets/template-produit.md` for product PRDs
- `assets/template-strategique.md` for strategic PRDs

**Customization approach**:
1. Replace all `[placeholders]` with actual content
2. Remove sections marked as "Si applicable" if not relevant
3. Keep all "Obligatoire" sections
4. Add user-specific information in each section

### Step 4: Fill Core Sections

**For all PRD types, complete these sections first**:

1. **Métadonnées**: Type, date, auteur, version, statut
2. **Résumé Exécutif**: 3-5 sentences covering What, Why, Who, Value
3. **Contexte**: Problème, solution proposée, opportunité
4. **Objectifs**: SMART objectives with timeline
5. **Métriques de Succès**: Baseline, target, timeframe
6. **Risques & Contraintes**: Top risks with mitigation
7. **Planning**: Phases, milestones, timeline
8. **Checklist de Validation**: Checkpoints before key phases

### Step 5: Add Type-Specific Sections

**PRD Technique**:
- Architecture Technique (diagrams, components)
- Spécifications API (endpoints with request/response)
- Schéma de Base de Données (SQL schemas, indexes)
- Sécurité (auth, authorization, validation)
- Performance (objectives, optimizations)
- Tests (unit, integration, e2e, performance)
- Déploiement (environments, strategy, rollback)

**PRD Produit**:
- Utilisateurs Cibles (personas with pain points)
- User Stories (format: En tant que/Je veux/Afin de)
- Expérience Utilisateur (flows, screens, interactions)
- Spécifications Fonctionnelles (features with business rules)
- Accessibilité (WCAG compliance)
- Internationalisation (langues supportées)
- Plan de Lancement (rollout phases, communication)

**PRD Stratégique**:
- Vision & Mission (long-term vision, alignment)
- Business Case (ROI projection, value)
- Analyse du Marché (trends, competitors, TAM/SAM/SOM)
- OKRs (Objectives with Key Results)
- Roadmap Stratégique (phases with initiatives)
- Budget & Ressources (investment breakdown, team)
- Go-to-Market Strategy (positioning, pricing, channels)
- Avantages Concurrentiels (differentiation, moats)

**Consult `references/sections-guide.md` for detailed guidance on each section.**

### Step 6: Apply Best Practices

Follow best practices from `references/best-practices.md`:

**Clarity**:
- Short sentences, simple vocabulary
- One idea per sentence
- No jargon or ambiguous terms

**Specificity**:
- Quantified objectives with timelines
- Measurable success criteria
- Explicit performance thresholds

**Structure**:
- Clear headings hierarchy (H1, H2, H3)
- Tables for comparisons and data
- Diagrams for architecture/flows
- Checkboxes for tracking items

**Visual Aids**:
- ASCII diagrams for architecture
- Tables for metrics, risks, budgets
- Emojis for section identification (📋 🎯 ⚠️)

### Step 7: Validate Completeness

Use the validation script (if needed):
```bash
bash scripts/validate-prd.sh chemin/vers/prd.md
```

**Manual validation**:
- [ ] All mandatory sections present
- [ ] No [TBD] or [TODO] placeholders
- [ ] Objectives are SMART (Specific, Measurable, Achievable, Relevant, Time-bound)
- [ ] Metrics have baseline and target
- [ ] Risks identified with mitigation
- [ ] Timeline is realistic

**Type-specific validation**: See checklists at end of each template.

### Step 8: Format and Save

**Format**:
- Markdown (.md file)
- UTF-8 encoding
- French language

**Naming convention**:
- `prd-[type]-[project-name].md`
- Example: `prd-produit-newsletter-inscription.md`

**Save location**: Suggest a logical location in user's project structure.

---

## 📚 Additional Resources

### Reference Files

For detailed information, consult these references:

**`references/sections-guide.md`** (18 pages)
- Detailed description of every section
- When to include each section
- Format and content guidelines
- Matrice de décision: which sections for which PRD type

**`references/best-practices.md`** (15 pages)
- Writing principles (clarity, specificity, structure)
- Best practices by PRD type
- Anti-patterns to avoid
- Quality checklist

**`references/questions-checklist.md`** (12 pages)
- 80+ questions to ask before writing
- Questions by PRD type
- How to use the checklist
- Follow-up questions

### Examples

Working examples of each PRD type:

**`examples/prd-technique-example.md`**
- Real-time stock management system
- Complete with architecture, API specs, database schema
- 15 pages, approved status

**`examples/prd-produit-example.md`**
- Newsletter signup feature
- Complete with personas, user stories, UX flows
- 25 pages, ready for development

**`examples/prd-strategique-example.md`**
- Cloud migration initiative
- Complete with business case, roadmap, budget
- 20 pages, executive-approved

### Templates

Clean templates ready to use:

**`assets/template-technique.md`**
- All technical sections with placeholders
- Code examples for SQL, JSON
- ASCII diagram templates

**`assets/template-produit.md`**
- All product sections with placeholders
- User story format
- UX section templates

**`assets/template-strategique.md`**
- All strategic sections with placeholders
- Business case tables
- OKR format

### Validation Script

**`scripts/validate-prd.sh`**
- Checks for mandatory sections
- Validates format
- Reports missing elements
- Usage: `bash scripts/validate-prd.sh file.md`

---

## 💡 Tips for Success

### Ask Clarifying Questions

If information is missing, ask before proceeding:
- "Quels sont les objectifs mesurables de ce projet ?"
- "Quelle est la timeline souhaitée ?"
- "Quels sont les principaux risques identifiés ?"

Don't guess or assume. PRDs require specific information.

### Start with Examples

If user is unsure what they want, show them examples:
- "Voulez-vous voir un exemple de PRD produit ? Consultez `examples/prd-produit-example.md`"

### Use Progressive Disclosure

Don't overwhelm the user:
1. Start with core sections (Résumé, Contexte, Objectifs)
2. Then add type-specific sections
3. Finally polish with details and formatting

### Iterate

PRDs are living documents:
- Start with a Draft version
- Collect feedback
- Update with learnings
- Version control (v1.0, v1.1, v2.0)

### Tailor to Audience

Adjust detail level based on audience:
- **Executives**: Focus on Résumé Exécutif, Business Case, ROI
- **Engineers**: Focus on Architecture, API specs, Technical details
- **Designers**: Focus on UX, User flows, Personas
- **Support**: Focus on What changes, New flows, FAQs

---

## ⚠️ Common Pitfalls to Avoid

### 1. Vague Objectives
❌ Bad: "Améliorer la performance"
✅ Good: "Réduire le temps de réponse API à < 100ms (P95) d'ici Q2 2024"

### 2. Missing Metrics
❌ Bad: No success criteria defined
✅ Good: Table with Metric, Baseline, Target, Timeframe

### 3. Incomplete User Stories
❌ Bad: "En tant qu'utilisateur, je veux une fonctionnalité de recherche"
✅ Good: Complete story with "Afin de" + Acceptance criteria + Test scenarios

### 4. Lack of Prioritization
❌ Bad: Everything is P0/Critical
✅ Good: Honest prioritization using MoSCoW (Must/Should/Could/Won't Have)

### 5. Ignoring Risks
❌ Bad: No risks section or "No risks identified"
✅ Good: Top 3-5 risks with Impact, Probability, Mitigation

### 6. No Rollback Plan (Technical PRD)
❌ Bad: Only deployment plan
✅ Good: Deployment + Rollback plan with steps

---

## 📏 Expected Output Format

When generating a PRD, create a complete Markdown file with:

**Header**:
```markdown
# PRD [Type] : [Nom du Projet]

---

## 📋 Métadonnées
[...]
```

**Body**: All sections filled with actual content (no [TBD])

**Footer**: Checklist de Validation

**Length**:
- PRD Technique: 10-20 pages
- PRD Produit: 15-30 pages
- PRD Stratégique: 20-40 pages

**Language**: French (FR)

**Format**: GitHub-flavored Markdown

---

## 🚀 Quick Start Example

**User**: "Je veux un PRD produit de l'ajout des inscriptions à la newsletter"

**Assistant workflow**:
1. Identify type: PRD Produit ✓
2. Ask key questions: Objectifs ? Timeline ? Utilisateurs cibles ?
3. Load template: `assets/template-produit.md`
4. Fill sections using user answers
5. Reference example: `examples/prd-produit-example.md` for structure
6. Apply best practices: User stories format, UX flows, metrics
7. Validate: All mandatory sections present
8. Output: Complete PRD ready for review

---

## ✅ Success Criteria for Generated PRD

A successful PRD is:
- **Clear**: Anyone can understand the purpose and plan
- **Complete**: All mandatory sections filled
- **Actionable**: Team knows exactly what to do
- **Measurable**: Success criteria are explicit
- **Realistic**: Timeline and resources are achievable

Use the checklist at the end of each template to validate.

---

## 🔗 Quick Reference

**Templates**: `assets/template-[type].md`
**Examples**: `examples/prd-[type]-example.md`
**Sections Guide**: `references/sections-guide.md`
**Best Practices**: `references/best-practices.md`
**Questions**: `references/questions-checklist.md`
**Validation**: `scripts/validate-prd.sh`

---

Generate comprehensive, professional PRDs that serve as the single source of truth for successful project execution.
