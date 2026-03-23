# Guide Complet MCP Magic (21st.dev)

Ce guide détaille l'utilisation des outils MCP magic pour la création et l'amélioration de composants UI.

---

## 🎯 Vue d'Ensemble

Le MCP magic fournit accès à la bibliothèque 21st.dev qui contient des milliers de composants UI React/Next.js de haute qualité. Ces outils permettent de:
- Récupérer des inspirations de design
- Générer de nouveaux composants
- Améliorer des composants existants
- Chercher des logos d'entreprises

---

## 🔧 Outils Disponibles

### 1. Component Inspiration

**Outil**: `mcp__magic__21st_magic_component_inspiration`

**Usage**: Récupérer des inspirations et aperçus de composants depuis 21st.dev

**Paramètres**:
| Paramètre | Type | Description |
|-----------|------|-------------|
| `message` | string | Message complet de l'utilisateur |
| `searchQuery` | string | Requête de recherche (2-4 mots max) |

**Exemple d'appel**:
```json
{
  "message": "Je veux créer une section hero avec un fond animé",
  "searchQuery": "hero animated background"
}
```

**Réponse**: JSON contenant:
- Noms des composants correspondants
- Aperçus visuels
- Code source
- Métadonnées (auteur, likes, etc.)

**Quand utiliser**:
- Début d'un nouveau projet UI
- Recherche d'idées de design
- Exploration de patterns
- Avant de coder pour voir les approches existantes

**Bonnes pratiques**:
- Utiliser des termes de recherche courts et précis
- Combiner type de composant + caractéristique (ex: "card hover", "form modern")
- Explorer plusieurs variantes avant de choisir

---

### 2. Component Builder

**Outil**: `mcp__magic__21st_magic_component_builder`

**Usage**: Créer un nouveau composant UI basé sur une recherche

**Paramètres**:
| Paramètre | Type | Description |
|-----------|------|-------------|
| `message` | string | Message complet de l'utilisateur |
| `searchQuery` | string | Requête de recherche (2-4 mots) |
| `absolutePathToCurrentFile` | string | Chemin absolu du fichier cible |
| `absolutePathToProjectDirectory` | string | Chemin absolu du projet |
| `standaloneRequestQuery` | string | Description détaillée du composant souhaité |

**Exemple d'appel**:
```json
{
  "message": "Crée une card produit avec image, titre, prix et bouton d'achat",
  "searchQuery": "product card ecommerce",
  "absolutePathToCurrentFile": "/Users/dev/project/src/components/ProductCard.tsx",
  "absolutePathToProjectDirectory": "/Users/dev/project",
  "standaloneRequestQuery": "Product card component with product image on top, title, description, price tag with discount badge, and add to cart button. Use shadcn Card and Button components. Include hover animation with scale and shadow."
}
```

**Réponse**: Code complet du composant prêt à être intégré

**Quand utiliser**:
- Création de nouveaux composants from scratch
- Besoin d'un composant spécifique qui n'existe pas
- Génération rapide de boilerplate avec design

**Bonnes pratiques**:
- Fournir un `standaloneRequestQuery` très détaillé
- Inclure les technologies souhaitées (shadcn, Tailwind, etc.)
- Spécifier les interactions et animations
- Mentionner l'accessibilité si importante

---

### 3. Component Refiner

**Outil**: `mcp__magic__21st_magic_component_refiner`

**Usage**: Améliorer et raffiner un composant UI existant

**Paramètres**:
| Paramètre | Type | Description |
|-----------|------|-------------|
| `userMessage` | string | Message de l'utilisateur sur l'amélioration |
| `absolutePathToRefiningFile` | string | Chemin absolu du fichier à améliorer |
| `context` | string | Contexte spécifique des améliorations souhaitées |

