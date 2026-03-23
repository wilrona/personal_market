# Ralph Pro Plugin

Plugin Claude Code avancé pour le développement itératif avec support multi-PRD.

## Installation

### Option 1: Installation locale (recommandée)

Le plugin est déjà dans `~/.claude/plugins/local/ralph-pro/`.

Pour l'activer, ajoutez-le à votre configuration Claude Code:

```bash
# Redémarrez Claude Code pour détecter le plugin
claude --refresh-plugins
```

### Option 2: Installation manuelle

1. Rendez les scripts exécutables:
```bash
chmod +x ~/.claude/plugins/local/ralph-pro/hooks/stop-hook.sh
chmod +x ~/.claude/plugins/local/ralph-pro/scripts/setup-ralph-prd.sh
```

2. Redémarrez Claude Code

## Commandes disponibles

| Commande | Description |
|----------|-------------|
| `/ralph-init` | Initialise la structure Ralph Pro dans le projet |
| `/ralph-prd <nom>` | Lance Ralph sur un PRD spécifique |
| `/ralph-status` | Affiche l'état actuel de la boucle |
| `/ralph-cancel` | Annule la boucle active |

## Utilisation

### 1. Initialiser un projet

```bash
cd mon-projet
claude

> /ralph-init
```

### 2. Créer un PRD

Créez un fichier dans `concepts/`:

```markdown
# concepts/feature-auth.md

## Objectif
Implémenter l'authentification JWT

## Exigences
- Login avec email/password
- Token refresh automatique
- Logout avec invalidation

## Critères de succès
- Tests passent
- Documentation API
```

### 3. Lancer Ralph

```bash
> /ralph-prd feature-auth
> /ralph-prd feature-auth --max-iterations 50
```

### 4. Suivre la progression

```bash
> /ralph-status
```

### 5. Annuler si nécessaire

```bash
> /ralph-cancel
```

## Structure créée

```
projet/
├── concepts/           # Vos PRD
│   └── feature-auth.md
├── .ralph/
│   └── state.json     # État de la boucle
├── @fix_plan.md       # Tâches en cours
└── PROGRESS.md        # Historique
```

## Circuit Breaker

Le plugin arrête automatiquement si:
- 5 erreurs consécutives
- 3 itérations sans progrès
- Limite d'itérations atteinte

## Agents inclus

- **progress-tracker**: Met à jour @fix_plan.md et PROGRESS.md
- **response-analyzer**: Analyse les réponses pour détecter patterns
- **circuit-breaker**: Détecte les blocages

## Différences avec ralph-wiggum

| Fonctionnalité | ralph-wiggum | ralph-pro |
|----------------|--------------|-----------|
| Multi-PRD | ❌ | ✅ |
| Circuit breaker | ❌ | ✅ |
| Progress tracking | ❌ | ✅ |
| Agents spécialisés | ❌ | ✅ |
| Structure projet | ❌ | ✅ |
