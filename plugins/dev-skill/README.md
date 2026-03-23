# 🛠️ Dev Skill - Collection complète de skills de développement

Plugin unifié contenant 3 skills essentiels pour le développement.

## 📦 Skills inclus

### 1. 🚀 Apex
**Workflow progressif d'implémentation de features**

Workflow en 8 étapes pour implémenter des features avec qualité maximale :
- Analyse → Plan → Execute → Validate → Examine → Resolve → Test → PR
- Review automatique du code
- Validation des critères d'acceptation
- Paramètres : `-A` (auto), `-X` (examine), `-T` (test), `-P` (pr)

**Usage** : `/dev-skill:apex -AX Ajoute un système de likes`

---

### 2. 🎨 Frontend Design Pro
**Création d'interfaces frontend production-ready**

Combine 21st.dev magic et Context7 shadcn pour créer des interfaces distinctives :
- Inspiration UI depuis 21st.dev
- Documentation shadcn à jour via Context7
- Code créatif qui évite les designs génériques d'IA
- Production-ready

**Usage** : `/dev-skill:frontend-design-pro Crée un dashboard analytics`

---

### 3. 📝 PRD Generator
**Génération de PRDs complets en français**

Crée des Product Requirements Documents professionnels :
- **PRD Technique** : Architecture, API, DB schema, sécurité
- **PRD Produit** : User stories, UX flows, acceptance criteria
- **PRD Stratégique** : Vision, OKRs, roadmap
- Templates et exemples inclus

**Usage** : `/dev-skill:prd-generator PRD technique d'une API de paiement`

---

## 🎯 Exemples d'utilisation

### Feature complète avec Apex
```bash
/dev-skill:apex -AXTP Implémente un système de notifications temps réel
```

### Composant UI avec Frontend Design Pro
```bash
/dev-skill:frontend-design-pro Crée une page de pricing avec 3 tiers
```

### Documentation projet avec PRD Generator
```bash
/dev-skill:prd-generator PRD technique d'une application de gestion de stock
```

## 📂 Structure organisée par skill

Chaque skill contient ses propres ressources :

### Apex
```
skills/apex/
├── SKILL.md
└── steps/          # 8 étapes du workflow
    ├── analyse.md
    ├── plan.md
    ├── execute.md
    ├── validate.md
    ├── examine.md
    ├── resolve.md
    ├── test.md
    └── pr.md
```

### Frontend Design Pro
```
skills/frontend-design-pro/
├── SKILL.md
├── examples/       # Workflows d'exemple (dashboard, form, hero)
└── references/     # Design patterns, MCP guides
```

### PRD Generator
```
skills/prd-generator/
├── SKILL.md
├── assets/         # Templates PRD (technique, produit, stratégique)
├── examples/       # Exemples de PRD complets
├── references/     # Best practices et checklists
└── scripts/        # Scripts de validation
```

## 🚀 Installation

Le plugin est disponible dans la marketplace `my-plugins`.

Installer via `/plugin install dev-skill@my-plugins`

---

**Version** : 1.0.0
**Auteur** : wilrona
**Skills** : apex, frontend-design-pro, prd-generator
