# ⚙️ APEX - Étape 3 : EXECUTE

## Objectif

Implémenter la feature en suivant exactement le plan créé à l'étape précédente.

---

## Instructions

### 1. Préparation

Récupère le plan créé à l'étape PLAN et suis-le **étape par étape**.

### 2. Règles d'implémentation

⚠️ **RÈGLES CRITIQUES** :

#### A. Qualité du code
- Respecte les patterns existants identifiés lors de l'ANALYSE
- Écris du code propre, lisible et maintenable
- N'over-engineer pas : reste simple et focalisé
- Ajoute des commentaires uniquement si la logique n'est pas évidente

#### B. Sécurité
- ❌ **INTERDIT** : Command injection, XSS, SQL injection
- ✅ Valide les inputs utilisateur
- ✅ Échappe les données avant affichage
- ✅ Utilise des requêtes préparées pour la DB

#### C. Frontend (si applicable)
- 🛑 **BLOQUANT** : Utilise le skill `frontend-design-pro` pour tout code frontend/UI
- **⛔ CHOIX OBLIGATOIRE** : AVANT de commencer le frontend, tu DOIS demander à l'utilisateur quel mode utiliser via `AskUserQuestion` :
  - **shadcn+Magic** : Utilise 21st.dev + shadcn components
  - **Gemini Design** : Design premium généré par IA
- **Tu NE PEUX PAS continuer** tant que l'utilisateur n'a pas choisi
- Lance le skill avec : `/frontend-design-pro` (shadcn) ou `/frontend-design-pro -G` (Gemini)
- Tu ne dois JAMAIS écrire de composants visuels toi-même
- Exception : logic pure (useState, handlers) sans UI

#### D. Gestion des erreurs
- Ajoute la gestion d'erreurs aux boundaries (user input, API externes)
- Ne gère PAS les erreurs qui ne peuvent pas arriver
- Trust le code interne et les garanties du framework

#### E. Abstractions
- ❌ N'ajoute PAS d'abstractions prématurées
- ❌ Ne crée PAS d'helpers/utils pour une seule utilisation
- ✅ Trois lignes similaires > une abstraction prématurée

### 3. Workflow Frontend (si applicable)

Si la feature implique la création ou modification d'interfaces utilisateur :

#### Détection Frontend
La feature implique du frontend si elle contient :
- Création de pages (dashboard, landing, settings, etc.)
- Création de composants visuels (card, modal, sidebar, form, button, etc.)
- Modification de design/styling d'éléments existants
- Ajout d'interfaces utilisateur

#### Processus (BLOQUANT - choix obligatoire)

⚠️ **CRITIQUE** : Si la feature implique du frontend, tu DOIS arrêter et demander le choix à l'utilisateur AVANT de continuer.

1. **Détecte** si la feature implique du frontend
2. **⛔ STOP - Choix obligatoire** : Utilise `AskUserQuestion` pour forcer le choix :

```
Question: "Cette feature implique du frontend. Quel mode souhaitez-vous utiliser ?"
Options:
  - shadcn+Magic (21st.dev + shadcn components)
  - Gemini Design (design premium généré par IA)
```

3. **⏸️ ATTEND la réponse** : Ne continue PAS tant que l'utilisateur n'a pas choisi
4. **Lance le skill** correspondant selon le choix :
   - shadcn+Magic : `/frontend-design-pro [description]`
   - Gemini Design : `/frontend-design-pro -G [description]`
5. Le skill frontend-design-pro se charge de toute la partie UI
6. **Toi** : Tu gères uniquement la logique métier (useState, handlers, data fetching, etc.)

#### Important
- 🛑 **BLOQUANT** : Tu NE PEUX PAS avancer sans le choix de l'utilisateur
- ❌ N'écris JAMAIS de JSX/TSX pour des composants visuels sans avoir utilisé frontend-design-pro
- ❌ Ne devine PAS le mode (Gemini ou shadcn) - demande TOUJOURS
- ✅ Utilise `AskUserQuestion` pour forcer le choix
- ✅ Laisse frontend-design-pro gérer tout le visuel
- ✅ Focus sur la logique et l'intégration

---

### 4. Exécution pas à pas

Pour chaque étape du plan :

1. **Annonce l'étape** : "📝 Étape X/Y : [Titre]"
2. **Implémente** en utilisant les tools appropriés (Write, Edit)
3. **Vérifie** que le code compile (pas d'erreurs TypeScript)
4. **Passe à l'étape suivante**

### 5. Gestion des blocages

Si tu rencontres un problème :
- ❌ Ne brute-force PAS (retry en boucle)
- ✅ Analyse le problème
- ✅ Cherche une approche alternative
- ✅ Si vraiment bloqué : demande à l'utilisateur

---

## 📍 Prochaine étape

Une fois TOUTES les étapes du plan implémentées :

{{#if auto_mode}}
✅ **Mode auto activé** : Passe automatiquement à la validation.

Affiche : "✅ Implémentation terminée. Passage à la validation..."
{{else}}
❓ **Informe l'utilisateur** : "Implémentation terminée. Je passe maintenant à la validation des critères d'acceptation."
{{/if}}

👉 **Charge maintenant** : `${CLAUDE_PLUGIN_ROOT}/steps/validate.md`
