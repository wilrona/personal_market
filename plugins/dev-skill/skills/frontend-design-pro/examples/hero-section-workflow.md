# Workflow: Créer une Hero Section

Ce document montre le workflow complet pour créer une hero section distinctive en utilisant les MCPs magic et context7.

---

## 📋 Contexte

**Demande utilisateur**: "Crée une hero section pour ma landing page SaaS avec un titre accrocheur, un sous-titre, deux boutons CTA, et un fond animé."

---

## 🔄 Étapes du Workflow

### Étape 1: Récupérer des Inspirations

**Appel MCP magic inspiration**:
```typescript
await mcp__magic__21st_magic_component_inspiration({
  message: "Hero section pour landing page SaaS avec fond animé",
  searchQuery: "hero section animated gradient"
});
```

**Résultats attendus**:
- 3-5 exemples de hero sections
- Différents styles (minimal, bold, animated)
- Code source et aperçus

**Analyse des résultats**:
- Style A: Gradient mesh animé avec particules
- Style B: Fond sombre avec accent lumineux
- Style C: Minimal avec animation de texte

→ **Choix**: Style A (gradient mesh) car distinctif et moderne

---

### Étape 2: Vérifier Documentation shadcn

**Résoudre l'ID de la bibliothèque**:
```typescript
await mcp__context7__resolve_library_id({
  libraryName: "shadcn",
  query: "button component"
});
// Résultat: libraryId = "/shadcn/ui"
```

**Interroger la documentation du Button**:
```typescript
await mcp__context7__query_docs({
  libraryId: "/shadcn/ui",
  query: "Button component variants size primary secondary outline"
});
```

**Résultat Documentation**:
```tsx
import { Button } from "@/components/ui/button"

// Variants disponibles
<Button variant="default">Primary</Button>
<Button variant="secondary">Secondary</Button>
<Button variant="outline">Outline</Button>
<Button variant="ghost">Ghost</Button>

// Sizes
<Button size="sm">Small</Button>
<Button size="default">Default</Button>
<Button size="lg">Large</Button>
```

---

### Étape 3: Générer le Composant

