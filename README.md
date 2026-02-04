# Prototype Starter

A minimal workspace template for rapid prototyping with Next.js, TypeScript, Tailwind CSS, and shadcn/ui. Pre-configured with Cursor rules, documentation templates, and full dark mode support.

> **Need comprehensive product development features?** Check out [product-workspace](https://github.com/stdemps/product-workspace) for multi-agent collaboration, quality gates, and mobile-first enforcement.

## Features

- **Zero-config start:** Clone, `npm install`, `npm run dev` → working app
- **Two workflow approaches:** PRD-to-code pipeline for structured specs OR direct guidance for quick questions
- **Quick AI guidance:** Built-in agents (`/engineer`, `/designer`, `/pm`) for instant help
- **UI refinement commands:** 17 Impeccable commands (`/audit`, `/polish`, `/simplify`, etc.) for quality and polish
- **PRD pipeline:** Turn ideas into buildable specs (Idea → PRD → UX → Implementation Plan)
- **Design skills:** `frontend-design` for creative UI, `ui-ux-pro-max` for design lookups, `vercel-react-best-practices` for performance
- **Lenient quality checks:** Pre-commit checks that warn but never block (perfect for prototyping)
- **Dual IDE support:** Works with both Claude Code and Cursor (mirrored skills in `.claude/` and `.cursor/`)
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
├── .claude/                    # Claude Code configuration
│   ├── SKILLS.md               # Skills & commands reference
│   ├── agents/                 # Conversational agents
│   │   ├── engineer.js         # Technical questions
│   │   ├── designer.js         # UX questions
│   │   ├── pm.js               # Product strategy
│   │   ├── executive.js        # Business & prioritization
│   │   └── user-researcher.js  # User validation
│   ├── commands/               # Impeccable UI refinement commands
│   │   ├── audit.md            # Quality checks
│   │   ├── polish.md           # Final refinement
│   │   ├── simplify.md         # Remove complexity
│   │   └── ...                 # 14 more commands
│   ├── skills/                 # AI skills
│   │   ├── frontend-design/    # Primary design guidance
│   │   ├── ui-ux-pro-max/      # Design reference database
│   │   ├── vercel-react-best-practices/  # React/Next.js patterns
│   │   ├── pm-generate-prd.js  # PRD pipeline skills
│   │   └── ...
│   ├── hooks/
│   │   └── quality-gate.sh     # Lenient pre-commit checks
│   └── claude.json             # Claude Code config
├── .cursor/                    # Cursor configuration (mirrors .claude/)
│   ├── SKILLS.md               # Skills reference for Cursor
│   ├── commands/               # Impeccable commands (@ mention)
│   ├── checklists/             # Design/workflow checklists
│   ├── skills/                 # AI skills
│   └── rules/                  # Auto-loaded context
│       ├── ui-design-guidelines.mdc
│       ├── coding-standards.mdc
│       └── agents/             # Agent rules
├── docs/
│   ├── prds/                   # PRD templates
│   └── research/               # Research documentation
├── prompts/                    # Implementation prompts
├── app/                        # Next.js app
│   ├── layout.tsx
│   ├── page.tsx
│   └── globals.css
├── components/
│   ├── ui/                     # shadcn/ui components
│   └── ...
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

## UI Refinement Commands (Impeccable)

Polish and refine your UI with these specialized commands. Run `/teach-impeccable` once to set up project context.

**Quality & Review:**
```bash
/audit           # Comprehensive quality check (a11y, perf, responsive)
/critique        # UX design review (hierarchy, clarity)
/polish          # Final refinement before release
```

**Simplification & Cleanup:**
```bash
/simplify        # Remove unnecessary complexity
/normalize       # Align with design system
/clarify         # Improve UX copy and labels
```

**Enhancement:**
```bash
/animate         # Add purposeful motion
/colorize        # Add strategic color
/bolder          # Amplify understated designs
/quieter         # Tone down aggressive designs
/delight         # Add moments of joy
```

**Production Readiness:**
```bash
/optimize        # Performance improvements
/harden          # Error handling, edge cases
/adapt           # Responsive design fixes
/extract         # Create reusable components
/onboard         # Design onboarding flows
```

Most commands accept an optional argument to focus on a specific area, e.g., `/audit navbar`

See [.claude/SKILLS.md](.claude/SKILLS.md) for the complete skills reference.

## Two Workflow Approaches

Prototype Starter supports two complementary workflows for different needs:

### 1. PRD-to-Code Pipeline (Structured, Document-Driven)

For turning ideas into buildable specs through structured documents. Best for new features, larger projects, or when you need documented specifications.

**Workflow:**
```
Idea → /pm-generate-prd → PRD
PRD → /pm-clarify-prd → Refined PRD (optional)
PRD → /designer-prd-to-ux → UX Spec
UX Spec → /ux-to-implementation-plan → Implementation Plan
Implementation Plan → Work through tasks incrementally → Code
```

**Skills (Claude Code — names match claude.json keys):**
- `/pm-generate-prd "your idea"` - Convert rough MVP ideas into structured PRDs
- `/pm-clarify-prd docs/prds/feature.md` - Refine PRDs through structured Q&A
- `/designer-prd-to-ux docs/prds/feature.md` - Translate PRDs into UX specs (6 designer passes)
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
/pm-generate-prd "A dashboard for tracking daily habits"

# Step 2: Create UX specification (optional clarification first)
/designer-prd-to-ux docs/prds/daily-habits.md

# Step 3: Generate implementation plan with small, context-efficient chunks
/ux-to-implementation-plan docs/prds/daily-habits-ux-spec.md

# Step 4: Work through implementation plan tasks incrementally
# Each task has enough context to implement without the full spec
```

### 2. Direct Guidance (Conversational, Ad-Hoc)

For immediate help and quick questions. Best for debugging, spot advice, or making small changes.

**Workflow:**
```
Question → /engineer, /designer, /pm, /executive, or /user-researcher → Immediate Answer → Action
```

**Agents (conversational):**
- `/engineer "your question"` - Technical questions, architecture, debugging
- `/designer "your question"` - UX questions, design guidance, accessibility
- `/pm "your question"` - Product strategy, scope, prioritization
- `/executive "your question"` - Business cases, stakeholder alignment
- `/user-researcher "your question"` - User validation, research planning

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

### Responsive Design Checklist
Use [.cursor/checklists/responsive-design-checklist.md](.cursor/checklists/responsive-design-checklist.md) before starting UI work and when reviewing designs (mobile-first, breakpoints, touch targets).

### Prompt library
Use the prompts in `prompts/` for implementation guidance: [testing](prompts/testing.md), [architecture](prompts/architecture.md), [development](prompts/development.md), [code-review](prompts/code-review.md), and more. See [prompts/README.md](prompts/README.md).

### Agent perspectives (Cursor rules)
Use the agent rules in `.cursor/rules/agents/` for multi-perspective feedback. Reference them in Cursor with `@`:
- `@engineer` — Technical feasibility and architecture
- `@designer` — UX and design
- `@pm` — Product strategy and scope
- `@executive` — Business and strategy
- `@user-researcher` — User research and validation
- Plus skill rules: `@pm-generate-prd`, `@designer-prd-to-ux`, `@ux-to-implementation-plan`, etc.

## Customization

For step-by-step setup, see [SETUP.md](SETUP.md).

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
- Five AI agents (PM, Engineer, Designer, Executive, User Researcher) and PRD pipeline skills for quick guidance
- Lenient quality checks that never block commits
- Cursor rules for all agents and skills, plus UI guidelines and documentation templates

For comprehensive product development with advanced features, use:
- [**product-workspace**](https://github.com/stdemps/product-workspace) - Multi-agent orchestration (`/collab`), strict quality gates with prototype mode, mobile-first enforcement

**Choose prototype-starter when:**
- Quick prototyping and experimentation
- Solo development or small teams
- Want helpful guidance without workflow interruption
- Need quality awareness without enforcement

**Choose product-workspace when:**
- Building production applications
- Need orchestrated multi-agent workflows beyond the five agents in this template
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

**For production-grade development:**
[product-workspace](https://github.com/stdemps/product-workspace) includes pre-configured testing infrastructure, quality gates, and multi-agent collaboration.

## Resources

- [Next.js Documentation](https://nextjs.org/docs)
- [shadcn/ui Components](https://ui.shadcn.com)
- [Tailwind CSS](https://tailwindcss.com/docs)
- [Cursor Documentation](https://cursor.sh/docs)

## License

MIT

