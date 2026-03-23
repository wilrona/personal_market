# Workflow: Créer un Dashboard

Ce document montre le workflow complet pour créer des composants de dashboard en utilisant les MCPs.

---

## 📋 Contexte

**Demande utilisateur**: "Crée les composants pour un dashboard analytics avec stats cards, un graphique, et une table de données récentes."

---

## 🔄 Étapes du Workflow

### Étape 1: Planifier les Composants

**Composants nécessaires**:
1. Stats Cards (4 cards avec métriques)
2. Chart Section (graphique linéaire/bar)
3. Recent Activity Table
4. Layout Dashboard

---

### Étape 2: Stats Cards

**Inspiration**:
```typescript
await mcp__magic__21st_magic_component_inspiration({
  message: "Stats cards pour dashboard analytics",
  searchQuery: "stats card dashboard metric"
});
```

**Documentation shadcn Card**:
```typescript
await mcp__context7__query_docs({
  libraryId: "/shadcn/ui",
  query: "Card component with CardHeader CardTitle CardDescription CardContent"
});
```

**Build**:
```typescript
await mcp__magic__21st_magic_component_builder({
  message: "Stats cards pour dashboard",
  searchQuery: "stats metric cards",
  absolutePathToCurrentFile: "/project/src/components/dashboard/StatsCards.tsx",
  absolutePathToProjectDirectory: "/project",
  standaloneRequestQuery: `
    Create a stats cards grid component with 4 metric cards:

    CARDS:
    1. Total Revenue - $45,231.89 - +20.1% from last month - DollarSign icon
    2. Subscriptions - +2350 - +180.1% from last month - Users icon
    3. Sales - +12,234 - +19% from last month - CreditCard icon
    4. Active Now - +573 - +201 since last hour - Activity icon

    STYLING:
    - Use shadcn Card components
    - Dark theme with subtle borders
    - Trend indicators (green for positive, red for negative)
    - Icons with muted background circles
    - Hover effect with subtle lift and glow

    LAYOUT:
    - 4 columns on desktop
    - 2 columns on tablet
    - 1 column on mobile

    ANIMATIONS:
    - Stagger reveal on mount
    - Counter animation for numbers
    - Subtle hover scale
  `
});
```

**Résultat**:
```tsx
'use client';

import { motion } from 'framer-motion';
import { DollarSign, Users, CreditCard, Activity, TrendingUp, TrendingDown } from 'lucide-react';
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card';

const stats = [
  {
    title: 'Total Revenue',
    value: '$45,231.89',
    change: '+20.1%',
    trend: 'up',
    description: 'from last month',
    icon: DollarSign,
  },
  {
    title: 'Subscriptions',
    value: '+2,350',
    change: '+180.1%',
    trend: 'up',
    description: 'from last month',
    icon: Users,
  },
  {
    title: 'Sales',
    value: '+12,234',
    change: '+19%',
    trend: 'up',
    description: 'from last month',
    icon: CreditCard,
  },
  {
    title: 'Active Now',
    value: '+573',
    change: '+201',
    trend: 'up',
    description: 'since last hour',
    icon: Activity,
  },
];

const containerVariants = {
  hidden: { opacity: 0 },
  visible: {
    opacity: 1,
    transition: { staggerChildren: 0.1 },
  },
};

const itemVariants = {
  hidden: { opacity: 0, y: 20 },
  visible: { opacity: 1, y: 0 },
};

export function StatsCards() {
  return (
    <motion.div
      variants={containerVariants}
      initial="hidden"
      animate="visible"
      className="grid gap-4 md:grid-cols-2 lg:grid-cols-4"
    >
      {stats.map((stat, index) => (
        <motion.div key={stat.title} variants={itemVariants}>
          <Card className="bg-zinc-900/50 border-zinc-800 hover:bg-zinc-900/80 hover:border-zinc-700 transition-all duration-300 hover:-translate-y-1 hover:shadow-xl hover:shadow-purple-500/5">
            <CardHeader className="flex flex-row items-center justify-between pb-2">
              <CardTitle className="text-sm font-medium text-zinc-400">
                {stat.title}
              </CardTitle>
              <div className="p-2 rounded-full bg-zinc-800">
                <stat.icon className="h-4 w-4 text-zinc-400" />
              </div>
            </CardHeader>
            <CardContent>
              <div className="text-2xl font-bold text-white">{stat.value}</div>
              <div className="flex items-center gap-1 mt-1">
                {stat.trend === 'up' ? (
                  <TrendingUp className="h-3 w-3 text-emerald-500" />
                ) : (
                  <TrendingDown className="h-3 w-3 text-red-500" />
                )}
                <span className={`text-xs font-medium ${
                  stat.trend === 'up' ? 'text-emerald-500' : 'text-red-500'
                }`}>
                  {stat.change}
                </span>
                <span className="text-xs text-zinc-500">{stat.description}</span>
              </div>
            </CardContent>
          </Card>
        </motion.div>
      ))}
    </motion.div>
  );
}
```