**Appel MCP magic builder**:
```typescript
await mcp__magic__21st_magic_component_builder({
  message: "Hero section SaaS avec gradient animé et CTAs",
  searchQuery: "hero gradient SaaS CTA",
  absolutePathToCurrentFile: "/project/src/components/Hero.tsx",
  absolutePathToProjectDirectory: "/project",
  standaloneRequestQuery: `
    Create a Hero section component with:

    LAYOUT:
    - Full viewport height (min-h-screen)
    - Centered content with max-width container
    - Flexbox vertical centering

    BACKGROUND:
    - Animated gradient mesh background
    - Colors: deep purple (#6366f1), electric blue (#06b6d4), pink accent (#ec4899)
    - Subtle grain overlay for texture
    - Floating orbs/blobs with blur effect

    TYPOGRAPHY:
    - Large headline with gradient text effect
    - Font: 'Clash Display' or similar display font
    - Subheadline in muted color
    - Text should animate in with stagger effect

    CTAs:
    - Primary button: "Start Free Trial" - large, gradient background
    - Secondary button: "See Demo" - outline variant
    - Use shadcn Button component
    - Buttons should be side by side on desktop, stacked on mobile

    EXTRAS:
    - Subtle scroll indicator at bottom
    - Badge above headline: "✨ New: AI-powered features"
    - Social proof: "Trusted by 10,000+ teams"

    ANIMATIONS:
    - Stagger reveal for text elements
    - Floating animation for background blobs
    - Subtle hover effects on buttons

    Use Tailwind CSS, shadcn/ui components, and Framer Motion for animations.
  `
});
```

---

### Étape 4: Code Généré

```tsx
'use client';

import { motion } from 'framer-motion';
import { Button } from '@/components/ui/button';
import { Badge } from '@/components/ui/badge';
import { ArrowRight, Play, ChevronDown } from 'lucide-react';

const containerVariants = {
  hidden: { opacity: 0 },
  visible: {
    opacity: 1,
    transition: {
      staggerChildren: 0.15,
      delayChildren: 0.2,
    },
  },
};

const itemVariants = {
  hidden: { opacity: 0, y: 20 },
  visible: {
    opacity: 1,
    y: 0,
    transition: { duration: 0.6, ease: [0.16, 1, 0.3, 1] },
  },
};

export function Hero() {
  return (
    <section className="relative min-h-screen flex items-center justify-center overflow-hidden">
      {/* Background Gradient Mesh */}
      <div className="absolute inset-0 -z-10">
        <div className="absolute inset-0 bg-[#030014]" />

        {/* Gradient Orbs */}
        <motion.div
          animate={{
            scale: [1, 1.2, 1],
            x: [0, 50, 0],
            y: [0, 30, 0],
          }}
          transition={{ duration: 8, repeat: Infinity, ease: 'easeInOut' }}
          className="absolute top-1/4 left-1/4 w-[500px] h-[500px] rounded-full bg-purple-500/30 blur-[100px]"
        />
        <motion.div
          animate={{
            scale: [1.2, 1, 1.2],
            x: [0, -30, 0],
            y: [0, 50, 0],
          }}
          transition={{ duration: 10, repeat: Infinity, ease: 'easeInOut' }}
          className="absolute top-1/3 right-1/4 w-[400px] h-[400px] rounded-full bg-cyan-500/30 blur-[100px]"
        />
        <motion.div
          animate={{
            scale: [1, 1.3, 1],
            x: [0, 40, 0],
          }}
          transition={{ duration: 12, repeat: Infinity, ease: 'easeInOut' }}
          className="absolute bottom-1/4 left-1/3 w-[300px] h-[300px] rounded-full bg-pink-500/30 blur-[100px]"
        />

        {/* Grain Overlay */}
        <div className="absolute inset-0 bg-[url('/grain.png')] opacity-[0.03]" />
      </div>

      {/* Content */}
      <motion.div
        variants={containerVariants}
        initial="hidden"
        animate="visible"
        className="container mx-auto px-4 text-center"
      >
        {/* Badge */}
        <motion.div variants={itemVariants}>
          <Badge variant="outline" className="mb-6 border-purple-500/50 text-purple-300 px-4 py-1.5">
            <span className="mr-2">✨</span>
            New: AI-powered features
          </Badge>
        </motion.div>

        {/* Headline */}
        <motion.h1
          variants={itemVariants}
          className="text-5xl md:text-7xl lg:text-8xl font-bold tracking-tight mb-6"
        >
          <span className="bg-gradient-to-r from-white via-purple-200 to-cyan-200 bg-clip-text text-transparent">
            Build faster.
          </span>
          <br />
          <span className="bg-gradient-to-r from-purple-400 via-pink-400 to-cyan-400 bg-clip-text text-transparent">
            Ship smarter.
          </span>
        </motion.h1>

        {/* Subheadline */}
        <motion.p
          variants={itemVariants}
          className="text-lg md:text-xl text-gray-400 max-w-2xl mx-auto mb-8"
        >
          The all-in-one platform that helps teams move from idea to production
          in record time. No complexity, just results.
        </motion.p>

        {/* CTAs */}
        <motion.div
          variants={itemVariants}
          className="flex flex-col sm:flex-row gap-4 justify-center mb-12"
        >
          <Button
            size="lg"
            className="bg-gradient-to-r from-purple-600 to-cyan-600 hover:from-purple-500 hover:to-cyan-500 text-white px-8 py-6 text-lg rounded-full group"
          >
            Start Free Trial
            <ArrowRight className="ml-2 h-5 w-5 group-hover:translate-x-1 transition-transform" />
          </Button>
          <Button
            size="lg"
            variant="outline"
            className="border-gray-700 text-gray-300 hover:bg-gray-800/50 px-8 py-6 text-lg rounded-full group"
          >
            <Play className="mr-2 h-5 w-5" />
            See Demo
          </Button>
        </motion.div>

        {/* Social Proof */}
        <motion.p
          variants={itemVariants}
          className="text-sm text-gray-500"
        >
          Trusted by{' '}
          <span className="text-gray-300 font-medium">10,000+ teams</span>{' '}
          worldwide
        </motion.p>
      </motion.div>

      {/* Scroll Indicator */}
      <motion.div
        initial={{ opacity: 0 }}
        animate={{ opacity: 1 }}
        transition={{ delay: 1.5 }}
        className="absolute bottom-8 left-1/2 -translate-x-1/2"
      >
        <motion.div
          animate={{ y: [0, 8, 0] }}
          transition={{ duration: 1.5, repeat: Infinity }}
        >
          <ChevronDown className="h-6 w-6 text-gray-500" />
        </motion.div>
      </motion.div>
    </section>
  );
}
```

---

### Étape 5: Intégration

**Vérifier les dépendances**:
```bash
# shadcn components nécessaires
npx shadcn-ui@latest add button badge

# Framer Motion
npm install framer-motion

# Lucide icons
npm install lucide-react
```

**Ajouter le grain texture** (optionnel):
Créer `/public/grain.png` ou utiliser une texture SVG inline.

**Importer dans la page**:
```tsx
// app/page.tsx
import { Hero } from '@/components/Hero';

export default function Home() {
  return (
    <main>
      <Hero />
      {/* Autres sections */}
    </main>
  );
}
```

---

### Étape 6: Raffinements

Si des ajustements sont nécessaires, utiliser le refiner:

```typescript
await mcp__magic__21st_magic_component_refiner({
  userMessage: "Ajoute plus de contraste et rends le texte plus lisible",
  absolutePathToRefiningFile: "/project/src/components/Hero.tsx",
  context: `
    - Increase text contrast against gradient background
    - Add subtle text shadow to headline
    - Darken background slightly
    - Make CTA buttons more prominent
    - Add glow effect to primary button
  `
});
```

---

## ✅ Résultat Final

Une hero section distinctive avec:
- ✅ Gradient mesh animé unique
- ✅ Typographie bold avec effet gradient
- ✅ Animations stagger d'entrée
- ✅ Boutons shadcn stylisés
- ✅ Badge et social proof
- ✅ Scroll indicator animé
- ✅ Responsive (mobile/desktop)
- ✅ Grain overlay pour texture

---

## 📝 Notes

- Le workflow complet prend ~5 minutes
- Les résultats peuvent varier selon les inspirations disponibles
- Toujours vérifier l'accessibilité (contrast, focus states)
- Optimiser les images et animations pour la performance
