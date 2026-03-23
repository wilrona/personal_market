# 🎨 My Personal Claude Code Plugins

Ma collection personnelle de plugins pour Claude Code.

## 📦 Plugins disponibles

### 1. 🛠️ Dev Skill
**Collection complète de 3 skills de développement**

Un plugin unifié contenant les skills essentiels :
- ✅ **Apex** : Workflow progressif d'implémentation (Analyse → Plan → Execute → Validate → Examine → Resolve → Test → PR)
- ✅ **Frontend Design Pro** : Création d'interfaces production-ready avec 21st.dev + shadcn
- ✅ **PRD Generator** : Génération de PRDs complets en français (Technique, Produit, Stratégique)

**Skills** :
- `/dev-skill:apex -AX Feature`
- `/dev-skill:frontend-design-pro Composant UI`
- `/dev-skill:prd-generator PRD technique`

---

### 2. 🔄 Ralph Pro
**Développement itératif avec support multi-PRD**

Développement itératif avec boucles d'amélioration :
- ✅ Support multi-PRD
- ✅ Circuit breaker
- ✅ Progress tracking
- ✅ Boucles d'auto-amélioration

**Commande** : `/ralph-pro`

---

## 🚀 Installation

### Activer tous les plugins

Ajoute dans ton `settings.json` :

```json
{
  "dev-skill@my-plugins": true,
  "ralph-pro@my-plugins": true
}
```

## 📊 Structure

```
my-plugins/
├── .claude-plugin/
│   └── marketplace.json          # Configuration marketplace
├── plugins/
│   ├── dev-skill/                 # 3 skills de développement
│   │   ├── plugin.json
│   │   ├── README.md
│   │   └── skills/
│   │       ├── apex/
│   │       │   ├── SKILL.md
│   │       │   └── steps/         # 8 étapes du workflow
│   │       ├── frontend-design-pro/
│   │       │   ├── SKILL.md
│   │       │   ├── examples/      # Workflows UI
│   │       │   └── references/    # Design patterns
│   │       └── prd-generator/
│   │           ├── SKILL.md
│   │           ├── assets/        # Templates PRD
│   │           ├── examples/      # PRD complets
│   │           ├── references/    # Best practices
│   │           └── scripts/       # Validation
│   └── ralph-pro/                 # Développement itératif
└── README.md
```

## 🎯 Cas d'usage

### Dev Skill - Feature complète
```bash
/dev-skill:apex -AXTP Implémente un système de notifications temps réel
```
→ Analyse + Plan + Code + Validate + Review + Tests + PR

### Dev Skill - Composant UI
```bash
/dev-skill:frontend-design-pro Crée un dashboard analytics moderne
```
→ UI inspirée de 21st.dev + shadcn à jour

### Dev Skill - Documentation projet
```bash
/dev-skill:prd-generator PRD technique d'une API de paiement Stripe
```
→ PRD complet avec architecture, sécurité, tests

### Ralph Pro - Amélioration itérative
```bash
/ralph-pro Améliore le code de l'authentification
```
→ Boucles d'amélioration jusqu'à perfection

## 📈 Historique

**v1.0.0** (Février 2026)
- Consolidation : apex, frontend-design-pro, prd-generator → dev-skill
- 2 plugins : dev-skill + ralph-pro
- Structure conforme à la documentation officielle Claude Code

---

**Version** : 1.0.0
**Auteur** : wilrona
**Plugins** : dev-skill (3 skills), ralph-pro
**Dernière mise à jour** : Février 2026
