---
name: frontend-design-pro
description: This skill should be used when the user asks to "créer un composant UI", "design une interface", "améliorer le design", "ajouter un bouton/card/modal", "/ui", "/21", "utiliser shadcn", or mentions building React/Next.js components. Supports two modes - shadcn+Magic (default) or Gemini Design. Creates distinctive, production-grade interfaces.
version: 2.0.0
---

# 🎨 Frontend Design Pro Skill

Create distinctive, production-grade frontend interfaces with two powerful modes:
- **Mode shadcn+Magic** (default): 21st.dev inspiration + shadcn components
- **Mode Gemini Design**: AI-powered design generation via Gemini

---

## Paramètres disponibles

Tu peux activer les paramètres suivants dans la commande :

- `-G` ou `--gemini` : Utiliser Gemini Design au lieu de shadcn+Magic
- `-S` ou `--shadcn` : Force le mode shadcn+Magic (par défaut)

**Exemples** :
- `/frontend-design-pro Crée une page de pricing` → Mode shadcn+Magic
- `/frontend-design-pro -G Crée une page de pricing` → Mode Gemini Design
- `/frontend-design-pro --gemini Améliore ce composant` → Mode Gemini Design

---

## 🎯 Modes Disponibles

### Mode 1: shadcn + Magic (Par défaut)

**Utilise 3 MCPs :**
1. **MCP magic (21st.dev)** - Inspiration UI
2. **MCP Context7** - Documentation shadcn à jour
3. **MCP shadcn registry** - Composants shadcn

**Workflow :**
```
1. Inspiration (21st.dev) → Idées créatives
2. Query shadcn docs (Context7) → API et syntaxe
3. Search registry → Composants disponibles
4. Build component (Magic) → Code généré
5. Integrate → Écriture dans le projet
```

**Quand l'utiliser :**
- ✅ Tu veux utiliser shadcn/ui
- ✅ Tu veux des inspirations de 21st.dev
- ✅ Tu veux contrôler les composants utilisés
- ✅ Projet avec design system établi (shadcn)

---

### Mode 2: Gemini Design (avec -G)

**Utilise MCP Gemini Design :**
- `mcp__gemini-design-mcp__create_frontend` - Créer page complète
- `mcp__gemini-design-mcp__modify_frontend` - Modifier élément UI
- `mcp__gemini-design-mcp__snippet_frontend` - Générer snippet UI

**Workflow :**
```
1. Check design-system.md → Existe ?
   ├─ NON : Génération de 5 vibes → Choix utilisateur → Sauvegarde design-system.md
   └─ OUI : Utilise le design system existant

2. create_frontend / modify_frontend / snippet_frontend
   → Gemini génère le code avec le design system

3. Écriture du code → Intégration dans le projet
```

**⛔ RÈGLE ABSOLUE en mode Gemini :**
**Tu NE DOIS JAMAIS écrire du code frontend/UI toi-même.**

Gemini est ton développeur frontend. Tu n'es PAS autorisé à créer des composants visuels, pages, ou interfaces sans passer par Gemini. C'est NON-NÉGOCIABLE.

**Quand utiliser Gemini :**
- Créer une page (dashboard, landing, settings, etc.)
- Créer un composant visuel (card, modal, sidebar, form, button, etc.)
- Modifier le design d'un élément existant
- Tout ce qui concerne le styling/layout

**Exceptions (tu peux le faire toi-même) :**
- Modifier du texte/copy
- Ajouter de la logique JS sans changer l'UI
- Corriger des bugs non-visuels
- Data wiring (useQuery, useMutation, etc.)

**Quand l'utiliser :**
- ✅ Tu veux un design complètement custom
- ✅ Pas de contrainte shadcn
- ✅ Nouveau projet sans design system
- ✅ Tu veux un design premium généré par IA

---

## 📋 Initialisation (Étape 0)

**Tu es maintenant dans le workflow FRONTEND DESIGN PRO.**

### Actions immédiates

1. **Parse les paramètres** de la commande utilisateur :
   - Détecte `-G` ou `--gemini` → `mode = "gemini"`
   - Sinon → `mode = "shadcn"`

2. **Extrait la demande utilisateur** (tout ce qui suit les paramètres)

3. **Affiche un résumé** :
```
🎨 Frontend Design Pro Initialized

Request: [demande utilisateur]

Mode: [shadcn+Magic | Gemini Design]

Starting workflow...
```

4. **Charge le workflow approprié** :
   - Si `mode = "gemini"` → Lis la section **WORKFLOW GEMINI** ci-dessous
   - Si `mode = "shadcn"` → Lis la section **WORKFLOW SHADCN+MAGIC** ci-dessous

---

## 🔧 WORKFLOW SHADCN+MAGIC

