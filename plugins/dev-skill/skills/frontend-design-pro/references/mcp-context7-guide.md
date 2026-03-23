# Guide Complet MCP Context7 pour shadcn

Ce guide détaille l'utilisation de Context7 MCP pour accéder à la documentation à jour de shadcn/ui et d'autres bibliothèques.

---

## 🎯 Vue d'Ensemble

Context7 est un MCP qui permet d'accéder à la documentation à jour de milliers de bibliothèques. Pour le développement frontend avec shadcn, il permet de:
- Récupérer la syntaxe d'import correcte
- Connaître les props et variants disponibles
- Obtenir des exemples d'utilisation actuels
- Vérifier les breaking changes

---

## 🔧 Outils Disponibles

### 1. Resolve Library ID

**Outil**: `mcp__context7__resolve-library-id`

**Usage**: Résoudre le nom d'une bibliothèque en ID Context7

**Paramètres**:
| Paramètre | Type | Description |
|-----------|------|-------------|
| `libraryName` | string | Nom de la bibliothèque (ex: "shadcn", "tailwind") |
| `query` | string | Question ou contexte pour affiner la recherche |

**Exemple d'appel**:
```json
{
  "libraryName": "shadcn",
  "query": "button component with different sizes"
}
```

**Réponse**:
- Library ID au format `/org/project` (ex: `/shadcn/ui`)
- Métadonnées (description, score, nombre de snippets)

**Important**: Toujours appeler cet outil AVANT `query-docs` pour obtenir le bon ID.

**IDs Courants**:
| Bibliothèque | Library ID |
|--------------|------------|
| shadcn/ui | `/shadcn/ui` |
| Tailwind CSS | `/tailwindlabs/tailwindcss.com` |
| Next.js | `/vercel/next.js` |
| React | `/facebook/react` |
| Framer Motion | `/framer/motion` |
| Radix UI | `/radix-ui/primitives` |

---

### 2. Query Docs

**Outil**: `mcp__context7__query-docs`

**Usage**: Interroger la documentation d'une bibliothèque

**Paramètres**:
| Paramètre | Type | Description |
|-----------|------|-------------|
| `libraryId` | string | ID de la bibliothèque (obtenu via resolve-library-id) |
| `query` | string | Question sur la documentation |

**Exemple d'appel**:
```json
{
  "libraryId": "/shadcn/ui",
  "query": "how to use Dialog component with form inside"
}
```

**Réponse**:
- Extraits de documentation pertinents
- Exemples de code
- Liens vers la documentation officielle

**Quand utiliser**:
- Vérifier la syntaxe d'import
- Connaître les props disponibles
- Obtenir des exemples d'utilisation
- Comprendre les patterns recommandés

---

## 📋 Requêtes Courantes pour shadcn

### Composants de Base

```typescript
// Button
await mcp__context7__query_docs({
  libraryId: "/shadcn/ui",
  query: "Button component variants sizes disabled loading state"
});

// Card
await mcp__context7__query_docs({
  libraryId: "/shadcn/ui",
  query: "Card component with CardHeader CardContent CardFooter"
});

// Dialog
await mcp__context7__query_docs({
  libraryId: "/shadcn/ui",
  query: "Dialog modal with form controlled state"
});

// Form
await mcp__context7__query_docs({
  libraryId: "/shadcn/ui",
  query: "Form with react-hook-form zod validation"
});
```

### Patterns Avancés

```typescript
// Data Table
await mcp__context7__query_docs({
  libraryId: "/shadcn/ui",
  query: "DataTable with sorting filtering pagination TanStack Table"
});

// Command (Command Palette)
await mcp__context7__query_docs({
  libraryId: "/shadcn/ui",
  query: "Command component cmdk search filtering"
});

// Combobox
await mcp__context7__query_docs({
  libraryId: "/shadcn/ui",
  query: "Combobox autocomplete with popover"
});

// Sheet (Side Panel)
await mcp__context7__query_docs({
  libraryId: "/shadcn/ui",
  query: "Sheet side panel drawer left right"
});
```

### Theming et Styling

```typescript
// Dark Mode
await mcp__context7__query_docs({
  libraryId: "/shadcn/ui",
  query: "dark mode theme toggle next-themes"
});

// CSS Variables
await mcp__context7__query_docs({
  libraryId: "/shadcn/ui",
  query: "CSS variables theming custom colors"
});

// Typography
await mcp__context7__query_docs({
  libraryId: "/shadcn/ui",
  query: "typography prose tailwind"
});
```

---

## 🔄 Workflow Recommandé

