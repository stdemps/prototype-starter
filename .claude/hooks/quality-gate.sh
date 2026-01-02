#!/bin/bash

###
# Pre-commit Quality Gate Hook (Lenient Mode)
#
# This hook runs quality checks but NEVER blocks commits.
# Perfect for rapid prototyping - you see issues but can keep moving.
#
# To disable this hook entirely:
# - Remove .claude/hooks/quality-gate.sh
# - Or set: SKIP_QUALITY_GATE=1 git commit -m "message"
###

# Allow users to completely skip if needed
if [ "$SKIP_QUALITY_GATE" = "1" ]; then
  exit 0
fi

echo "Running quality checks (lenient mode - won't block commit)..."

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# 1. Run ESLint
echo -e "\n${YELLOW}[1/2] Running ESLint...${NC}"
if npm run lint --silent 2>/dev/null; then
  echo -e "${GREEN}✓ ESLint passed${NC}"
else
  echo -e "${YELLOW}⚠ ESLint found issues (not blocking)${NC}"
fi

# 2. Run TypeScript type checking
echo -e "\n${YELLOW}[2/2] Running TypeScript type check...${NC}"
if npx tsc --noEmit 2>/dev/null; then
  echo -e "${GREEN}✓ Type check passed${NC}"
else
  echo -e "${YELLOW}⚠ Type check found issues (not blocking)${NC}"
fi

# Summary
echo -e "\n${BLUE}========================================${NC}"
echo -e "${BLUE}✓ Quality checks complete (lenient mode)${NC}"
echo -e "${GREEN}Commit allowed${NC}"
echo -e "\n${YELLOW}Tip: Set SKIP_QUALITY_GATE=1 to skip checks entirely${NC}"
exit 0
