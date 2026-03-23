# Design Patterns Avancés pour Frontend

Ce guide présente des patterns de design avancés pour créer des interfaces distinctives et mémorables.

---

## 🎨 Philosophie de Design

### Éviter l'Esthétique IA Générique

**Signes d'un design "AI slop"**:
- Gradients violet/bleu sur fond blanc
- Police Inter ou Roboto partout
- Layouts prévisibles et symétriques
- Animations basiques sans personnalité
- Couleurs trop safe et ennuyeuses

**Ce qu'on veut à la place**:
- Choix typographiques audacieux
- Palettes de couleurs distinctives
- Layouts asymétriques et dynamiques
- Micro-interactions mémorables
- Textures et profondeur

---

## 🖋️ Typographie

### Polices Distinctives

**Display Fonts (Titres)**:
```css
/* Géométrique Moderne */
font-family: 'Clash Display', 'General Sans', sans-serif;

/* Élégant / Editorial */
font-family: 'Playfair Display', 'Cormorant', serif;

/* Brutalist / Industrial */
font-family: 'Space Grotesk', 'JetBrains Mono', monospace;

/* Playful / Rounded */
font-family: 'Nunito', 'Quicksand', sans-serif;

/* Art Deco / Luxury */
font-family: 'Poiret One', 'Josefin Sans', sans-serif;
```

**Combinaisons Recommandées**:
| Style | Display | Body |
|-------|---------|------|
| Tech Moderne | Clash Display | Inter |
| Editorial | Playfair Display | Source Sans Pro |
| Startup Bold | General Sans | DM Sans |
| Luxury | Cormorant | Lato |
| Developer | JetBrains Mono | IBM Plex Sans |

### Hiérarchie Typographique

```css
/* Variables CSS */
:root {
  --font-display: 'Clash Display', sans-serif;
  --font-body: 'Inter', sans-serif;

  /* Scale */
  --text-xs: clamp(0.75rem, 0.7rem + 0.25vw, 0.875rem);
  --text-sm: clamp(0.875rem, 0.8rem + 0.375vw, 1rem);
  --text-base: clamp(1rem, 0.9rem + 0.5vw, 1.125rem);
  --text-lg: clamp(1.125rem, 1rem + 0.625vw, 1.25rem);
  --text-xl: clamp(1.25rem, 1.1rem + 0.75vw, 1.5rem);
  --text-2xl: clamp(1.5rem, 1.25rem + 1.25vw, 2rem);
  --text-3xl: clamp(1.875rem, 1.5rem + 1.875vw, 2.5rem);
  --text-4xl: clamp(2.25rem, 1.75rem + 2.5vw, 3rem);
  --text-5xl: clamp(3rem, 2rem + 5vw, 4.5rem);
}
```

---

## 🎨 Couleurs et Thèmes

### Palettes Distinctives

**Dark Mode Premium**:
```css
:root {
  --background: 12 10% 4%;      /* Near black */
  --foreground: 60 10% 98%;     /* Off white */
  --card: 12 10% 8%;            /* Elevated dark */
  --primary: 142 70% 45%;       /* Vibrant green */
  --accent: 280 100% 70%;       /* Electric purple */
  --muted: 12 10% 20%;          /* Subtle gray */
}
```

**Warm Minimal**:
```css
:root {
  --background: 40 40% 97%;     /* Warm white */
  --foreground: 20 15% 15%;     /* Warm black */
  --card: 40 40% 100%;          /* Pure white */
  --primary: 24 95% 53%;        /* Warm orange */
  --accent: 340 75% 55%;        /* Coral pink */
  --muted: 40 20% 90%;          /* Warm gray */
}
```

**Brutalist**:
```css
:root {
  --background: 0 0% 100%;      /* Pure white */
  --foreground: 0 0% 0%;        /* Pure black */
  --primary: 0 0% 0%;           /* Black */
  --accent: 50 100% 50%;        /* Yellow */
  --border: 0 0% 0%;            /* Black */
  /* No grays - only black, white, yellow */
}
```

**Nature/Organic**:
```css
:root {
  --background: 40 30% 96%;     /* Cream */
  --foreground: 150 30% 15%;    /* Dark green */
  --primary: 150 40% 35%;       /* Forest green */
  --secondary: 35 60% 70%;      /* Warm sand */
  --accent: 10 70% 60%;         /* Terracotta */
}
```

### Gradients Créatifs