### MCP Tools Available

#### 21st.dev Magic MCP

**`mcp__magic__21st_magic_component_builder`**
- Build new UI components from scratch
- Parameters: `message`, `searchQuery`, `absolutePathToCurrentFile`, `absolutePathToProjectDirectory`, `standaloneRequestQuery`

**`mcp__magic__21st_magic_component_inspiration`**
- Get inspiration and previews from 21st.dev library
- Parameters: `message`, `searchQuery`
- Returns JSON data of matching components with previews

**`mcp__magic__21st_magic_component_refiner`**
- Improve/refine existing UI components
- Parameters: `userMessage`, `absolutePathToRefiningFile`, `context`

**`mcp__magic__logo_search`**
- Search for company logos (JSX, TSX, SVG formats)
- Parameters: `queries` (array), `format`

#### Context7 MCP (for shadcn docs)

**`mcp__context7__resolve-library-id`**
- Resolve "shadcn" to Context7 library ID
- Parameters: `libraryName`, `query`

**`mcp__context7__query-docs`**
- Query up-to-date shadcn documentation
- Parameters: `libraryId`, `query`

#### Shadcn Registry MCP

**`mcp__shadcn__search_items_in_registries`**
- Search for components in shadcn registry
- Parameters: `registries`, `query`

**`mcp__shadcn__view_items_in_registries`**
- View detailed component information
- Parameters: `items` (e.g., `['@shadcn/button']`)

**`mcp__shadcn__get_item_examples_from_registries`**
- Get usage examples and demos
- Parameters: `registries`, `query`

---

### Pattern 1: Creating a New Component

#### Step 1: Understand Requirements

Gather information about what the user wants:
- What component/page/interface?
- What purpose and audience?
- Any technical constraints (Next.js, React, etc.)?
- Design preferences (minimal, bold, dark theme, etc.)?

#### Step 2: Get Inspiration from 21st.dev

**Use `mcp__magic__21st_magic_component_inspiration`** to fetch real component examples:

```
Tool: mcp__magic__21st_magic_component_inspiration
Parameters:
  message: "User wants a hero section with animated gradient background"
  searchQuery: "hero section gradient"
```

This returns JSON with:
- Component previews
- Code snippets
- Design patterns

**When to use inspiration**:
- Starting a new component design
- Looking for creative patterns
- Exploring different approaches

#### Step 3: Query shadcn Documentation

**First, resolve the library ID**:
```
Tool: mcp__context7__resolve-library-id
Parameters:
  libraryName: "shadcn"
  query: "button component with variants"
```

**Then query the documentation**:
```
Tool: mcp__context7__query-docs
Parameters:
  libraryId: "/shadcn/ui"  # From previous step
  query: "how to use Button component with different variants"
```

**When to query docs**:
- Need correct import syntax
- Check available variants/props
- Understand component API
- Get latest usage patterns

#### Step 4: Search shadcn Registry

**Search for specific components**:
```
Tool: mcp__shadcn__search_items_in_registries
Parameters:
  registries: ["@shadcn"]
  query: "button"
```

**Get usage examples**:
```
Tool: mcp__shadcn__get_item_examples_from_registries
Parameters:
  registries: ["@shadcn"]
  query: "button-demo"
```

#### Step 5: Build the Component

**Use `mcp__magic__21st_magic_component_builder`**:

```
Tool: mcp__magic__21st_magic_component_builder
Parameters:
  message: "Create a hero section with gradient background and CTA button"
  searchQuery: "hero gradient CTA"
  absolutePathToCurrentFile: "/path/to/components/Hero.tsx"
  absolutePathToProjectDirectory: "/path/to/project"
  standaloneRequestQuery: "Hero section with animated gradient mesh background, bold typography, and primary CTA button using shadcn Button component"
```

#### Step 6: Integrate Code

After receiving the component code:
1. Create or edit the target file
2. Ensure proper imports (shadcn, icons, etc.)
3. Apply design principles
4. Test the component

---

### Pattern 2: Improving Existing Component

#### Step 1: Analyze Current Component

Read the file to understand:
- Current structure and styling
- What works, what doesn't
- Design inconsistencies

#### Step 2: Get Improvement Ideas

**Use inspiration tool**:
```
Tool: mcp__magic__21st_magic_component_inspiration
Parameters:
  message: "Looking for better card designs with hover effects"
  searchQuery: "card hover effect"
```

#### Step 3: Refine the Component

**Use `mcp__magic__21st_magic_component_refiner`**:

```
Tool: mcp__magic__21st_magic_component_refiner
Parameters:
  userMessage: "Improve this card with better hover animation and shadow"
  absolutePathToRefiningFile: "/path/to/components/Card.tsx"
  context: "Add smooth hover scale, shadow elevation, and subtle gradient border"
```