---

### Étape 3: Data Table

**Recherche shadcn Table**:
```typescript
await mcp__shadcn__search_items_in_registries({
  registries: ["@shadcn"],
  query: "table"
});
```

**Exemples Table**:
```typescript
await mcp__shadcn__get_item_examples_from_registries({
  registries: ["@shadcn"],
  query: "table-demo"
});
```

**Documentation complète**:
```typescript
await mcp__context7__query_docs({
  libraryId: "/shadcn/ui",
  query: "Table component with TableHeader TableBody TableRow TableCell TableHead sorting"
});
```

**Build**:
```typescript
await mcp__magic__21st_magic_component_builder({
  message: "Table des activités récentes pour dashboard",
  searchQuery: "data table dashboard",
  absolutePathToCurrentFile: "/project/src/components/dashboard/RecentActivity.tsx",
  absolutePathToProjectDirectory: "/project",
  standaloneRequestQuery: `
    Create a recent activity table component:

    COLUMNS:
    - User (avatar + name + email)
    - Activity (type with badge)
    - Amount ($)
    - Status (badge: completed, pending, failed)
    - Date (relative: "2 hours ago")

    DATA:
    - Show 5 recent transactions
    - Mix of different statuses

    STYLING:
    - shadcn Table components
    - Dark theme
    - Row hover effect
    - Avatar with fallback initials
    - Color-coded status badges

    EXTRAS:
    - Card wrapper with title "Recent Activity"
    - "View all" link in header
  `
});
```

**Résultat**:
```tsx
'use client';

import { motion } from 'framer-motion';
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card';
import { Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from '@/components/ui/table';
import { Avatar, AvatarFallback, AvatarImage } from '@/components/ui/avatar';
import { Badge } from '@/components/ui/badge';
import { ArrowUpRight } from 'lucide-react';

const activities = [
  {
    id: 1,
    user: { name: 'Olivia Martin', email: 'olivia.martin@email.com', avatar: '/avatars/01.png' },
    activity: 'Subscription',
    amount: '+$1,999.00',
    status: 'completed',
    date: '2 hours ago',
  },
  {
    id: 2,
    user: { name: 'Jackson Lee', email: 'jackson.lee@email.com', avatar: '/avatars/02.png' },
    activity: 'Payment',
    amount: '+$39.00',
    status: 'pending',
    date: '4 hours ago',
  },
  {
    id: 3,
    user: { name: 'Isabella Nguyen', email: 'isabella.nguyen@email.com', avatar: '/avatars/03.png' },
    activity: 'Refund',
    amount: '-$299.00',
    status: 'completed',
    date: '6 hours ago',
  },
  {
    id: 4,
    user: { name: 'William Kim', email: 'will@email.com', avatar: '/avatars/04.png' },
    activity: 'Payment',
    amount: '+$99.00',
    status: 'failed',
    date: '8 hours ago',
  },
  {
    id: 5,
    user: { name: 'Sofia Davis', email: 'sofia.davis@email.com', avatar: '/avatars/05.png' },
    activity: 'Subscription',
    amount: '+$149.00',
    status: 'completed',
    date: '12 hours ago',
  },
];

const statusStyles = {
  completed: 'bg-emerald-500/10 text-emerald-500 border-emerald-500/20',
  pending: 'bg-yellow-500/10 text-yellow-500 border-yellow-500/20',
  failed: 'bg-red-500/10 text-red-500 border-red-500/20',
};

export function RecentActivity() {
  return (
    <motion.div
      initial={{ opacity: 0, y: 20 }}
      animate={{ opacity: 1, y: 0 }}
      transition={{ delay: 0.3 }}
    >
      <Card className="bg-zinc-900/50 border-zinc-800">
        <CardHeader className="flex flex-row items-center justify-between">
          <div>
            <CardTitle className="text-white">Recent Activity</CardTitle>
            <CardDescription className="text-zinc-400">
              Your latest transactions and activities
            </CardDescription>
          </div>
          <a href="#" className="flex items-center text-sm text-purple-400 hover:text-purple-300 transition-colors">
            View all
            <ArrowUpRight className="ml-1 h-4 w-4" />
          </a>
        </CardHeader>
        <CardContent>
          <Table>
            <TableHeader>
              <TableRow className="border-zinc-800 hover:bg-transparent">
                <TableHead className="text-zinc-400">User</TableHead>
                <TableHead className="text-zinc-400">Activity</TableHead>
                <TableHead className="text-zinc-400">Amount</TableHead>
                <TableHead className="text-zinc-400">Status</TableHead>
                <TableHead className="text-zinc-400 text-right">Date</TableHead>
              </TableRow>
            </TableHeader>
            <TableBody>
              {activities.map((activity) => (
                <TableRow
                  key={activity.id}
                  className="border-zinc-800 hover:bg-zinc-800/50 transition-colors"
                >
                  <TableCell>
                    <div className="flex items-center gap-3">
                      <Avatar className="h-8 w-8">
                        <AvatarImage src={activity.user.avatar} alt={activity.user.name} />
                        <AvatarFallback className="bg-zinc-800 text-zinc-400 text-xs">
                          {activity.user.name.split(' ').map(n => n[0]).join('')}
                        </AvatarFallback>
                      </Avatar>
                      <div>
                        <div className="font-medium text-white">{activity.user.name}</div>
                        <div className="text-xs text-zinc-500">{activity.user.email}</div>
                      </div>
                    </div>
                  </TableCell>
                  <TableCell>
                    <Badge variant="outline" className="border-zinc-700 text-zinc-300">
                      {activity.activity}
                    </Badge>
                  </TableCell>
                  <TableCell className={`font-medium ${
                    activity.amount.startsWith('+') ? 'text-emerald-500' : 'text-red-500'
                  }`}>
                    {activity.amount}
                  </TableCell>
                  <TableCell>
                    <Badge className={statusStyles[activity.status as keyof typeof statusStyles]}>
                      {activity.status}
                    </Badge>
                  </TableCell>
                  <TableCell className="text-right text-zinc-400">
                    {activity.date}
                  </TableCell>
                </TableRow>
              ))}
            </TableBody>
          </Table>
        </CardContent>
      </Card>
    </motion.div>
  );
}
```

