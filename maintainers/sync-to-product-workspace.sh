#!/bin/bash

# Sync Script: Copy agents, skills, commands, and rules from prototype-starter to product-workspace
#
# This script syncs agent files, Cursor rules, commands, skills (and their data),
# checklists, and configuration updates from prototype-starter to product-workspace.
# Product-workspace may have additional files which will be preserved.
#
# Usage: ./sync-to-product-workspace.sh [product-workspace-path]

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_DIR="$(dirname "$SCRIPT_DIR")"
cd "$SOURCE_DIR"

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo "🔄 Sync Script: prototype-starter → product-workspace"
echo "=================================================="
echo ""

# Determine product-workspace path
if [ -n "$1" ]; then
  TARGET_DIR="$1"
elif [ -d "../product-workspace" ]; then
  TARGET_DIR="../product-workspace"
else
  echo "❌ product-workspace directory not found."
  echo ""
  echo "Usage: $0 [product-workspace-path]"
  echo ""
  echo "Or place product-workspace in a sibling directory:"
  echo "  ../product-workspace/"
  exit 1
fi

# Resolve absolute path
TARGET_DIR="$(cd "$TARGET_DIR" && pwd)"

if [ ! -d "$TARGET_DIR" ]; then
  echo "❌ Directory does not exist: $TARGET_DIR"
  exit 1
fi

if [ ! -d "$TARGET_DIR/.git" ]; then
  echo "⚠️  Warning: $TARGET_DIR doesn't appear to be a git repository"
  read -p "Continue anyway? (y/n) " -n 1 -r
  echo
  if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    exit 1
  fi
fi

echo "📦 Source:      $SOURCE_DIR"
echo "🎯 Target:      $TARGET_DIR"
echo ""

# Files to sync
declare -a AGENT_FILES=(
  ".claude/agents/executive.md"
  ".claude/agents/user-researcher.md"
  ".claude/agents/pm.md"
)

declare -a CURSOR_RULES=(
  ".cursor/rules/agents/pm.mdc"
  ".cursor/rules/agents/pm-generate-prd.mdc"
  ".cursor/rules/agents/pm-clarify-prd.mdc"
  ".cursor/rules/agents/designer-prd-to-ux.mdc"
  ".cursor/rules/agents/ux-to-implementation-plan.mdc"
  ".cursor/rules/agents/executive.mdc"
  ".cursor/rules/agents/user-researcher.mdc"
  ".cursor/rules/ui-design-guidelines.mdc"
  ".cursor/rules/coding-standards.mdc"
  ".cursor/rules/project-context.mdc"
)

declare -a CONFIG_FILES=(
  "docs/framer-mcp-setup.md"
  ".cursor/checklists/responsive-design-checklist.md"
  ".claude/SKILLS.md"
  ".cursor/SKILLS.md"
  ".vscode/extensions.json"
  ".vscode/settings.json"
)

# Directories to sync recursively (all files under these paths)
declare -a SYNC_DIRS=(
  ".claude/commands"
  ".cursor/commands"
  ".claude/skills"
  ".cursor/skills"
)

# Track what was synced
SYNCED_FILES=()
NEW_FILES=()
UPDATED_FILES=()

# Function to copy file and track status
copy_file() {
  local src="$1"
  local dest="$2"
  local rel_path="${src#.claude/}"
  rel_path="${rel_path#.cursor/}"
  
  if [ ! -f "$SOURCE_DIR/$src" ]; then
    echo "  ⚠️  Skip (not in source): $src"
    return 0
  fi
  
  # Create target directory if needed
  mkdir -p "$(dirname "$TARGET_DIR/$src")"
  
  if [ -f "$TARGET_DIR/$src" ]; then
    # File exists, check if different
    if ! cmp -s "$SOURCE_DIR/$src" "$TARGET_DIR/$src"; then
      cp "$SOURCE_DIR/$src" "$TARGET_DIR/$src"
      UPDATED_FILES+=("$src")
      echo "  ✅ Updated:   $src"
    else
      echo "  ⏭️  Unchanged: $src"
    fi
  else
    # New file
    cp "$SOURCE_DIR/$src" "$TARGET_DIR/$src"
    NEW_FILES+=("$src")
    echo "  ✨ New:       $src"
  fi
  
  SYNCED_FILES+=("$src")
}

