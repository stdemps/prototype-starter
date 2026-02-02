# Prototype Starter

A minimal workspace template for rapid prototyping with Next.js, TypeScript, Tailwind CSS, and shadcn/ui. Pre-configured with Cursor rules, documentation templates, and full dark mode support.

> **Need comprehensive product development features?** Check out [product-workspace](https://github.com/stdemps/product-workspace) for multi-agent collaboration, quality gates, and mobile-first enforcement.

## Features

- **Zero-config start:** Clone, `npm install`, `npm run dev` → working app
- **Two workflow approaches:** PRD-to-code pipeline for structured specs OR direct guidance for quick questions
- **Quick AI guidance:** Built-in agents (`/engineer`, `/designer`, `/prd-generator`, `/prd-to-ux`, etc.) for instant help
- **PRD pipeline:** Turn ideas into buildable specs with structured workflows (Idea → PRD → UX → Implementation Plan)
- **Lenient quality checks:** Optional pre-commit checks that warn but never block (perfect for prototyping)
- **Cursor-ready:** `.cursor/rules/` auto-loaded with UI guidelines and coding standards
- **Documentation structure:** PRD templates, reviewer personas ready to use
- **Dark mode:** Fully configured and working out of the box
- **Type-safe:** TypeScript strict mode enabled
- **Accessible:** WCAG 2.1 AA guidelines built-in
- **Mobile-first:** Responsive patterns documented and ready

## Quick Start

### Option 1: Use GitHub Template (Recommended)

1. **Click "Use this template"** on GitHub
2. **Create a new repository** from the template
3. **Clone your new repository:**
   ```bash
   git clone https://github.com/yourusername/your-project.git
   cd your-project
   ```

### Option 2: Clone Directly

1. **Clone this repository:**
   ```bash
   git clone https://github.com/yourusername/prototype-starter.git my-project
   cd my-project
   ```

### Then Continue:

2. **Install dependencies:**
   ```bash
   npm install
   ```

3. **Run the customization script (optional):**
   ```bash
   node template.config.js
   ```

4. **Start development server:**
   ```bash
   npm run dev
   ```

5. **Open in Cursor:**
   - Open the project in Cursor
   - Drop your PRD into `docs/prds/`
   - Start coding with all context loaded!

## Project Structure

```
prototype-starter/
├── .claude/
│   ├── agents/             # AI agents and skills
│   │   ├── engineer.js     # Technical questions
│   │   ├── designer.js     # UX questions
│   │   ├── prd-generator.js    # MVP idea → PRD
│   │   ├── prd-clarifier.js    # PRD refinement Q&A
│   │   ├── prd-to-ux.js        # PRD → UX spec
│   │   ├── ux-to-implementation-plan.js    # UX spec → implementation plan
│   │   └── brand-identity.js   # Brand consistency (colors, voice, tech)
│   ├── hooks/              # Git hooks
│   │   └── quality-gate.sh # Lenient pre-commit checks
│   └── claude.json         # Claude Code configuration
├── .cursor/
│   └── rules/              # Auto-loaded context (available via @ mentions)
│       ├── ui-design-guidelines.mdc
│       ├── coding-standards.mdc
│       ├── project-context.mdc
│       └── agents/         # Agent-specific rules
│           ├── brand-identity.mdc
│           ├── designer.mdc
│           ├── engineer.mdc
│           ├── executive.mdc
│           └── user-researcher.mdc
├── skills/                # Brand identity skill (customizable)
│   └── brand-identity/
│       ├── SKILL.md
│       └── resources/
│           ├── design-tokens.json
│           ├── tech-stack.md
│           └── voice-tone.md
├── .github/
│   └── repository-template/  # GitHub template configuration
├── docs/
│   ├── prds/               # PRD templates
│   ├── research/           # Research documentation
│   ├── prototypes/         # Design prototypes
│   └── reviewers/          # Reviewer personas
├── app/                    # Next.js App Router
│   ├── layout.tsx
│   ├── page.tsx
│   └── globals.css
├── components/
│   ├── ui/                 # shadcn/ui components
│   ├── theme-provider.tsx
│   ├── theme-toggle.tsx
│   └── topbar.tsx
└── lib/
    └── utils.ts
```

## Using Cursor Rules

Files in `.cursor/rules/` are automatically loaded by Cursor and available via @ mentions:

- `@ui-design-guidelines` - UI/UX guidelines, accessibility, mobile responsiveness
- `@coding-standards` - TypeScript, React, and code quality standards
- `@project-context` - Project-specific context (customize this!)

**Example:**
```
@ui-design-guidelines How should I make this component mobile-responsive?
```

## Quick AI Guidance

Get instant help from built-in agents. See [Two Workflow Approaches](#two-workflow-approaches) below for comprehensive workflow guidance.

**Engineer Agent** - Technical questions and architecture guidance:
```bash
/engineer "How should I structure authentication for this Next.js app?"
/engineer "What's the best way to handle server-side data fetching?"
/engineer "Should I use React Query or SWR for this use case?"
```

**Designer Agent** - UX and accessibility guidance:
```bash
/designer "How should loading states work in this form?"
/designer "What's the best mobile navigation pattern for this app?"
/designer "How do I make this component accessible?"
```

**Brand Identity Agent** - Brand consistency across UI, styling, and copy:
```bash
/brand-identity "What colors should I use for the primary button?"
/brand-identity "Generate a login form component following brand guidelines"
/brand-identity "Write error messages for form validation"
```

These agents provide quick, context-aware advice without leaving your workflow.

## Two Workflow Approaches

Prototype Starter supports two complementary workflows for different needs:

### 1. PRD-to-Code Pipeline (Structured, Document-Driven)

For turning ideas into buildable specs through structured documents. Best for new features, larger projects, or when you need documented specifications.

**Workflow:**
```
Idea → /prd-generator → PRD
PRD → /prd-clarifier → Refined PRD (optional)
PRD → /prd-to-ux → UX Spec
UX Spec → /ux-to-implementation-plan → Implementation Plan
Implementation Plan → Work through tasks incrementally → Code
```

**Skills:**
- `/prd-generator "your idea"` - Convert rough MVP ideas into structured PRDs
- `/prd-clarifier docs/prds/feature.md` - Refine PRDs through structured Q&A
- `/prd-to-ux docs/prds/feature.md` - Translate PRDs into UX specs (6 designer passes)
- `/ux-to-implementation-plan docs/prds/feature-ux-spec.md` - Transform UX specs into implementation plan with small, context-efficient chunks

**When to use:**
- ✅ Starting a new feature from scratch
- ✅ Need documented specifications
- ✅ Building larger, multi-component features
- ✅ Want structured implementation plan with small, manageable tasks
- ✅ Working with a team that needs clear specs

**Example:**
```bash
# Step 1: Generate PRD from idea
/prd-generator "A dashboard for tracking daily habits"

# Step 2: Create UX specification (optional clarification first)
/prd-to-ux docs/prds/daily-habits.md

# Step 3: Generate implementation plan with small, context-efficient chunks
/ux-to-implementation-plan docs/prds/daily-habits-ux-spec.md

# Step 4: Work through implementation plan tasks incrementally
# Each task has enough context to implement without the full spec
```

### 2. Direct Guidance (Conversational, Ad-Hoc)

For immediate help and quick questions. Best for debugging, spot advice, or making small changes.

**Workflow:**
```
Question → /engineer or /designer → Immediate Answer → Action
```

**Skills:**
- `/engineer "your question"` - Technical questions, architecture, debugging
- `/designer "your question"` - UX questions, design guidance, accessibility

**When to use:**
- ✅ Quick technical/design questions
- ✅ Debugging existing code
- ✅ Making a single component or small change
- ✅ Need immediate spot advice
- ✅ Interactive problem-solving

**Example:**
```bash
# Technical question
/engineer "How should I structure authentication for this Next.js app?"

# UX question
/designer "What's the best mobile navigation pattern for a dashboard?"

# Debugging
/engineer "This API call is failing with CORS errors, how do I fix it?"
```

### Choosing the Right Workflow

| Situation | Recommended Workflow |
|-----------|---------------------|
| New feature, starting from idea | PRD Pipeline |
| Quick fix or small change | Direct Guidance |
| Need specs/documentation | PRD Pipeline |
| Debugging existing code | Direct Guidance |
| Building complex UI flows | PRD Pipeline |
| Making a single component | Direct Guidance |
| Team collaboration | PRD Pipeline |
| Solo rapid iteration | Either (direct guidance is faster) |

**Note:** These workflows complement each other. You can use direct guidance to get quick help while working through the PRD pipeline, or use the PRD pipeline to document decisions made via direct guidance.

## Lenient Quality Checks

Pre-commit hooks run quality checks but **never block commits** - perfect for prototyping:

```bash
# Runs checks, shows warnings, but always allows commit
git commit -m "WIP: Experimenting with new feature"

# Skip checks entirely if needed
SKIP_QUALITY_GATE=1 git commit -m "Quick fix"
```

**What it checks:**
- ESLint code quality
- TypeScript type errors

**Philosophy:** See issues, stay aware, but keep moving fast.

## Documentation Templates

### PRD Template
Use `docs/prds/template-prd.md` as a starting point for your product requirements documents.

### Reviewer Personas
Use the reviewer personas in `docs/reviewers/` to get multi-perspective feedback:
- `@docs/reviewers/engineer.md` - Technical feasibility
- `@docs/reviewers/designer.md` - UX and design
- `@docs/reviewers/executive.md` - Business and strategy
- `@docs/reviewers/user-researcher.md` - User research and validation

## Customization

### 1. Update Project Context
Edit `.cursor/rules/project-context.mdc` with your project-specific information.

### 2. Customize App Metadata
Update `app/layout.tsx` with your app name and description.

### 3. Add Your PRD
Drop your PRD into `docs/prds/` and reference it with `@docs/prds/your-prd.md`.

### 4. Install Additional Components
Use shadcn/ui CLI to add more components:
```bash
npx shadcn@latest add [component-name]
```

## Tech Stack

- **Next.js 16** - React framework with App Router
- **TypeScript** - Type safety
- **Tailwind CSS** - Utility-first CSS
- **shadcn/ui** - Component library
- **next-themes** - Dark mode support
- **Lucide React** - Icons

## Scripts

- `npm run dev` - Start development server
- `npm run build` - Build for production
- `npm run start` - Start production server
- `npm run lint` - Run ESLint

## Related Projects

### Prototype Starter vs Product Workspace

This repository (**prototype-starter**) is designed for rapid prototyping with:
- Minimal setup and configuration
- Fast onboarding (< 5 minutes)
- Basic AI agents (Engineer, Designer) for quick guidance
- Lenient quality checks that never block commits
- Simple Cursor rules and documentation templates

For comprehensive product development with advanced features, use:
- [**product-workspace**](https://github.com/stdemps/product-workspace) - Multi-agent collaboration (adds PM agent + `/collab` orchestration), strict quality gates with prototype mode, mobile-first enforcement

**Choose prototype-starter when:**
- Quick prototyping and experimentation
- Solo development or small teams
- Want helpful guidance without workflow interruption
- Need quality awareness without enforcement

**Choose product-workspace when:**
- Building production applications
- Need multi-perspective feedback synthesis (Engineer + Designer + PM)
- Want strict quality enforcement with flexible prototype mode
- Working in teams with multiple roles
- Need mobile-first pattern validation

## Advanced Testing & Autonomous Workflows

### Testing Infrastructure

This template starts with **zero testing infrastructure** by design - add testing tools when you need them:

**Recommended testing frameworks:**
- **React Testing Library** - Component testing
- **Playwright** - End-to-end testing with screenshot capabilities
- **Vitest** - Fast unit testing for modern projects
- **Cypress** - Alternative e2e testing with great DX

**Testing guidance included:**
- [Testing Prompts](./prompts/testing.md) - Comprehensive testing patterns and TDD workflow
- Framework-agnostic approach - use any testing tool you prefer
- Optional UI verification with screenshots for visual correctness

### Ralph Loop for Autonomous Development

**[Ralph Loop](https://github.com/anthropics/claude-code/blob/main/plugins/ralph-wiggum/README.md)** is a Claude Code plugin that enables autonomous, multi-hour development workflows with self-correction.

**Perfect for prototyping:**
- ✅ Autonomous feature implementation while you do other work
- ✅ Self-correcting loops that fix errors until tests pass
- ✅ Objective completion criteria (tests, builds, linters)
- ✅ Cost-effective for rapid iteration ($1-25 depending on complexity)

**Quick start:**
```bash
# Install Ralph Loop plugin
/plugin install ralph-wiggum@claude-plugins-official

# Example: Fix all linter errors autonomously
/ralph-loop "Fix all ESLint errors. Exit when: npm run lint shows 0 problems" --max-iterations 15
```

**Learn more:**
- [Ralph Loop Guide](./docs/ralph-loop-guide.md) - Complete guide with prototyping patterns
- Always use `--max-iterations` for cost control
- Best for tasks with objective success criteria (tests, builds, linters)

**For production-grade autonomous workflows:**
[product-workspace](https://github.com/stdemps/product-workspace) includes pre-configured testing infrastructure and Ralph Loop patterns built-in.

## Resources

- [Next.js Documentation](https://nextjs.org/docs)
- [shadcn/ui Components](https://ui.shadcn.com)
- [Tailwind CSS](https://tailwindcss.com/docs)
- [Cursor Documentation](https://cursor.sh/docs)

## License

MIT