---

### Étape 4: Dashboard Layout

**Assembler les composants**:

```tsx
// src/app/dashboard/page.tsx
import { StatsCards } from '@/components/dashboard/StatsCards';
import { RecentActivity } from '@/components/dashboard/RecentActivity';
import { ChartSection } from '@/components/dashboard/ChartSection';

export default function DashboardPage() {
  return (
    <div className="min-h-screen bg-[#0a0a0a] text-white p-6 lg:p-8">
      <div className="max-w-7xl mx-auto space-y-6">
        {/* Header */}
        <div>
          <h1 className="text-3xl font-bold">Dashboard</h1>
          <p className="text-zinc-400">Welcome back! Here's your overview.</p>
        </div>

        {/* Stats */}
        <StatsCards />

        {/* Main Content */}
        <div className="grid gap-6 lg:grid-cols-7">
          {/* Chart - takes 4 columns */}
          <div className="lg:col-span-4">
            <ChartSection />
          </div>

          {/* Recent Activity - takes 3 columns */}
          <div className="lg:col-span-3">
            <RecentActivity />
          </div>
        </div>
      </div>
    </div>
  );
}
```

---

### Étape 5: Dépendances

```bash
# shadcn components
npx shadcn-ui@latest add card table avatar badge

# Animation
npm install framer-motion

# Charts (optionnel)
npm install recharts
```

---

## ✅ Composants Créés

| Composant | Description | MCPs Utilisés |
|-----------|-------------|---------------|
| StatsCards | 4 cards de métriques | magic inspiration, magic builder, context7 |
| RecentActivity | Table avec transactions | shadcn search, shadcn examples, magic builder |
| ChartSection | Graphique linéaire | magic inspiration, magic builder |
| Dashboard Layout | Page assemblée | N/A (composition) |

---

## 📝 Best Practices Appliquées

- ✅ shadcn components pour cohérence
- ✅ Dark theme premium
- ✅ Animations stagger
- ✅ Hover effects subtils
- ✅ Status badges colorés
- ✅ Responsive grid
- ✅ Trend indicators
- ✅ Avatar avec fallback
