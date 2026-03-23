# Changelog - dev-skill

## v2.0.0 (2026-02-12)

### 🎯 Nouveautés Majeures

**Frontend Design Pro** supporte maintenant **deux modes** :

#### Mode 1: shadcn + Magic (Par défaut)
- ✅ Utilise MCP magic (21st.dev) pour l'inspiration UI
- ✅ Utilise MCP Context7 pour la documentation shadcn à jour
- ✅ Utilise MCP shadcn registry pour les composants

**Commande :**
```bash
/frontend-design-pro Crée une page de pricing
```

#### Mode 2: Gemini Design (Nouveau !)
- ✅ Utilise MCP Gemini Design pour la génération de code UI premium
- ✅ Workflow avec design system (design-system.md)
- ✅ Génération de 5 vibes au premier lancement
- ✅ Support complet de `create_frontend`, `modify_frontend`, `snippet_frontend`

**Commande :**
```bash
/frontend-design-pro -G Crée une page de pricing
```

### Paramètres Disponibles

- `-G` ou `--gemini` : Active le mode Gemini Design
- `-S` ou `--shadcn` : Force le mode shadcn+Magic (par défaut)

### Migration depuis CLAUDE.md

Les instructions MCP Gemini Design ont été **migrées de CLAUDE.md vers le skill**.

**CLAUDE.md simplifié** :
- Garde uniquement les règles générales
- Réfère au skill frontend-design-pro pour le frontend
- Plus de duplication d'instructions

### Workflow Gemini Design

#### Nouveau Projet (sans design-system.md)
```
1. Demande l'échelle (refined/balanced/zoomed)
2. Génère 5 vibes distincts
3. L'utilisateur choisit son vibe préféré
4. Sauvegarde dans design-system.md
5. Utilise ce design system pour tous les composants suivants
```

#### Projet Existant (avec design-system.md)
```
1. Lit design-system.md
2. Génère le code avec le design system
3. Garantit la cohérence visuelle
```

### Avantages de cette Architecture

✅ **Flexibilité** : Choix entre shadcn et Gemini selon le projet
✅ **Cohérence** : Un seul skill pour tout le frontend
✅ **Pas de conflit** : Plus de duplication entre CLAUDE.md et les skills
✅ **Simplicité** : Un paramètre pour changer de mode

### Breaking Changes

⚠️ **CLAUDE.md a été nettoyé** : Les instructions MCP Gemini Design ont été supprimées et intégrées dans le skill.

Si vous aviez des références directes à ces instructions, utilisez maintenant :
```bash
/frontend-design-pro -G [votre demande]
```

---

## v1.0.0 (2026-01-XX)

### Initial Release

- Apex workflow (8 étapes progressives)
- Frontend Design Pro (shadcn + 21st.dev)
- PRD Generator (documentation en français)
