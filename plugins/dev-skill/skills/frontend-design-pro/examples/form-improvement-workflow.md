# Workflow: Améliorer un Formulaire Existant

Ce document montre comment utiliser les MCPs pour améliorer le design d'un formulaire existant.

---

## 📋 Contexte

**Demande utilisateur**: "Améliore le design de ce formulaire de connexion, il est trop basique."

**Fichier existant**: `/src/components/LoginForm.tsx`

```tsx
// Formulaire actuel (basique)
export function LoginForm() {
  return (
    <form className="space-y-4">
      <div>
        <label>Email</label>
        <input type="email" placeholder="Enter email" />
      </div>
      <div>
        <label>Password</label>
        <input type="password" placeholder="Enter password" />
      </div>
      <button type="submit">Login</button>
    </form>
  );
}
```

---

## 🔄 Étapes du Workflow

### Étape 1: Analyser le Formulaire Actuel

**Problèmes identifiés**:
- ❌ Inputs HTML natifs (pas shadcn)
- ❌ Pas de validation visuelle
- ❌ Aucune animation
- ❌ Layout basique
- ❌ Pas de feedback utilisateur
- ❌ Design générique

---

### Étape 2: Récupérer des Inspirations

```typescript
await mcp__magic__21st_magic_component_inspiration({
  message: "Formulaire de connexion moderne avec animations",
  searchQuery: "login form modern animated"
});
```

**Résultats analysés**:
- Style A: Glassmorphism avec floating labels
- Style B: Dark mode avec gradient accents
- Style C: Minimal avec micro-interactions

→ **Choix**: Combiner Style A (floating labels) + Style B (dark mode accents)

---

### Étape 3: Vérifier Documentation shadcn

**Query pour Form component**:
```typescript
await mcp__context7__query_docs({
  libraryId: "/shadcn/ui",
  query: "Form component with FormField FormItem FormLabel FormControl FormMessage react-hook-form zod validation"
});
```

**Résultat**: Pattern complet de formulaire avec validation

**Query pour Input component**:
```typescript
await mcp__context7__query_docs({
  libraryId: "/shadcn/ui",
  query: "Input component with icons prefix suffix disabled states"
});
```

---

### Étape 4: Utiliser le Refiner

```typescript
await mcp__magic__21st_magic_component_refiner({
  userMessage: "Améliore ce formulaire de connexion basique",
  absolutePathToRefiningFile: "/src/components/LoginForm.tsx",
  context: `
    Transform this basic login form into a premium, modern design:

    STRUCTURE:
    - Use shadcn Form, FormField, FormItem, FormLabel, FormControl, FormMessage
    - Use react-hook-form with zod validation
    - Add email and password validation

    STYLING:
    - Dark theme card with glassmorphism effect
    - Gradient border on focus
    - Floating labels that animate up on focus
    - Icons in input fields (Mail, Lock icons)

    ANIMATIONS:
    - Stagger reveal animation on mount
    - Shake animation on validation error
    - Success checkmark animation
    - Loading spinner on submit

    EXTRAS:
    - "Remember me" checkbox
    - "Forgot password?" link
    - Divider with "or continue with"
    - Social login buttons (Google, GitHub)
    - "Don't have an account? Sign up" link

    VISUAL POLISH:
    - Subtle shadow and glow effects
    - Smooth transitions (300ms)
    - Focus ring with brand color
    - Error states with red accent
    - Success states with green accent
  `
});
```

---

### Étape 5: Code Amélioré Généré

