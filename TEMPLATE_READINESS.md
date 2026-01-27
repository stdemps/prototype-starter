# Template Readiness Checklist

This document tracks the readiness of this repository as a GitHub template.

## ✅ Completed

### Core Configuration
- [x] Package name updated to `prototype-starter`
- [x] README updated with correct repository name
- [x] SETUP.md updated with correct repository name
- [x] Project structure diagram updated
- [x] firebase-debug.log removed (was in .gitignore but tracked)

### Documentation
- [x] README.md comprehensive and clear
- [x] SETUP.md provides step-by-step instructions
- [x] All placeholder content clearly marked as customizable
- [x] Two workflow approaches documented (PRD Pipeline vs Direct Guidance)

### Skills & Agents
- [x] All Claude agents registered in `.claude/claude.json`
- [x] Brand identity skill created for both Claude and Cursor
- [x] All agent files executable and properly formatted
- [x] PM, Executive, and User Researcher agents added
- [x] All Cursor rules created for agents and skills
- [x] PRD pipeline skills (generate, clarify, prd-to-ux, ux-to-prompts) configured

### Template Files
- [x] `.cursor/rules/project-context.mdc` - Template ready (users customize)
- [x] `docs/prds/template-prd.md` - Template ready
- [x] `skills/brand-identity/` - Template ready (users customize)
- [x] `app/layout.tsx` - Has placeholder metadata (users customize)

## 📝 Customization Points for Users

When users create a project from this template, they should customize:

1. **Brand Identity** (`skills/brand-identity/`)
   - Update brand name in `SKILL.md`
   - Customize `resources/design-tokens.json` with actual colors/fonts
   - Adjust `resources/tech-stack.md` if stack differs
   - Customize `resources/voice-tone.md` with brand personality

2. **Project Context** (`.cursor/rules/project-context.mdc`)
   - Replace template with actual project information
   - Add project overview, goals, terminology
   - Define user personas if applicable

3. **App Metadata** (`app/layout.tsx`)
   - Update `title` and `description` in metadata

4. **Package Info** (`package.json`)
   - Name will be auto-updated if using template.config.js script
   - Or manually update name and version

5. **Repository Name**
   - Update git remote URL after cloning

## 🔍 Pre-Publish Checklist

Before making this a GitHub template:

- [x] Review all documentation for clarity
- [x] Test the template.config.js script works
- [x] Verify all links in README work
- [x] Check that .gitignore is comprehensive
- [x] Ensure no personal/sensitive information remains
- [x] MCP configuration removed from workspace (should be global)
- [x] Local settings files added to .gitignore
- [ ] Test cloning and setup process from scratch
- [ ] Verify all skills work in both Claude and Cursor

## 📦 Files That Should Be Ignored

These are already in `.gitignore`:
- `node_modules/`
- `.next/`
- `.env*` files
- `firebase-debug.log`
- Build artifacts
- `.claude/settings.local.json` (user-specific Claude settings)
- `.cursor/mcp-servers.json` and `.cursor/mcp.json` (MCP should be global)

## 🎯 Template Features

This template includes:
- ✅ Next.js 16 with App Router
- ✅ TypeScript strict mode
- ✅ Tailwind CSS + shadcn/ui
- ✅ Dark mode support
- ✅ 5 Claude agents (engineer, designer, pm, executive, user-researcher)
- ✅ 5 Claude skills (PRD pipeline: generate, clarify, prd-to-ux, ux-to-prompts, brand-identity)
- ✅ Cursor rules for auto-loaded context (all agents + skills)
- ✅ PRD templates and documentation structure
- ✅ Brand identity skill (customizable)
- ✅ PRD writing skill with templates and guidelines
- ✅ Lenient quality checks (warn, don't block)
- ✅ Sync script for product-workspace integration

## 🚀 Next Steps for Template Users

1. Clone or use GitHub template button
2. Run `npm install`
3. Customize brand identity skill
4. Update project context
5. Add their PRD to `docs/prds/`
6. Start building!
