# Prototype Starter

A minimal workspace template for rapid prototyping with Next.js, TypeScript, Tailwind CSS, and shadcn/ui. Pre-configured with Cursor rules, documentation templates, and full dark mode support.

> **Need comprehensive product development features?** Check out [product-workspace](https://github.com/stdemps/product-workspace) for multi-agent collaboration, quality gates, and mobile-first enforcement.

## Features

- **Zero-config start:** Clone, `npm install`, `npm run dev` → working app
- **Quick AI guidance:** Built-in `/engineer` and `/designer` agents for instant technical and UX advice
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
   git clone https://github.com/yourusername/workspace-template.git my-project
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
workspace-template/
├── .claude/
│   ├── agents/             # AI agents for quick guidance
│   │   ├── engineer.js     # Technical questions
│   │   └── designer.js     # UX questions
│   ├── hooks/              # Git hooks
│   │   └── quality-gate.sh # Lenient pre-commit checks
│   └── claude.json         # Claude Code configuration
├── .cursor/
│   └── rules/              # Auto-loaded context (available via @ mentions)
│       ├── ui-design-guidelines.mdc
│       ├── coding-standards.mdc
│       └── project-context.mdc
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

Get instant help from built-in agents:

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

These agents provide quick, context-aware advice without leaving your workflow.

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

## Resources

- [Next.js Documentation](https://nextjs.org/docs)
- [shadcn/ui Components](https://ui.shadcn.com)
- [Tailwind CSS](https://tailwindcss.com/docs)
- [Cursor Documentation](https://cursor.sh/docs)

## License

MIT