#### Step 4: Apply Refinements

Integrate the suggestions while:
- Maintaining existing functionality
- Improving visual appeal
- Adding micro-interactions
- Ensuring accessibility

---

## 🎨 WORKFLOW GEMINI DESIGN

### MCP Tools Available

**`mcp__gemini-design-mcp__create_frontend`**
- Create a NEW, complete frontend file with PREMIUM DESIGN quality
- Parameters:
  - `request`: What to create (required)
  - `techStack`: Tech stack (required, e.g., "React + TypeScript + Tailwind CSS")
  - `context`: Functional/business context (required)
  - `designSystem`: ENTIRE content of design-system.md if it exists
  - `scale`: Optional sizing ('refined', 'balanced', 'zoomed')

**`mcp__gemini-design-mcp__modify_frontend`**
- Redesign a SINGLE UI element. Returns ONLY the changed code (find/replace format)
- Parameters:
  - `modification`: The SINGLE design modification (required)
  - `targetCode`: Specific code section to modify (required)
  - `designSystem`: ENTIRE content of design-system.md (required)
  - `context`: Functional context for the modification (required)

**`mcp__gemini-design-mcp__snippet_frontend`**
- Generate the JSX/HTML for a NEW UI component to INSERT into an existing file
- Parameters:
  - `request`: What code snippet to generate (required)
  - `techStack`: Tech stack (required)
  - `designSystem`: ENTIRE content of design-system.md (required)
  - `context`: Functional context (required)
  - `insertionContext`: WHERE in the file this snippet will go (required)

---

### Pattern 1: New Project (No design-system.md)

**⚠️ MANDATORY: Design System Setup First**

Si `design-system.md` n'existe PAS à la racine du projet :

#### Step 1: Ask User for Scale

Demande à l'utilisateur quelle échelle il préfère :
- **refined** : Petit, élégant (Apple/Notion-like)
- **balanced** : Standard, équilibré
- **zoomed** : Large, bold

#### Step 2: Generate 5 Vibes

Appelle `create_frontend` **CINQ FOIS** pour générer 5 sections distinctes (PAS des pages complètes).

```
Tool: mcp__gemini-design-mcp__create_frontend (x5)
Parameters:
  request: "Generate vibe section [1-5] with distinct aesthetic"
  techStack: "[tech stack du projet]"
  context: "Self-contained section component for vibe selection"
  scale: "[refined/balanced/zoomed]"
```

Chaque appel doit retourner une section unique (hero, card grid, form, dashboard panel, etc.) avec un style différent.

#### Step 3: Assemble Vibes Page

Assemble les 5 sections dans un fichier `vibes-selection.tsx`.

#### Step 4: User Chooses Vibe

Demande à l'utilisateur d'ouvrir la page et de choisir un vibe (ex: "vibe 3").

#### Step 5: Save to design-system.md

Extrais le code ENTIER de la section choisie et sauvegarde-le dans `design-system.md` à la racine du projet.

#### Step 6: Cleanup

Demande : "Supprimer vibes-selection.tsx ?"

---

### Pattern 2: Existing Project (design-system.md exists)

Si `design-system.md` existe :

#### Step 1: Read Design System

Lis le fichier complet `design-system.md`.

#### Step 2: Create Component

**Use `create_frontend` pour une nouvelle page complète** :

```
Tool: mcp__gemini-design-mcp__create_frontend
Parameters:
  request: "A pricing page with 3 tiers (Basic, Pro, Enterprise)"
  techStack: "Next.js 14 App Router + TypeScript + Tailwind CSS"
  context: "Pricing page for SaaS product. Features: tier comparison, annual/monthly toggle, highlight Pro tier as recommended, CTA buttons for each tier"
  designSystem: "[ENTIRE content of design-system.md]"
```

**Use `snippet_frontend` pour un nouveau composant dans un fichier existant** :

```
Tool: mcp__gemini-design-mcp__snippet_frontend
Parameters:
  request: "A sidebar component with navigation links and user profile section"
  techStack: "React + TypeScript + Tailwind CSS"
  designSystem: "[ENTIRE content of design-system.md]"
  context: "Sidebar for dashboard. Features: collapsible nav items, active state indicator, user profile at bottom with avatar and logout"
  insertionContext: "Inside the Dashboard component, after the header section"
```

#### Step 3: Integrate Code

Gemini retourne le code → **TU dois l'écrire sur disque avec Write/Edit**.

---

### Pattern 3: Modify Existing Component

**Use `modify_frontend` pour redesigner un élément existant** :