### Workflow Standard

```
1. Résoudre l'ID
   → mcp__context7__resolve-library-id
   → libraryName: "shadcn"
   → query: contexte de votre question
   → Récupérer libraryId

2. Interroger la documentation
   → mcp__context7__query-docs
   → libraryId: ID obtenu à l'étape 1
   → query: question précise

3. Appliquer les informations
   → Utiliser la syntaxe correcte
   → Suivre les patterns recommandés
```

### Exemple Complet

```typescript
// Étape 1: Résoudre l'ID
const library = await mcp__context7__resolve_library_id({
  libraryName: "shadcn",
  query: "form validation with zod"
});
// Résultat: { libraryId: "/shadcn/ui", ... }

// Étape 2: Interroger
const docs = await mcp__context7__query_docs({
  libraryId: "/shadcn/ui",
  query: "Form component with FormField FormItem FormLabel FormMessage react-hook-form zod validation example"
});
// Résultat: Documentation avec exemples de code

// Étape 3: Implémenter
// Utiliser les exemples et patterns de la documentation
```

---

## 📖 Composants shadcn - Référence Rapide

### Structure d'Import

```typescript
// Composants UI
import { Button } from "@/components/ui/button"
import { Card, CardContent, CardDescription, CardFooter, CardHeader, CardTitle } from "@/components/ui/card"
import { Dialog, DialogContent, DialogDescription, DialogFooter, DialogHeader, DialogTitle, DialogTrigger } from "@/components/ui/dialog"

// Formulaires
import { Form, FormControl, FormDescription, FormField, FormItem, FormLabel, FormMessage } from "@/components/ui/form"
import { Input } from "@/components/ui/input"
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select"

// Navigation
import { NavigationMenu, NavigationMenuContent, NavigationMenuItem, NavigationMenuLink, NavigationMenuList, NavigationMenuTrigger } from "@/components/ui/navigation-menu"
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs"
```

### Variants Courants

```typescript
// Button variants
<Button variant="default">Default</Button>
<Button variant="destructive">Destructive</Button>
<Button variant="outline">Outline</Button>
<Button variant="secondary">Secondary</Button>
<Button variant="ghost">Ghost</Button>
<Button variant="link">Link</Button>

// Button sizes
<Button size="default">Default</Button>
<Button size="sm">Small</Button>
<Button size="lg">Large</Button>
<Button size="icon">Icon</Button>

// Badge variants
<Badge variant="default">Default</Badge>
<Badge variant="secondary">Secondary</Badge>
<Badge variant="outline">Outline</Badge>
<Badge variant="destructive">Destructive</Badge>
```

### Patterns Formulaire

```typescript
// Pattern complet avec react-hook-form + zod
import { zodResolver } from "@hookform/resolvers/zod"
import { useForm } from "react-hook-form"
import * as z from "zod"

const formSchema = z.object({
  email: z.string().email(),
  password: z.string().min(8),
})

function MyForm() {
  const form = useForm<z.infer<typeof formSchema>>({
    resolver: zodResolver(formSchema),
    defaultValues: {
      email: "",
      password: "",
    },
  })

  function onSubmit(values: z.infer<typeof formSchema>) {
    console.log(values)
  }

  return (
    <Form {...form}>
      <form onSubmit={form.handleSubmit(onSubmit)} className="space-y-8">
        <FormField
          control={form.control}
          name="email"
          render={({ field }) => (
            <FormItem>
              <FormLabel>Email</FormLabel>
              <FormControl>
                <Input placeholder="email@example.com" {...field} />
              </FormControl>
              <FormMessage />
            </FormItem>
          )}
        />
        <Button type="submit">Submit</Button>
      </form>
    </Form>
  )
}
```

---

## 🔗 Intégration avec MCP shadcn

Context7 complète le MCP shadcn registry:

| Besoin | Outil |
|--------|-------|
| Chercher un composant | `mcp__shadcn__search_items_in_registries` |
| Voir les détails | `mcp__shadcn__view_items_in_registries` |
| Exemples de code | `mcp__shadcn__get_item_examples_from_registries` |
| Documentation à jour | `mcp__context7__query-docs` |

### Workflow Combiné

```
1. Découverte
   → mcp__shadcn__search_items_in_registries
   → Trouver le composant

2. Exemples
   → mcp__shadcn__get_item_examples_from_registries
   → Voir les démos

3. Documentation
   → mcp__context7__query-docs
   → API complète et patterns

4. Implémentation
   → Combiner exemples et docs
```

---

## ⚠️ Bonnes Pratiques