```css
/* Mesh Gradient */
.gradient-mesh {
  background:
    radial-gradient(at 40% 20%, hsla(280,100%,70%,0.8) 0px, transparent 50%),
    radial-gradient(at 80% 0%, hsla(189,100%,56%,0.6) 0px, transparent 50%),
    radial-gradient(at 0% 50%, hsla(355,100%,70%,0.5) 0px, transparent 50%),
    radial-gradient(at 80% 50%, hsla(340,100%,60%,0.4) 0px, transparent 50%),
    radial-gradient(at 0% 100%, hsla(22,100%,60%,0.6) 0px, transparent 50%);
  background-color: hsl(240, 10%, 5%);
}

/* Aurora Effect */
.aurora {
  background: linear-gradient(
    45deg,
    hsl(280 100% 70% / 0.3),
    hsl(190 100% 50% / 0.3),
    hsl(120 100% 50% / 0.3),
    hsl(280 100% 70% / 0.3)
  );
  background-size: 400% 400%;
  animation: aurora 15s ease infinite;
}

@keyframes aurora {
  0%, 100% { background-position: 0% 50%; }
  50% { background-position: 100% 50%; }
}
```

---

## 🎭 Motion et Animations

### Principes d'Animation

**Timing Functions**:
```css
:root {
  --ease-out-expo: cubic-bezier(0.16, 1, 0.3, 1);
  --ease-out-quint: cubic-bezier(0.22, 1, 0.36, 1);
  --ease-in-out-circ: cubic-bezier(0.85, 0, 0.15, 1);
  --spring: cubic-bezier(0.175, 0.885, 0.32, 1.275);
}
```

### Animations d'Entrée

**Stagger Reveal**:
```tsx
const staggerVariants = {
  hidden: { opacity: 0 },
  visible: {
    opacity: 1,
    transition: {
      staggerChildren: 0.1,
      delayChildren: 0.2,
    },
  },
};

const itemVariants = {
  hidden: { opacity: 0, y: 20 },
  visible: {
    opacity: 1,
    y: 0,
    transition: { duration: 0.5, ease: [0.16, 1, 0.3, 1] },
  },
};
```

**Slide + Fade**:
```css
@keyframes slideUp {
  from {
    opacity: 0;
    transform: translateY(20px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.animate-slide-up {
  animation: slideUp 0.6s var(--ease-out-expo) forwards;
  animation-delay: var(--delay, 0ms);
}
```

### Hover Effects

**Magnetic Button**:
```tsx
const MagneticButton = ({ children }) => {
  const ref = useRef<HTMLButtonElement>(null);

  const handleMouseMove = (e: MouseEvent) => {
    const { clientX, clientY } = e;
    const { left, top, width, height } = ref.current!.getBoundingClientRect();
    const x = (clientX - left - width / 2) * 0.3;
    const y = (clientY - top - height / 2) * 0.3;
    ref.current!.style.transform = `translate(${x}px, ${y}px)`;
  };

  const handleMouseLeave = () => {
    ref.current!.style.transform = 'translate(0, 0)';
  };

  return (
    <button
      ref={ref}
      onMouseMove={handleMouseMove}
      onMouseLeave={handleMouseLeave}
      className="transition-transform duration-300 ease-out"
    >
      {children}
    </button>
  );
};
```

**Glow Effect**:
```css
.glow-card {
  position: relative;
  background: hsl(var(--card));
  border-radius: 1rem;
  overflow: hidden;
}

.glow-card::before {
  content: '';
  position: absolute;
  inset: -2px;
  background: linear-gradient(
    135deg,
    hsl(var(--primary)),
    hsl(var(--accent)),
    hsl(var(--primary))
  );
  border-radius: inherit;
  z-index: -1;
  opacity: 0;
  transition: opacity 0.3s;
}

.glow-card:hover::before {
  opacity: 1;
}
```

---

## 🏗️ Layout Patterns

### Asymétrie Intentionnelle

```tsx
// Grid Asymétrique
<div className="grid grid-cols-12 gap-4">
  <div className="col-span-7 row-span-2">
    {/* Grand élément */}
  </div>
  <div className="col-span-5">
    {/* Petit élément */}
  </div>
  <div className="col-span-3 col-start-8">
    {/* Décalé */}
  </div>
  <div className="col-span-2">
    {/* Petit */}
  </div>
</div>
```

### Overlap et Superposition

```css
.overlap-section {
  display: grid;
  grid-template-columns: 1fr;
}

.overlap-section > * {
  grid-column: 1;
  grid-row: 1;
}

.overlap-image {
  width: 60%;
  justify-self: start;
}

.overlap-content {
  width: 50%;
  justify-self: end;
  align-self: center;
  margin-top: 4rem;
  z-index: 1;
}
```

### Bento Grid

```tsx
<div className="grid grid-cols-4 grid-rows-3 gap-4 h-[600px]">
  <div className="col-span-2 row-span-2 bg-gradient-to-br from-purple-500 to-pink-500 rounded-3xl" />
  <div className="col-span-2 bg-zinc-900 rounded-3xl" />
  <div className="bg-zinc-900 rounded-3xl" />
  <div className="bg-gradient-to-br from-blue-500 to-cyan-500 rounded-3xl" />
  <div className="col-span-2 row-span-1 bg-zinc-900 rounded-3xl" />
  <div className="col-span-2 bg-zinc-800 rounded-3xl" />
</div>
```

---