# Sync a directory recursively (each file tracked in summary)
sync_dir() {
  local dir="$1"
  if [ ! -d "$SOURCE_DIR/$dir" ]; then
    echo "  ⚠️  Source dir not found: $dir"
    return 0
  fi
  while IFS= read -r -d '' path; do
    rel="${path#$SOURCE_DIR/}"
    copy_file "$rel" "$TARGET_DIR/$rel"
  done < <(find "$SOURCE_DIR/$dir" -type f -print0)
}

# Sync agent files
echo "📁 Syncing Claude agents..."
for file in "${AGENT_FILES[@]}"; do
  copy_file "$file" "$TARGET_DIR/$file"
done

# Make agent files executable
echo ""
echo "🔧 Making agent files executable..."
for file in "${AGENT_FILES[@]}"; do
  if [ -f "$TARGET_DIR/$file" ]; then
    chmod +x "$TARGET_DIR/$file"
  fi
done

# Sync Cursor rules
echo ""
echo "📁 Syncing Cursor rules..."
for file in "${CURSOR_RULES[@]}"; do
  copy_file "$file" "$TARGET_DIR/$file"
done

# Sync commands and skills directories (recursive)
echo ""
echo "📁 Syncing commands and skills..."
for dir in "${SYNC_DIRS[@]}"; do
  if [ -d "$SOURCE_DIR/$dir" ]; then
    echo "  📂 $dir/"
    sync_dir "$dir"
  fi
done

# Sync configuration files
echo ""
echo "📁 Syncing configuration files..."
for file in "${CONFIG_FILES[@]}"; do
  copy_file "$file" "$TARGET_DIR/$file"
done

# Skills are auto-discovered from .claude/skills/<name>/SKILL.md — no registry
# file to merge. The directory sync above already copies them.

# Summary
echo ""
echo "=================================================="
echo "📊 Sync Summary"
echo "=================================================="
echo ""

if [ ${#NEW_FILES[@]} -gt 0 ]; then
  echo -e "${GREEN}✨ New files (${#NEW_FILES[@]}):${NC}"
  for file in "${NEW_FILES[@]}"; do
    echo "   + $file"
  done
  echo ""
fi

if [ ${#UPDATED_FILES[@]} -gt 0 ]; then
  echo -e "${BLUE}🔄 Updated files (${#UPDATED_FILES[@]}):${NC}"
  for file in "${UPDATED_FILES[@]}"; do
    echo "   ~ $file"
  done
  echo ""
fi

if [ ${#NEW_FILES[@]} -eq 0 ] && [ ${#UPDATED_FILES[@]} -eq 0 ]; then
  echo -e "${YELLOW}ℹ️  All files are already in sync!${NC}"
  echo ""
fi

echo "📁 Total files synced: ${#SYNCED_FILES[@]}"
echo ""

# Show next steps
if [ ${#NEW_FILES[@]} -gt 0 ] || [ ${#UPDATED_FILES[@]} -gt 0 ]; then
  echo "Next steps:"
  echo "  1. Review changes in product-workspace:"
  echo "     cd $TARGET_DIR"
  echo "     git status"
  echo ""
  echo "  2. Review diffs:"
  echo "     git diff"
  echo ""
  echo "  3. Commit if satisfied:"
  echo "     git add ."
  echo "     git commit -m 'Sync agents and skills from prototype-starter'"
  echo ""
fi

echo -e "${GREEN}✅ Sync complete!${NC}"