### Toujours Vérifier

- **Imports**: La syntaxe peut changer entre versions
- **Props**: Nouvelles props ajoutées, anciennes dépréciées
- **Patterns**: Les best practices évoluent

### Requêtes Efficaces

**DO** ✅:
```
"Button component with loading state and disabled"
"Dialog with form controlled open state onOpenChange"
"DataTable with column sorting and row selection"
```

**DON'T** ❌:
```
"button" (trop vague)
"how to use shadcn" (trop général)
```

### Limites

- Maximum 3 appels par question recommandé
- Si pas de résultat, reformuler la requête
- Certaines docs peuvent être incomplètes

---

## 📋 Requêtes par Catégorie

### Layout

```typescript
// Card
query: "Card component structure with header content footer description"

// Accordion
query: "Accordion component with AccordionItem AccordionTrigger AccordionContent"

// Tabs
query: "Tabs component with TabsList TabsTrigger TabsContent controlled"

// Separator
query: "Separator horizontal vertical decorative"
```

### Forms

```typescript
// Input
query: "Input component with types disabled placeholder file upload"

// Textarea
query: "Textarea component autosize max length"

// Select
query: "Select component with groups placeholder searchable"

// Checkbox
query: "Checkbox component with label indeterminate state"

// RadioGroup
query: "RadioGroup with RadioGroupItem form integration"

// Switch
query: "Switch toggle component with label"

// Slider
query: "Slider range min max step"

// DatePicker
query: "DatePicker calendar popover date-fns format"
```

### Feedback

```typescript
// Alert
query: "Alert component with AlertTitle AlertDescription variants"

// AlertDialog
query: "AlertDialog confirmation modal with action cancel"

// Toast
query: "Toast notification sonner toaster"

// Progress
query: "Progress bar component value indeterminate"

// Skeleton
query: "Skeleton loading placeholder"
```

### Navigation

```typescript
// Breadcrumb
query: "Breadcrumb with BreadcrumbItem separator ellipsis"

// Dropdown Menu
query: "DropdownMenu with items groups shortcuts checkboxes"

// Context Menu
query: "ContextMenu right click menu"

// Menubar
query: "Menubar horizontal menu"

// Pagination
query: "Pagination with page numbers previous next"
```

### Data Display

```typescript
// Avatar
query: "Avatar with AvatarImage AvatarFallback"

// Badge
query: "Badge variants secondary destructive outline"

// Table
query: "Table with TableHeader TableBody TableRow TableCell"

// Tooltip
query: "Tooltip with TooltipTrigger TooltipContent"

// HoverCard
query: "HoverCard preview popup"
```

---

## 🚀 Exemples Avancés

### Data Table Complète

```typescript
// Requête
await mcp__context7__query_docs({
  libraryId: "/shadcn/ui",
  query: "DataTable complete example with TanStack Table sorting filtering pagination column visibility row selection"
});

// Résultat utilisé pour créer:
// - Configuration des colonnes
// - Hooks de table
// - Composants de filtrage
// - Pagination customisée
```

### Formulaire Multi-étapes

```typescript
// Requête
await mcp__context7__query_docs({
  libraryId: "/shadcn/ui",
  query: "multi-step form wizard with stepper validation between steps"
});

// Combine avec:
// - Tabs ou custom stepper
// - react-hook-form context
// - Validation par étape
```

### Command Palette (cmd+k)

```typescript
// Requête
await mcp__context7__query_docs({
  libraryId: "/shadcn/ui",
  query: "Command component cmdk dialog search with keyboard navigation groups"
});

// Implémentation:
// - Dialog avec Command
// - CommandInput pour recherche
// - CommandGroup pour catégories
// - CommandItem pour actions
```

---

## 🔍 Troubleshooting

### Aucun Résultat

1. Vérifier que le libraryId est correct
2. Simplifier la requête
3. Essayer des termes alternatifs
4. Vérifier que la bibliothèque est supportée

### Résultats Obsolètes

1. Context7 met à jour régulièrement
2. Vérifier la date de la doc officielle
3. Combiner avec recherche web si nécessaire

### ID Non Trouvé

1. Vérifier l'orthographe du libraryName
2. Essayer le nom complet (ex: "shadcn/ui" au lieu de "shadcn")
3. Utiliser resolve-library-id avec un query descriptif

---

Ce guide couvre l'essentiel de l'utilisation de Context7 pour shadcn. Pour les autres bibliothèques (Tailwind, Next.js, etc.), le même workflow s'applique avec les libraryId appropriés.