```tsx
'use client';

import { useState } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { useForm } from 'react-hook-form';
import { zodResolver } from '@hookform/resolvers/zod';
import * as z from 'zod';
import { Mail, Lock, Loader2, Check, Github } from 'lucide-react';

import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Checkbox } from '@/components/ui/checkbox';
import {
  Form,
  FormControl,
  FormField,
  FormItem,
  FormLabel,
  FormMessage,
} from '@/components/ui/form';

const formSchema = z.object({
  email: z.string().email('Please enter a valid email'),
  password: z.string().min(8, 'Password must be at least 8 characters'),
  remember: z.boolean().default(false),
});

type FormValues = z.infer<typeof formSchema>;

const containerVariants = {
  hidden: { opacity: 0 },
  visible: {
    opacity: 1,
    transition: { staggerChildren: 0.1, delayChildren: 0.1 },
  },
};

const itemVariants = {
  hidden: { opacity: 0, y: 10 },
  visible: { opacity: 1, y: 0, transition: { duration: 0.4 } },
};

const shakeVariants = {
  shake: {
    x: [-10, 10, -10, 10, 0],
    transition: { duration: 0.4 },
  },
};

export function LoginForm() {
  const [isLoading, setIsLoading] = useState(false);
  const [isSuccess, setIsSuccess] = useState(false);

  const form = useForm<FormValues>({
    resolver: zodResolver(formSchema),
    defaultValues: {
      email: '',
      password: '',
      remember: false,
    },
  });

  async function onSubmit(values: FormValues) {
    setIsLoading(true);
    // Simulate API call
    await new Promise((resolve) => setTimeout(resolve, 2000));
    setIsLoading(false);
    setIsSuccess(true);
    console.log(values);
  }

  return (
    <div className="min-h-screen flex items-center justify-center bg-[#0a0a0a] p-4">
      {/* Background Effects */}
      <div className="absolute inset-0 overflow-hidden">
        <div className="absolute top-1/4 left-1/4 w-96 h-96 bg-purple-500/20 rounded-full blur-[100px]" />
        <div className="absolute bottom-1/4 right-1/4 w-96 h-96 bg-cyan-500/20 rounded-full blur-[100px]" />
      </div>

      {/* Card */}
      <motion.div
        initial={{ opacity: 0, y: 20 }}
        animate={{ opacity: 1, y: 0 }}
        className="relative w-full max-w-md"
      >
        {/* Gradient Border */}
        <div className="absolute -inset-[1px] bg-gradient-to-r from-purple-500 via-cyan-500 to-purple-500 rounded-2xl opacity-50 blur-sm" />

        {/* Card Content */}
        <div className="relative bg-[#111111]/90 backdrop-blur-xl rounded-2xl p-8 shadow-2xl border border-white/10">
          <motion.div
            variants={containerVariants}
            initial="hidden"
            animate="visible"
          >
            {/* Header */}
            <motion.div variants={itemVariants} className="text-center mb-8">
              <h1 className="text-2xl font-bold text-white mb-2">Welcome back</h1>
              <p className="text-gray-400 text-sm">Sign in to your account</p>
            </motion.div>

            {/* Form */}
            <Form {...form}>
              <form onSubmit={form.handleSubmit(onSubmit)} className="space-y-5">
                {/* Email Field */}
                <motion.div variants={itemVariants}>
                  <FormField
                    control={form.control}
                    name="email"
                    render={({ field, fieldState }) => (
                      <FormItem>
                        <FormLabel className="text-gray-300">Email</FormLabel>
                        <FormControl>
                          <motion.div
                            variants={shakeVariants}
                            animate={fieldState.error ? 'shake' : ''}
                            className="relative"
                          >
                            <Mail className="absolute left-3 top-1/2 -translate-y-1/2 h-4 w-4 text-gray-500" />
                            <Input
                              {...field}
                              type="email"
                              placeholder="name@example.com"
                              className="pl-10 bg-white/5 border-white/10 text-white placeholder:text-gray-500 focus:border-purple-500 focus:ring-purple-500/20 transition-all"
                            />
                          </motion.div>
                        </FormControl>
                        <FormMessage className="text-red-400" />
                      </FormItem>
                    )}
                  />
                </motion.div>

                {/* Password Field */}
                <motion.div variants={itemVariants}>
                  <FormField
                    control={form.control}
                    name="password"
                    render={({ field, fieldState }) => (
                      <FormItem>
                        <div className="flex justify-between items-center">
                          <FormLabel className="text-gray-300">Password</FormLabel>
                          <a href="#" className="text-xs text-purple-400 hover:text-purple-300 transition-colors">
                            Forgot password?
                          </a>
                        </div>
                        <FormControl>
                          <motion.div
                            variants={shakeVariants}
                            animate={fieldState.error ? 'shake' : ''}
                            className="relative"
                          >
                            <Lock className="absolute left-3 top-1/2 -translate-y-1/2 h-4 w-4 text-gray-500" />
                            <Input
                              {...field}
                              type="password"
                              placeholder="••••••••"
                              className="pl-10 bg-white/5 border-white/10 text-white placeholder:text-gray-500 focus:border-purple-500 focus:ring-purple-500/20 transition-all"
                            />
                          </motion.div>
                        </FormControl>
                        <FormMessage className="text-red-400" />
                      </FormItem>
                    )}
                  />
                </motion.div>

                {/* Remember Me */}
                <motion.div variants={itemVariants}>
                  <FormField
                    control={form.control}
                    name="remember"
                    render={({ field }) => (
                      <FormItem className="flex items-center space-x-2">
                        <FormControl>
                          <Checkbox
                            checked={field.value}
                            onCheckedChange={field.onChange}
                            className="border-white/20 data-[state=checked]:bg-purple-500 data-[state=checked]:border-purple-500"
                          />
                        </FormControl>
                        <FormLabel className="text-sm text-gray-400 font-normal cursor-pointer">
                          Remember me for 30 days
                        </FormLabel>
                      </FormItem>
                    )}
                  />
                </motion.div>

                {/* Submit Button */}
                <motion.div variants={itemVariants}>
                  <Button
                    type="submit"
                    disabled={isLoading || isSuccess}
                    className="w-full bg-gradient-to-r from-purple-600 to-cyan-600 hover:from-purple-500 hover:to-cyan-500 text-white py-5 rounded-xl font-medium transition-all duration-300 disabled:opacity-70"
                  >
                    <AnimatePresence mode="wait">
                      {isLoading ? (
                        <motion.span
                          key="loading"
                          initial={{ opacity: 0 }}
                          animate={{ opacity: 1 }}
                          exit={{ opacity: 0 }}
                          className="flex items-center"
                        >
                          <Loader2 className="h-4 w-4 mr-2 animate-spin" />
                          Signing in...
                        </motion.span>
                      ) : isSuccess ? (
                        <motion.span
                          key="success"
                          initial={{ opacity: 0, scale: 0.8 }}
                          animate={{ opacity: 1, scale: 1 }}
                          className="flex items-center text-green-400"
                        >
                          <Check className="h-4 w-4 mr-2" />
                          Success!
                        </motion.span>
                      ) : (
                        <motion.span
                          key="default"
                          initial={{ opacity: 0 }}
                          animate={{ opacity: 1 }}
                          exit={{ opacity: 0 }}
                        >
                          Sign in
                        </motion.span>
                      )}
                    </AnimatePresence>
                  </Button>
                </motion.div>
              </form>
            </Form>

            {/* Divider */}
            <motion.div variants={itemVariants} className="relative my-6">
              <div className="absolute inset-0 flex items-center">
                <div className="w-full border-t border-white/10" />
              </div>
              <div className="relative flex justify-center text-xs uppercase">
                <span className="bg-[#111111] px-2 text-gray-500">Or continue with</span>
              </div>
            </motion.div>

            {/* Social Buttons */}
            <motion.div variants={itemVariants} className="grid grid-cols-2 gap-3">
              <Button
                type="button"
                variant="outline"
                className="bg-white/5 border-white/10 text-white hover:bg-white/10 transition-all"
              >
                <svg className="h-4 w-4 mr-2" viewBox="0 0 24 24">
                  <path
                    fill="currentColor"
                    d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92c-.26 1.37-1.04 2.53-2.21 3.31v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.09z"
                  />
                  <path
                    fill="currentColor"
                    d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z"
                  />
                  <path
                    fill="currentColor"
                    d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.07H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.93l2.85-2.22.81-.62z"
                  />
                  <path
                    fill="currentColor"
                    d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.07l3.66 2.84c.87-2.6 3.3-4.53 6.16-4.53z"
                  />
                </svg>
                Google
              </Button>
              <Button
                type="button"
                variant="outline"
                className="bg-white/5 border-white/10 text-white hover:bg-white/10 transition-all"
              >
                <Github className="h-4 w-4 mr-2" />
                GitHub
              </Button>
            </motion.div>

            {/* Sign Up Link */}
            <motion.p variants={itemVariants} className="text-center text-sm text-gray-400 mt-6">
              Don't have an account?{' '}
              <a href="#" className="text-purple-400 hover:text-purple-300 font-medium transition-colors">
                Sign up
              </a>
            </motion.p>
          </motion.div>
        </div>
      </motion.div>
    </div>
  );
}
```

---

### Étape 6: Installer les Dépendances

```bash
# shadcn components
npx shadcn-ui@latest add form input button checkbox

# Dependencies
npm install react-hook-form @hookform/resolvers zod framer-motion lucide-react
```

---

## ✅ Comparaison Avant/Après

| Aspect | Avant | Après |
|--------|-------|-------|
| Composants | HTML natif | shadcn/ui |
| Validation | Aucune | Zod + react-hook-form |
| Animations | Aucune | Framer Motion (stagger, shake) |
| Style | Basique | Glassmorphism, gradients |
| Feedback | Aucun | Loading, success, error states |
| UX | Minimal | Social login, remember me, links |

---

## 📝 Checklist

- ✅ Inputs shadcn avec icônes
- ✅ Validation Zod avec messages
- ✅ Animation shake sur erreur
- ✅ Loading state sur submit
- ✅ Success animation
- ✅ Remember me checkbox
- ✅ Forgot password link
- ✅ Social login (Google, GitHub)
- ✅ Sign up link
- ✅ Glassmorphism card
- ✅ Gradient border
- ✅ Stagger animations
- ✅ Dark theme cohérent
