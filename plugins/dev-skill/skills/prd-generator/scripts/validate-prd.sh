#!/bin/bash

# PRD Validation Script
# Usage: bash validate-prd.sh path/to/prd.md

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if file path is provided
if [ $# -eq 0 ]; then
    echo -e "${RED}❌ Error: No file path provided${NC}"
    echo "Usage: bash validate-prd.sh path/to/prd.md"
    exit 1
fi

PRD_FILE="$1"

# Check if file exists
if [ ! -f "$PRD_FILE" ]; then
    echo -e "${RED}❌ Error: File not found: $PRD_FILE${NC}"
    exit 1
fi

echo "🔍 Validating PRD: $PRD_FILE"
echo "================================"

# Extract PRD type from file
PRD_TYPE=""
if grep -q "Type.*:.*PRD Technique" "$PRD_FILE"; then
    PRD_TYPE="technique"
elif grep -q "Type.*:.*PRD Produit" "$PRD_FILE"; then
    PRD_TYPE="produit"
elif grep -q "Type.*:.*PRD Stratégique" "$PRD_FILE"; then
    PRD_TYPE="strategique"
else
    echo -e "${YELLOW}⚠️  Warning: Could not determine PRD type${NC}"
fi

echo "📋 PRD Type: ${PRD_TYPE:-Unknown}"
echo ""

# Initialize counters
TOTAL_CHECKS=0
PASSED_CHECKS=0
WARNINGS=0

# Function to check for section
check_section() {
    local section_name="$1"
    local search_pattern="$2"
    local is_critical="${3:-true}"

    TOTAL_CHECKS=$((TOTAL_CHECKS + 1))

    if grep -qi "$search_pattern" "$PRD_FILE"; then
        echo -e "${GREEN}✓${NC} $section_name"
        PASSED_CHECKS=$((PASSED_CHECKS + 1))
        return 0
    else
        if [ "$is_critical" = "true" ]; then
            echo -e "${RED}✗${NC} $section_name ${RED}(MISSING - Required)${NC}"
        else
            echo -e "${YELLOW}⚠${NC} $section_name ${YELLOW}(Missing - Recommended)${NC}"
            WARNINGS=$((WARNINGS + 1))
            PASSED_CHECKS=$((PASSED_CHECKS + 1))  # Don't count as failure
        fi
        return 1
    fi
}

# Check common sections (all PRD types)
echo "📌 Common Sections (All PRD Types)"
echo "-----------------------------------"
check_section "Métadonnées" "## 📋 Métadonnées"
check_section "Type de PRD" "Type.*:.*PRD"
check_section "Date de création" "Date de création"
check_section "Auteur" "Auteur"
check_section "Version" "Version"
check_section "Statut" "Statut"
check_section "Résumé Exécutif" "## 🎯 Résumé Exécutif"
check_section "Contexte" "## 📌 Contexte"
check_section "Objectifs" "## 🎯 Objectifs"
check_section "Métriques de Succès" "## 📈 Métriques"
check_section "Risques & Contraintes" "## ⚠️ Risques"
check_section "Planning" "## 📅 Planning"
check_section "Checklist de Validation" "## ✅ Checklist"
echo ""

# Check type-specific sections
if [ "$PRD_TYPE" = "technique" ]; then
    echo "🔧 Technical-Specific Sections"
    echo "-------------------------------"
    check_section "Architecture Technique" "## 🏗️ Architecture"
    check_section "Spécifications API" "## 🔌 Spécifications API" false
    check_section "Schéma de Base de Données" "## 🗄️ Schéma de Base" false
    check_section "Sécurité" "## 🔒 Sécurité"
    check_section "Performance" "## ⚡ Performance" false
    check_section "Tests" "## 🧪 Tests"
    check_section "Déploiement" "## 🚀 Déploiement"
    check_section "Dépendances" "## 📦 Dépendances" false
    echo ""

elif [ "$PRD_TYPE" = "produit" ]; then
    echo "🎨 Product-Specific Sections"
    echo "-----------------------------"
    check_section "Utilisateurs Cibles" "## 👥 Utilisateurs Cibles"
    check_section "User Stories" "## 📖 User Stories"
    check_section "Expérience Utilisateur" "## 🎨 Expérience Utilisateur"
    check_section "Spécifications Fonctionnelles" "## ✨ Spécifications Fonctionnelles"
    check_section "Accessibilité" "## ♿ Accessibilité"
    check_section "Internationalisation" "## 🌍 Internationalisation" false
    check_section "Plan de Lancement" "## 🚀 Plan de Lancement"
    check_section "Documentation" "## 📚 Documentation"
    echo ""

elif [ "$PRD_TYPE" = "strategique" ]; then
    echo "🌟 Strategic-Specific Sections"
    echo "-------------------------------"
    check_section "Vision & Mission" "## 🌟 Vision"
    check_section "Business Case" "## 💼 Business Case"
    check_section "Analyse du Marché" "Analyse.*Marché\|Marché.*Cible"
    check_section "OKRs" "## 🎯 Objectifs.*OKRs\|Key Results"
    check_section "Roadmap Stratégique" "## 🗺️ Roadmap"
    check_section "Budget & Ressources" "## 💰 Budget"
    check_section "North Star Metric" "North Star"
    check_section "Avantages Concurrentiels" "## 🏆 Avantages Concurrentiels"
    check_section "Go-to-Market Strategy" "Go-to-Market\|GTM"
    check_section "Organisation & Gouvernance" "Gouvernance\|Leadership Team" false
    check_section "Success Criteria" "Success Criteria\|Critères de Succès" false
    echo ""
fi

# Check for common issues
echo "🔍 Additional Quality Checks"
echo "----------------------------"

# Check for [TBD] or [TODO] placeholders
if grep -q "\[TBD\]\|\[TODO\]" "$PRD_FILE"; then
    echo -e "${YELLOW}⚠${NC} Contains [TBD] or [TODO] placeholders"
    WARNINGS=$((WARNINGS + 1))
else
    echo -e "${GREEN}✓${NC} No [TBD] or [TODO] placeholders"
    PASSED_CHECKS=$((PASSED_CHECKS + 1))
fi
TOTAL_CHECKS=$((TOTAL_CHECKS + 1))

# Check for empty checkboxes (tracking items)
CHECKBOX_COUNT=$(grep -c "\[ \]" "$PRD_FILE" || true)
if [ $CHECKBOX_COUNT -gt 0 ]; then
    echo -e "${GREEN}✓${NC} Contains $CHECKBOX_COUNT tracking checkboxes"
    PASSED_CHECKS=$((PASSED_CHECKS + 1))
else
    echo -e "${YELLOW}⚠${NC} No tracking checkboxes found (recommended for objectives/tasks)"
    WARNINGS=$((WARNINGS + 1))
fi
TOTAL_CHECKS=$((TOTAL_CHECKS + 1))

# Check for tables (metrics, risks, etc.)
TABLE_COUNT=$(grep -c "^|" "$PRD_FILE" | head -1 || echo "0")
if [ "$TABLE_COUNT" -gt 5 ]; then
    echo -e "${GREEN}✓${NC} Contains tables for structured data"
    PASSED_CHECKS=$((PASSED_CHECKS + 1))
else
    echo -e "${YELLOW}⚠${NC} Few or no tables found (recommended for metrics/risks)"
    WARNINGS=$((WARNINGS + 1))
fi
TOTAL_CHECKS=$((TOTAL_CHECKS + 1))

# Check file size (PRDs should be substantial)
FILE_SIZE=$(wc -l < "$PRD_FILE")
if [ "$FILE_SIZE" -lt 100 ]; then
    echo -e "${YELLOW}⚠${NC} PRD is quite short ($FILE_SIZE lines) - may be incomplete"
    WARNINGS=$((WARNINGS + 1))
elif [ "$FILE_SIZE" -lt 300 ]; then
    echo -e "${GREEN}✓${NC} PRD has reasonable length ($FILE_SIZE lines)"
    PASSED_CHECKS=$((PASSED_CHECKS + 1))
else
    echo -e "${GREEN}✓${NC} PRD is comprehensive ($FILE_SIZE lines)"
    PASSED_CHECKS=$((PASSED_CHECKS + 1))
fi
TOTAL_CHECKS=$((TOTAL_CHECKS + 1))

# Summary
echo ""
echo "================================"
echo "📊 Validation Summary"
echo "================================"
echo "Total checks: $TOTAL_CHECKS"
echo -e "Passed: ${GREEN}$PASSED_CHECKS${NC}"
echo -e "Warnings: ${YELLOW}$WARNINGS${NC}"

# Calculate pass percentage
PASS_PERCENT=$((PASSED_CHECKS * 100 / TOTAL_CHECKS))

# Determine overall status
if [ $PASS_PERCENT -eq 100 ] && [ $WARNINGS -eq 0 ]; then
    echo ""
    echo -e "${GREEN}✅ Validation PASSED${NC}"
    echo "PRD is complete and ready for review!"
    exit 0
elif [ $PASS_PERCENT -ge 80 ]; then
    echo ""
    echo -e "${YELLOW}⚠️  Validation PASSED with warnings${NC}"
    echo "PRD is mostly complete but has some issues to address."
    exit 0
else
    echo ""
    echo -e "${RED}❌ Validation FAILED${NC}"
    echo "PRD is missing critical sections. Please complete before review."
    exit 1
fi
