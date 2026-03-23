---
name: apex
description: Lance le workflow Apex complet pour implémenter une feature avec qualité maximale. Workflow progressif - Issue → Analyse → Worktree → Plan → Execute → Validate → Examine → Resolve → Test → PR. Supporte les paramètres -A (auto), -I (issue), -W (worktree), -X (examine), -T (test), -P (pr).
---

# 🎯 APEX Workflow - Implementation de Feature avec Qualité Maximale

## Vue d'ensemble

Apex est un workflow en étapes progressives qui garantit une implémentation de qualité en chargeant les instructions au fur et à mesure, évitant ainsi la dilution du contexte.

## Paramètres disponibles

Tu peux activer les paramètres suivants dans la commande :

- `-I` ou `--issue` : Créer une issue GitHub, ou `-I <numéro>` pour reprendre une issue existante
- `-W` ou `--worktree` : Créer un git worktree isolé pour travailler
- `-A` ou `--auto` : Mode automatique (skip les validations utilisateur)
- `-X` ou `--examine` : Activer l'examination/review du code
- `-T` ou `--test` : Lancer les tests automatiquement
- `-P` ou `--pr` : Créer la pull request à la fin
- `-E` ou `--economy` : Mode économie (moins d'agents, moins de tokens)

**Exemples** :
- `/apex -AX Ajoute un système de likes sur les posts`
- `/apex -WIA Ajoute un système de likes sur les posts`
- `/apex -I Corrige le bug d'affichage du header`
- `/apex -I 42` (reprend l'issue #42)
- `/apex -IA 42` (reprend l'issue #42 + workflow auto)

## Principe fondamental

⚠️ **CRITIQUE** : Chaque étape charge son propre fichier de prompt pour rester en fin de contexte.
Cela garantit que les instructions actuelles ont le maximum d'impact sur l'IA.

---

## 🚀 Workflow Apex

```
┌──────────┐
│   INIT   │ Parse -A,-I,-W,-X,-T,-P,-E
│          │ Si W && A → forcer pr_mode=true
└────┬─────┘
     │
     ├─ si -I ──▶ ISSUE ──▶ ANALYSE (+ maj issue)
     │                         │
     │              ├─ si -W ──▶ WORKTREE ──┐
     │              │                       │
     │              ├─ si -A (sans -W) ─────┤──▶ PLAN → EXECUTE → VALIDATE → [EXAMINE] → [TEST] → PR
     │              │                       │
     │              └─ sinon ──▶ STOP       │
     │                                      │
     │                    ├─ si -A ─────────┘
     │                    └─ sinon ──▶ STOP
     │
     ├─ si -W (sans -I) ──▶ WORKTREE
     │                         │
     │              ├─ si -A ──▶ ANALYSE → PLAN → ... → PR
     │              └─ sinon ──▶ STOP
     │
     └─ sinon ──▶ ANALYSE → PLAN → ... (workflow classique)
```

**Règle clé PR** : Seul `-W` combiné avec `-A` force la PR automatique. `-I` + `-A` (sans `-W`) ne force PAS la PR.

| Commande | Flux | PR auto ? |
|---|---|---|
| `/apex -I Desc` | Issue → Analyse → STOP | Non |
| `/apex -W Desc` | Worktree → STOP | Non |
| `/apex -WI Desc` | Issue → Analyse → Worktree → STOP | Non |
| `/apex -IA Desc` | Issue → Analyse → Plan → Execute → Validate → STOP | Non |
| `/apex -WA Desc` | Worktree → Analyse → Plan → Execute → Validate → PR | **Oui** |
| `/apex -WIA Desc` | Issue → Analyse → Worktree → Plan → Execute → Validate → PR | **Oui** |
| `/apex -A Desc` | Analyse → Plan → Execute → Validate → STOP | Non |
| `/apex -AP Desc` | Analyse → Plan → Execute → Validate → PR | Oui (via -P) |

---

## 📋 Étape 0 : Initialisation

**Tu es maintenant dans le workflow APEX.**

### Actions immédiates

1. **Parse les paramètres** de la commande utilisateur :
   - Détecte `-I` ou `--issue` → `issue_mode = true`
     - Si un **numéro** suit immédiatement `-I` (ex: `-I 42`, `-I42`, `--issue 42`) → `issue_number = <numéro>` (mode reprise d'issue existante)
     - Sinon → `issue_number = null` (mode création d'issue)
   - Détecte `-W` ou `--worktree` → `worktree_mode = true`
   - Détecte `-A` ou `--auto` → `auto_mode = true`
   - Détecte `-X` ou `--examine` → `examine_mode = true`
   - Détecte `-T` ou `--test` → `test_mode = true`
   - Détecte `-P` ou `--pr` → `pr_mode = true`
   - Détecte `-E` ou `--economy` → `economy_mode = true`

2. **Règle PR implicite** : Si `worktree_mode` ET `auto_mode` → forcer `pr_mode = true`

3. **Extrait la demande utilisateur** (tout ce qui suit les paramètres)

4. **Affiche un résumé** :
```
🎯 APEX Workflow Initialized

Feature Request: [demande utilisateur]

Modes activés:
- Issue: [true/false]
- Worktree: [true/false]
- Auto: [true/false]
- Examine: [true/false]
- Test: [true/false]
- PR: [true/false]
- Economy: [true/false]

Starting Step: [ISSUE / WORKTREE / ANALYSE]
```

---

## 📍 Prochaine étape

Maintenant que l'initialisation est terminée, **tu DOIS charger le fichier de la prochaine étape** selon les flags :

- **Si `issue_mode`** → 👉 Lis `${CLAUDE_PLUGIN_ROOT}/steps/issue.md`
- **Sinon si `worktree_mode`** → 👉 Lis `${CLAUDE_PLUGIN_ROOT}/steps/worktree.md`
- **Sinon** → 👉 Lis `${CLAUDE_PLUGIN_ROOT}/steps/analyse.md`

Une fois lu, suis les instructions de ce fichier.