## ✨ Effets Visuels

### Glassmorphism

```css
.glass {
  background: hsl(var(--background) / 0.7);
  backdrop-filter: blur(12px);
  -webkit-backdrop-filter: blur(12px);
  border: 1px solid hsl(var(--border) / 0.2);
  box-shadow:
    0 4px 6px -1px hsl(0 0% 0% / 0.1),
    0 2px 4px -2px hsl(0 0% 0% / 0.1),
    inset 0 1px 0 hsl(var(--foreground) / 0.05);
}
```

### Noise Texture

```css
.noise {
  position: relative;
}

.noise::after {
  content: '';
  position: absolute;
  inset: 0;
  background-image: url("data:image/svg+xml,%3Csvg viewBox='0 0 200 200' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='noise'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.65' numOctaves='3' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%' height='100%' filter='url(%23noise)'/%3E%3C/svg%3E");
  opacity: 0.05;
  pointer-events: none;
}
```

### Grain Overlay

```css
.grain {
  position: relative;
}

.grain::before {
  content: '';
  position: absolute;
  inset: 0;
  background: url('/grain.png');
  opacity: 0.15;
  mix-blend-mode: overlay;
  pointer-events: none;
}
```

### Cursor Custom

```css
.cursor-custom {
  cursor: none;
}

.cursor-dot {
  position: fixed;
  width: 8px;
  height: 8px;
  background: hsl(var(--primary));
  border-radius: 50%;
  pointer-events: none;
  z-index: 9999;
  transform: translate(-50%, -50%);
  transition: transform 0.1s, width 0.2s, height 0.2s;
}

.cursor-dot.hover {
  width: 40px;
  height: 40px;
  background: hsl(var(--primary) / 0.2);
  border: 2px solid hsl(var(--primary));
}
```

---

## 🧩 Composants Distinctifs

### Card avec Border Gradient

```tsx
const GradientBorderCard = ({ children }) => (
  <div className="relative p-[1px] rounded-2xl bg-gradient-to-br from-primary via-accent to-primary">
    <div className="bg-background rounded-2xl p-6">
      {children}
    </div>
  </div>
);
```

### Button avec Shine Effect

```tsx
const ShineButton = ({ children }) => (
  <button className="relative overflow-hidden group bg-primary text-primary-foreground px-6 py-3 rounded-lg">
    <span className="relative z-10">{children}</span>
    <div className="absolute inset-0 -translate-x-full group-hover:translate-x-full bg-gradient-to-r from-transparent via-white/20 to-transparent transition-transform duration-700" />
  </button>
);
```

### Input avec Floating Label

```tsx
const FloatingInput = ({ label, ...props }) => (
  <div className="relative">
    <input
      {...props}
      placeholder=" "
      className="peer w-full px-4 py-3 border rounded-lg bg-background focus:border-primary focus:outline-none transition-colors"
    />
    <label className="absolute left-4 top-1/2 -translate-y-1/2 text-muted-foreground transition-all peer-focus:top-0 peer-focus:text-xs peer-focus:bg-background peer-focus:px-1 peer-focus:text-primary peer-[:not(:placeholder-shown)]:top-0 peer-[:not(:placeholder-shown)]:text-xs peer-[:not(:placeholder-shown)]:bg-background peer-[:not(:placeholder-shown)]:px-1">
      {label}
    </label>
  </div>
);
```

---

## 📱 Responsive et Accessibilité

### Mobile-First Breakpoints

```css
/* Mobile first */
.container {
  padding: 1rem;
}

/* Tablet */
@media (min-width: 768px) {
  .container {
    padding: 2rem;
  }
}

/* Desktop */
@media (min-width: 1024px) {
  .container {
    padding: 4rem;
    max-width: 1200px;
    margin: 0 auto;
  }
}
```

### Accessibilité

```tsx
// Focus visible
<button className="focus:outline-none focus-visible:ring-2 focus-visible:ring-primary focus-visible:ring-offset-2">
  Action
</button>

// Reduced motion
<div className="motion-safe:animate-bounce motion-reduce:animate-none">
  Content
</div>

// Screen reader only
<span className="sr-only">Description for screen readers</span>
```

---

## 🎯 Checklist Design

### Avant de Finaliser

- [ ] Typographie distinctive (pas Inter/Roboto par défaut)
- [ ] Palette de couleurs cohérente avec accent fort
- [ ] Au moins une animation d'entrée (stagger reveal)
- [ ] Hover states sur tous les éléments interactifs
- [ ] Espacement généreux et intentionnel
- [ ] Hiérarchie visuelle claire
- [ ] Texture ou profondeur ajoutée (shadow, grain, gradient)
- [ ] Responsive testé sur mobile
- [ ] Accessibilité (contrast, focus states)
- [ ] Performance (images optimisées, animations GPU)

---

Ce guide présente les patterns essentiels. Combiner ces techniques pour créer des interfaces uniques et mémorables.
