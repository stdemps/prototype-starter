# Your Local Repositories Overview

**Generated:** January 2, 2025

---

## 🎯 Current Repository: `prototype-starter`

**You are here:** `/Users/stevendempsterair/Documents/GitHub/prototype-starter`

### What It Is
A **minimal workspace template** for rapid prototyping with Next.js, TypeScript, Tailwind CSS, and shadcn/ui.

### Key Features
- ✅ **Simple & Fast:** Minimal setup, perfect for quick prototypes
- ✅ **Basic AI Agents:** `/engineer` and `/designer` for quick guidance
- ✅ **Lenient Quality Checks:** Pre-commit hooks that warn but never block
- ✅ **Cursor-Ready:** Auto-loaded rules and guidelines

### Current Status
- **Branch:** `main` (up to date with origin)
- **Uncommitted Changes:**
  - Modified agent files (designer.js, engineer.js)
  - Modified quality-gate.sh
  - New files: QUICKSTART.md, AGENT-COMPARISON.md, ab-testing docs
  - New PM agent (pm.js)

### When to Use
- Quick prototyping and experimentation
- Solo development or small teams
- Want helpful guidance without workflow interruption
- Need quality awareness without strict enforcement

---

## 🏢 Related Repository: `product-workspace`

**Location:** `/Users/stevendempsterair/Documents/GitHub/product-workspace`

### What It Is
A **comprehensive product development workspace** - the "big brother" to prototype-starter.

### Key Differences from prototype-starter
- ✅ **Multi-Agent Collaboration:** Engineer + Designer + **PM agent**
- ✅ **Strict Quality Gates:** Enforced checks with optional prototype mode
- ✅ **Mobile-First Enforcement:** Pattern validation for responsive design
- ✅ **Collaboration Skill:** `/collab` for synthesized multi-perspective feedback

### When to Use Instead
- Building production applications
- Need multi-perspective feedback (Engineer + Designer + PM)
- Want strict quality enforcement (with flexible prototype mode)
- Working in teams with multiple roles
- Need mobile-first pattern validation

---

## 📁 Your Other Repositories

### Templates & Test Projects
1. **`claude-extension-test`** - Testing workspace template (appears to be a copy/experiment)
2. **`cursor-chat-test`** - Testing workspace template (appears to be a copy/experiment)
3. **`playground`** - Prototyping hub for designers (markdown PRDs, design screenshots, prototypes)
4. **`pm-template`** - PM template workspace

### Actual Applications
5. **`gigmusician-hub`** - GigHub (appears to be a real project)
6. **`taskflow-app`** - TaskFlow App - Project management SaaS ("Asana meets Linear")
7. **`tax-app-experiment`** - Musician Tax Assistant

---

## 🔍 Quick Comparison: prototype-starter vs product-workspace

| Feature | prototype-starter | product-workspace |
|---------|------------------|-------------------|
| **Purpose** | Quick prototyping | Full product development |
| **Agents** | Engineer, Designer | Engineer, Designer, **PM** |
| **Quality Checks** | Lenient (warn only) | Strict (can block) + prototype mode |
| **Mobile-First** | Documented patterns | **Enforced validation** |
| **Collaboration** | Individual agents | **Multi-agent synthesis** (`/collab`) |
| **Best For** | Solo/small team, fast iteration | Teams, production apps |

---

## 📋 Recommended Next Steps

### For prototype-starter (current repo):

1. **Review your changes:**
   ```bash
   git status
   git diff .claude/agents/
   git diff .claude/hooks/quality-gate.sh
   ```

2. **Commit or clean up:**
   - If changes are good: `git add .` and commit
   - If experimenting: Consider stashing or reverting

3. **Understand the new files:**
   - `.claude/QUICKSTART.md` - Quick start guide for agents
   - `.claude/AGENT-COMPARISON.md` - Comparison docs
   - `.claude/ab-testing/` - Testing documentation

### Decide What You Need:

- **Quick prototype?** → Stay in `prototype-starter`
- **Full product with teams?** → Consider `product-workspace`
- **Learning/testing?** → Use `playground` or test repos

---

## 💡 Key Resources in prototype-starter

- **Quick Start:** `.claude/QUICKSTART.md` (you have this open!)
- **Main README:** `README.md`
- **Setup Guide:** `SETUP.md`
- **Cursor Rules:** `.cursor/rules/` (auto-loaded, use @ mentions)
- **Agents:** `.claude/agents/` (engineer.js, designer.js, pm.js)
- **Quality Gate:** `.claude/hooks/quality-gate.sh`

---

## 🚀 Quick Actions

```bash
# See all your repos
cd ~/Documents/GitHub && ls -la

# Check current repo status
cd prototype-starter && git status

# Compare with product-workspace
diff prototype-starter/README.md product-workspace/README.md | head -50

# Start dev server (current repo)
npm run dev
```

---

**Need help deciding?** Ask yourself:
- Am I prototyping quickly? → `prototype-starter`
- Am I building for production? → `product-workspace`
- Am I just learning/testing? → `playground` or test repos
