# Essential Workflows Plugin

Skills essentiels extraits de `fullstack-dev-skills` (version allégée).

## 🎯 Objectif

Ce plugin contient uniquement les **14 skills les plus utiles** de fullstack-dev-skills, au lieu des 70+ skills originaux.

**Avantages** :
- ✅ Réduction de 80% du nombre de skills (14 au lieu de 70+)
- ✅ Focus sur requirements, critical thinking, MCP development, architecture, et frameworks spécifiques
- ✅ Pas de redondance avec les capacités natives de Claude
- ✅ Performance améliorée
- ✅ Moins de confusion

---

## 📦 Skills Inclus

### 1. Requirements & Specifications

- `feature-forge` - Workshop interactif de requirements gathering avec format EARS

### 2. Critical Thinking & Validation

- `the-fool` - Challenge les décisions avec esprit critique
- `common-ground:COMMAND` - Valide les assumptions de Claude avec l'utilisateur

### 3. Claude Code Development ⭐

- `mcp-developer` - Créer des MCP servers/clients (Protocol, SDKs TypeScript/Python)
- `prompt-engineer` - Optimiser les prompts LLM (patterns, evaluation, structured outputs)

### 4. Architecture & Design Patterns ⭐

- `graphql-architect` - GraphQL + Apollo Federation (schema design, subscriptions, N+1 optimization)
- `microservices-architect` - Microservices patterns (service mesh, saga, circuit breakers, event-driven)

### 5. Frameworks Spécifiques (7 skills)

- `flutter-expert` - Flutter 3 + Dart (Riverpod, Bloc, GoRouter)
- `kotlin-specialist` - Kotlin + Coroutines + Multiplatform
- `react-native-expert` - React Native + Expo
- `swift-expert` - iOS/macOS + SwiftUI
- `dotnet-core-expert` - .NET 8 + Minimal APIs
- `csharp-developer` - C# + ASP.NET Core
- `rag-architect` - RAG systems + Vector databases

---

## 🔄 Workflow Typique

### Feature Definition & Validation
```
1. feature-forge → Définit la feature avec requirements
2. common-ground → Valide les assumptions
3. the-fool → Challenge le design (optionnel)
```

**Note** : Pour l'implémentation complète, utilisez **dev-skill:apex** qui offre un workflow en 8 étapes.

---

## 📊 Comparaison avec fullstack-dev-skills

| Aspect | fullstack-dev-skills | essential-workflows |
|--------|---------------------|---------------------|
| **Nombre de skills** | 70+ | 14 |
| **Focus** | Langages + Frameworks + Workflows Jira | Requirements + MCP + Architecture + Frameworks |
| **Redondance** | ❌ Haute (avec capacités natives) | ✅ Minimale |
| **Utilité** | ⚠️ ~20% vraiment utile | ✅ 100% utile |
| **Performance** | ⚠️ Surcharge | ✅ Ultra-léger |
| **Réduction** | - | **80% de skills en moins** |

---

## ⚠️ Ce qui a été RETIRÉ

Les skills suivants ont été **retirés** car redondants avec les capacités natives de Claude :

**Langages** (15 skills) :
- typescript-pro, javascript-pro, python-pro, golang-pro, rust-engineer, java-architect, php-pro, csharp-developer, kotlin-specialist, swift-expert, cpp-pro

**Frameworks** (15 skills) :
- nextjs-developer, react-expert, vue-expert, angular-architect, nestjs-expert, django-expert, rails-expert, laravel-specialist, spring-boot-engineer, fastapi-expert, wordpress-pro, shopify-expert, react-native-expert, flutter-expert, salesforce-developer

**Infrastructure** (10 skills) :
- devops-engineer, kubernetes-specialist, terraform-engineer, cloud-architect, monitoring-expert, sre-engineer

**Database** (3 skills) :
- database-optimizer, postgres-pro, sql-pro

**Architecture/Design** (10 skills) :
- api-designer, graphql-architect, architecture-designer, microservices-architect, fullstack-guardian

**Autres** (15 skills) :
- code-reviewer, test-master, debugging-wizard, security-reviewer, secure-code-guardian, code-documenter, spec-miner, legacy-modernizer, chaos-engineer, cli-developer, websocket-engineer, prompt-engineer, fine-tuning-expert, ml-pipeline, rag-architect, spark-engineer, pandas-pro, game-developer, embedded-systems, atlassian-mcp

**Total retiré** : ~65 skills

---

## 💡 Pourquoi Retirer Ces Skills ?

Ces skills ne font que "donner un rôle" à Claude sans ajouter de capacités techniques. Par exemple :

- `typescript-pro` → Claude connaît déjà TypeScript
- `react-expert` → Claude connaît déjà React
- `database-optimizer` → Claude peut déjà optimiser des DBs

**Résultat** : Surcharge inutile et confusion.

---

## 🚀 Installation

Le plugin est déjà dans votre marketplace my-plugins. Pour l'activer :

```bash
# Le plugin devrait être automatiquement détecté
# Redémarrez Claude Code si nécessaire
```

---

## 📝 Notes

**Source originale** : [fullstack-dev-skills](https://github.com/jeffallan/claude-skills) v0.4.7

**Licence** : MIT (préservée depuis l'original)

**Auteur original** : Jesse Vincent (@obra) et Jeff Allan

**Adaptation** : wilrona (extraction des skills essentiels)

---

## 🔗 Plugins Complémentaires

Pour une configuration complète, combinez avec :

- **dev-skill:apex** - Workflow progressif en 8 étapes
- **dev-skill:frontend-design-pro** - UI avec shadcn+Magic ou Gemini Design
- **dev-skill:prd-generator** - Génération de PRD complets
- **ralph-pro** - Boucle d'exécution itérative basée sur PRD
- **pr-review-toolkit** - Review de code avec agents spécialisés

---

**Version** : 1.4.0
**Dernière mise à jour** : 2026-02-12
