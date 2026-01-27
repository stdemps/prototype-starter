# Template Pre-Commit Checklist

Use this checklist before committing changes to ensure the template remains clean and ready for use.

## ✅ Security & Privacy

- [ ] No personal credentials (API keys, secrets, tokens) in any files
- [ ] No personal paths (`/Users/username/`) in scripts or configs
- [ ] No personal email addresses or usernames (except in links to other repos)
- [ ] `.claude/settings.local.json` is in `.gitignore`
- [ ] MCP configuration files are in `.gitignore` (should be global)
- [ ] All `.env*` files are in `.gitignore`

## ✅ Template Readiness

- [ ] All placeholder content is clearly marked (e.g., "App Name", "App description")
- [ ] README.md has generic instructions (no personal references)
- [ ] SETUP.md has generic instructions
- [ ] `app/layout.tsx` has placeholder metadata
- [ ] `skills/brand-identity/` has template placeholders
- [ ] `.cursor/rules/project-context.mdc` has template structure

## ✅ Documentation

- [ ] README.md is comprehensive and clear
- [ ] SETUP.md provides step-by-step instructions
- [ ] All links in documentation work
- [ ] TEMPLATE_READINESS.md is up to date
- [ ] No broken references or TODO items in public docs

## ✅ Code Quality

- [ ] All scripts are executable (`chmod +x`)
- [ ] All agent files are executable
- [ ] No hardcoded values that should be configurable
- [ ] TypeScript compiles without errors
- [ ] ESLint passes (or warnings are acceptable for template)

## ✅ Git Configuration

- [ ] `.gitignore` is comprehensive
- [ ] No sensitive files are tracked
- [ ] No build artifacts are tracked
- [ ] No local configuration files are tracked

## ✅ Dependencies

- [ ] `package.json` has appropriate version ranges
- [ ] `package-lock.json` is up to date
- [ ] No development-only dependencies in production deps
- [ ] All dependencies are publicly available (no private npm packages)

## ✅ Scripts & Tools

- [ ] `template.config.js` works correctly
- [ ] `scripts/create-workspace.sh` works correctly
- [ ] `scripts/sync-to-product-workspace.sh` uses relative paths
- [ ] All scripts have proper error handling

## Quick Verification Commands

```bash
# Check for personal info
grep -r "stevendempsterair\|stdemps" . --exclude-dir=node_modules --exclude="*.lock"

# Check for hardcoded paths
grep -r "/Users/" . --exclude-dir=node_modules

# Check for credentials
grep -r "secret\|password\|api_key\|token" . --exclude-dir=node_modules --exclude="*.lock" -i

# Verify gitignore
git status --ignored

# Test template config
node template.config.js
```

## Before Pushing

1. Run `git status` and review all changes
2. Check `git diff` for any unexpected changes
3. Verify no sensitive data in diffs
4. Test cloning in a fresh directory if possible
5. Review TEMPLATE_READINESS.md checklist