**Exemple d'appel**:
```json
{
  "userMessage": "Améliore cette card avec de meilleures animations",
  "absolutePathToRefiningFile": "/Users/dev/project/src/components/Card.tsx",
  "context": "Add smooth hover animation with scale(1.02), elevated shadow on hover, subtle gradient border, and staggered content reveal animation on mount"
}
```

**Réponse**: Version améliorée du composant avec les modifications demandées

**Quand utiliser**:
- Amélioration de composants existants
- Ajout d'animations/interactions
- Raffinement du design
- Optimisation de l'UX

**Bonnes pratiques**:
- Être spécifique sur les améliorations dans `context`
- Mentionner les aspects à conserver
- Décrire les interactions souhaitées
- Inclure les contraintes techniques

---

### 4. Logo Search

**Outil**: `mcp__magic__logo_search`

**Usage**: Rechercher des logos d'entreprises au format code

**Paramètres**:
| Paramètre | Type | Description |
|-----------|------|-------------|
| `queries` | string[] | Liste des noms d'entreprises |
| `format` | string | Format souhaité: "JSX", "TSX", ou "SVG" |

**Exemple d'appel**:
```json
{
  "queries": ["google", "microsoft", "stripe", "github"],
  "format": "TSX"
}
```

**Réponse**: Pour chaque logo trouvé:
- Nom du composant (ex: GoogleIcon)
- Code du composant
- Instructions d'import

**Quand utiliser**:
- Sections "Trusted by" / "Nos partenaires"
- Intégrations tierces
- Footer avec logos
- Pages de connexion OAuth

**Bonnes pratiques**:
- Utiliser le nom exact de l'entreprise
- Préférer TSX pour projets TypeScript
- SVG pour usage hors React

---

## 📋 Patterns de Recherche Efficaces

### Composants de Base
| Composant | searchQuery suggérés |
|-----------|---------------------|
| Hero Section | "hero section animated", "hero gradient", "hero minimal" |
| Navigation | "navbar sticky", "navigation mobile", "sidebar menu" |
| Cards | "card hover", "product card", "pricing card" |
| Forms | "form modern", "login form", "contact form" |
| Modals | "modal animated", "dialog confirmation", "popup" |
| Tables | "data table", "table sortable", "table responsive" |
| Lists | "list animated", "timeline vertical", "steps" |

### Patterns de Design
| Style | searchQuery suggérés |
|-------|---------------------|
| Minimal | "minimal clean", "simple white", "subtle" |
| Bold | "bold colorful", "vibrant gradient", "dynamic" |
| Dark Mode | "dark theme", "dark mode", "night" |
| Glassmorphism | "glass effect", "blur background", "frosted" |
| Neumorphism | "neumorphic", "soft ui", "3d shadow" |
| Gradient | "gradient mesh", "color gradient", "aurora" |

### Animations
| Type | searchQuery suggérés |
|------|---------------------|
| Hover | "hover effect", "hover scale", "hover glow" |
| Entrance | "fade in", "slide up", "stagger reveal" |
| Scroll | "scroll animation", "parallax", "scroll trigger" |
| Micro | "micro interaction", "button press", "toggle" |

---

## 🔄 Workflows Recommandés

### Workflow 1: Nouveau Composant

```
1. Inspiration
   → mcp__magic__21st_magic_component_inspiration
   → searchQuery: "[type] [style]"
   → Évaluer les résultats

2. Sélection & Adaptation
   → Choisir le meilleur exemple
   → Noter les éléments à adapter

3. Build
   → mcp__magic__21st_magic_component_builder
   → standaloneRequestQuery détaillé basé sur inspiration
   → Inclure spécificités du projet

4. Intégration
   → Copier le code généré
   → Adapter imports
   → Tester
```

### Workflow 2: Amélioration

```
1. Analyse
   → Lire le fichier existant
   → Identifier les points faibles

2. Inspiration (optionnel)
   → mcp__magic__21st_magic_component_inspiration
   → Chercher de meilleures versions

3. Refinement
   → mcp__magic__21st_magic_component_refiner
   → context: liste précise des améliorations

4. Application
   → Intégrer les changements
   → Valider visuellement
```