```
Tool: mcp__gemini-design-mcp__modify_frontend
Parameters:
  modification: "Redesign this button to look more premium with gradient and shadow"
  targetCode: "[Code du bouton à modifier]"
  designSystem: "[ENTIRE content of design-system.md]"
  context: "Primary CTA button. Should be eye-catching but not overwhelming. Used for main actions like 'Sign Up', 'Get Started'"
```

Gemini retourne :
```
// NEW IMPORTS NEEDED:
import { X } from "y";

// FIND THIS CODE:
<exact existing code>

// REPLACE WITH:
<new redesigned code>
```

**TU appliques le find/replace avec Edit**.

---

### ⚠️ Checklist avant de coder en mode Gemini

- [ ] Am I creating/modifying something visual?
- [ ] If YES → STOP → Use Gemini
- [ ] If NO (pure logic) → You can continue

### ❌ Ce qui est INTERDIT en mode Gemini

- Écrire un composant React avec styling sans Gemini
- Créer une page sans Gemini
- "Réutiliser des styles existants" comme excuse pour ne pas utiliser Gemini
- Faire du frontend "rapidement" toi-même

### ✅ Ce qui est ATTENDU en mode Gemini

- Appeler Gemini AVANT d'écrire du code frontend
- Demander le choix du vibe si nouveau projet
- Laisser Gemini designer, toi tu implémente

---

## 🎨 Design Principles (Both Modes)

### Avoid Generic AI Aesthetics

**NEVER use**:
- Overused fonts: Inter, Roboto, Arial, system fonts
- Cliché colors: purple gradients on white
- Predictable layouts and patterns
- Cookie-cutter designs

### Commit to Bold Direction

**Choose a clear aesthetic**:
- Brutally minimal
- Maximalist chaos
- Retro-futuristic
- Organic/natural
- Luxury/refined
- Playful/toy-like
- Editorial/magazine
- Brutalist/raw
- Art deco/geometric
- Soft/pastel
- Industrial/utilitarian

### Focus Areas

**Typography**:
- Choose distinctive, characterful fonts
- Pair display fonts with refined body fonts
- Avoid generic choices

**Color & Theme**:
- Commit to a cohesive aesthetic
- Use CSS variables for consistency
- Dominant colors with sharp accents

**Motion**:
- Use animations for micro-interactions
- Focus on high-impact moments
- Staggered reveals on page load
- Scroll-triggering and hover states

**Spatial Composition**:
- Unexpected layouts
- Asymmetry and overlap
- Grid-breaking elements
- Generous negative space OR controlled density

**Visual Details**:
- Gradient meshes
- Noise textures
- Geometric patterns
- Layered transparencies
- Dramatic shadows
- Custom cursors
- Grain overlays

---

## 🚀 Quick Reference

### Mode shadcn+Magic (default)

**New Component:**
```
1. mcp__magic__21st_magic_component_inspiration → Ideas
2. mcp__context7__resolve-library-id → Get shadcn ID
3. mcp__context7__query-docs → Latest API
4. mcp__magic__21st_magic_component_builder → Generate
5. Edit/Write → Integrate
```

**Improve Component:**
```
1. Read → Understand current state
2. mcp__magic__21st_magic_component_inspiration → Ideas
3. mcp__magic__21st_magic_component_refiner → Suggestions
4. Edit → Apply improvements
```

**Add shadcn Component:**
```
1. mcp__shadcn__search_items_in_registries → Find
2. mcp__shadcn__get_item_examples_from_registries → Examples
3. mcp__context7__query-docs → Latest docs
4. Implement with proper patterns
```

---

### Mode Gemini Design (-G)

**New Project (no design-system.md):**
```
1. Ask user for scale (refined/balanced/zoomed)
2. Generate 5 vibes with create_frontend (x5)
3. User chooses vibe
4. Save to design-system.md
5. Proceed with creation
```

**Create Page:**
```
1. Read design-system.md
2. mcp__gemini-design-mcp__create_frontend
3. Write code to disk
```

**Create Component Snippet:**
```
1. Read design-system.md
2. mcp__gemini-design-mcp__snippet_frontend
3. Insert into existing file
```

**Modify Design:**
```
1. Read design-system.md
2. mcp__gemini-design-mcp__modify_frontend
3. Apply find/replace with Edit
```

---

## ✅ Skill Triggers

This skill activates when user says:
- "Crée un composant UI"
- "Design une interface"
- "Améliore le design de..."
- "Ajoute un bouton/card/modal/dialog"
- "/ui" or "/21"
- "Utilise shadcn pour..."
- "Crée une page avec..."
- Mentions React/Next.js component creation
- "-G" or "--gemini" flag (forces Gemini mode)

---

Create distinctive, memorable interfaces that stand out from generic AI-generated designs. Choose your mode wisely based on your project needs!