### Workflow 3: Page Complète

```
1. Décomposition
   → Identifier les composants nécessaires
   → Hero, Features, Pricing, Footer, etc.

2. Inspiration par section
   → Pour chaque section:
   → mcp__magic__21st_magic_component_inspiration

3. Build progressif
   → mcp__magic__21st_magic_component_builder par section
   → Maintenir cohérence visuelle

4. Assemblage
   → Combiner les composants
   → Ajuster espacement et transitions
```

---

## ⚠️ Limites et Considérations

### Limites
- Les résultats dépendent de la qualité de la recherche
- Le code généré peut nécessiter des adaptations
- Certains composants peuvent utiliser des dépendances non installées

### Considérations
- Vérifier les licences des composants inspirés
- Adapter au design system du projet
- Tester l'accessibilité
- Optimiser pour la performance

### Troubleshooting

**Aucun résultat trouvé**:
- Simplifier la recherche
- Utiliser des termes plus génériques
- Essayer des synonymes

**Code incompatible**:
- Vérifier les versions des dépendances
- Adapter la syntaxe si nécessaire
- Remplacer les imports manquants

**Design incohérent**:
- Appliquer les CSS variables du projet
- Uniformiser la typographie
- Aligner les couleurs avec le thème

---

## 📖 Exemples Complets

### Exemple 1: Hero Section

```typescript
// 1. Inspiration
await mcp__magic__21st_magic_component_inspiration({
  message: "Hero section avec gradient animé et CTA",
  searchQuery: "hero gradient animated"
});

// 2. Build
await mcp__magic__21st_magic_component_builder({
  message: "Créer hero section",
  searchQuery: "hero gradient CTA",
  absolutePathToCurrentFile: "/project/src/components/Hero.tsx",
  absolutePathToProjectDirectory: "/project",
  standaloneRequestQuery: `
    Hero section with:
    - Animated gradient mesh background
    - Large bold headline with gradient text
    - Subheadline with muted color
    - Two CTA buttons (primary and secondary)
    - Floating decorative elements
    - Responsive for mobile
    Use Tailwind CSS and shadcn Button component
  `
});
```

### Exemple 2: Card Améliorée

```typescript
// 1. Analyse existante
// Card actuelle a un design basique sans animations

// 2. Inspiration
await mcp__magic__21st_magic_component_inspiration({
  message: "Cards avec effets hover modernes",
  searchQuery: "card hover effect glass"
});

// 3. Refinement
await mcp__magic__21st_magic_component_refiner({
  userMessage: "Améliore cette card avec effet glassmorphism et hover",
  absolutePathToRefiningFile: "/project/src/components/Card.tsx",
  context: `
    Add:
    - Glassmorphism background (backdrop-blur, semi-transparent)
    - Hover: scale(1.02), shadow-2xl, border glow
    - Gradient border on hover
    - Smooth transition (300ms ease-out)
    - Subtle shine effect on hover
    Keep existing content structure
  `
});
```

### Exemple 3: Logos Partenaires

```typescript
// Récupérer logos
const logos = await mcp__magic__logo_search({
  queries: ["google", "amazon", "microsoft", "stripe"],
  format: "TSX"
});

// Utilisation dans composant
const PartnersSection = () => (
  <section className="py-16 bg-muted/50">
    <p className="text-center text-muted-foreground mb-8">
      Trusted by industry leaders
    </p>
    <div className="flex justify-center items-center gap-12 opacity-60">
      <GoogleIcon className="h-8" />
      <AmazonIcon className="h-8" />
      <MicrosoftIcon className="h-8" />
      <StripeIcon className="h-8" />
    </div>
  </section>
);
```

---

Ce guide couvre l'essentiel de l'utilisation du MCP magic. Pour des cas d'usage spécifiques, consulter les exemples dans `examples/`.
