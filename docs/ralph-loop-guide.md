# Ralph Loop Guide for Prototype Starter

## What is Ralph Loop?

Ralph Loop (officially: Ralph Wiggum plugin) is a Claude Code plugin that enables autonomous, self-correcting development workflows. It turns a single prompt into a persistent loop where Claude continues working, fixing mistakes, and iterating until it meets your completion criteria.

**Key concept:** You give Claude a task with objective exit conditions (like "all tests pass" or "build succeeds"), and Ralph Loop keeps Claude working autonomously until those conditions are met.

## Why Use Ralph Loop for Prototyping?

### Perfect For:
- ✅ **Autonomous feature implementation** - Let Claude work for hours while you do other things
- ✅ **Self-correcting workflows** - Claude fixes its own mistakes and iterates until correct
- ✅ **Objective completion criteria** - Tasks with measurable success (tests, builds, linters)
- ✅ **Reducing iteration friction** - No need to manually re-prompt after each error

### Not Ideal For:
- ❌ **Exploratory work** - Open-ended research or discovery tasks
- ❌ **Subjective decisions** - Tasks requiring human judgment or aesthetic choices
- ❌ **Quick one-off changes** - Simple tasks that take < 5 minutes

## Installation

Ralph Loop is available as an official Claude Code plugin:

```bash
/plugin install ralph-wiggum@claude-plugins-official
```

Once installed, you can use Ralph Loop commands in your Claude Code session.

## How It Works

### The Basic Loop

1. **You provide a task** with clear exit conditions
2. **Claude works on the task** using available tools
3. **When Claude tries to exit**, Ralph Loop checks if exit conditions are met
4. **If not complete**, the prompt is fed back and Claude continues
5. **If complete**, the loop exits successfully

### Safety Mechanisms

**Always use `--max-iterations` as your primary safety mechanism:**

```bash
/ralph-loop "Implement feature X with passing tests" --max-iterations 50
```

This prevents infinite loops and runaway API costs.

### Exit Conditions

Ralph Loop recognizes completion when:
- **Explicit completion signal** - Claude outputs a specific phrase you define
- **Objective criteria met** - Tests pass, build succeeds, linter clean
- **Max iterations reached** - Safety limit prevents infinite loops

## Usage Patterns for Prototyping

### Pattern 1: Test-Driven Feature Implementation

```bash
/ralph-loop "Implement [FEATURE_NAME] with TDD workflow:
1. Write tests that define expected behavior
2. Implement code to pass tests
3. Refactor for quality
4. All tests must pass before completion
Exit only when: npm test shows all passing" --max-iterations 30
```

**Good for:** New features with clear specifications

### Pattern 2: Build Error Resolution

```bash
/ralph-loop "Fix all TypeScript errors and build the project.
Exit only when: npm run build succeeds with no errors" --max-iterations 20
```

**Good for:** Cleaning up type errors after major refactoring

### Pattern 3: Linter Compliance

```bash
/ralph-loop "Fix all ESLint warnings and errors.
Exit only when: npm run lint shows 0 problems" --max-iterations 15
```

**Good for:** Code quality cleanup

### Pattern 4: UI Component with Visual Verification

```bash
/ralph-loop "Implement [COMPONENT_NAME] component:
1. Write tests for functionality
2. Implement component with shadcn/ui
3. Ensure WCAG 2.1 AA accessibility
4. Verify responsive design (375px, 768px, 1024px)
Exit only when: All tests pass AND component renders correctly" --max-iterations 25
```

**Good for:** UI components with objective acceptance criteria

## Best Practices

### 1. Define Clear Exit Conditions

**Good:**
```
Exit only when: All tests pass AND build succeeds
```

**Bad:**
```
Exit when done
```

### 2. Set Appropriate Max Iterations

| Task Complexity | Recommended Max Iterations |
|----------------|---------------------------|
| Simple fix (linter, type error) | 10-15 |
| New component/feature | 20-30 |
| Complex feature with tests | 30-50 |
| Major refactoring | 40-60 |

### 3. Use Objective Criteria

Ralph Loop works best with measurable success criteria:
- ✅ Tests passing/failing
- ✅ Build succeeding/failing
- ✅ Linter errors count
- ✅ File existence/changes
- ❌ "Looks good"
- ❌ "Code is clean"

### 4. Monitor Progress

Check on long-running loops periodically:
```bash
/tasks  # View active tasks
```

### 5. Start Small

Test Ralph Loop with simple tasks before complex multi-hour workflows:
1. Start with linter fix (5-10 iterations)
2. Progress to simple feature (15-20 iterations)
3. Scale up to complex features (30-50 iterations)

## Prototyping-Specific Tips

### Tip 1: Combine with Lenient Quality Gates

Prototype-starter has lenient pre-commit hooks that warn but don't block. Use Ralph Loop to clean up after rapid prototyping:

```bash
# After fast prototyping session
/ralph-loop "Fix all linter warnings and type errors.
Keep functionality unchanged.
Exit only when: npm run lint AND tsc --noEmit show no errors" --max-iterations 20
```

### Tip 2: Iterate on UI Polish

Prototype quickly, then let Ralph Loop polish:

```bash
/ralph-loop "Improve [COMPONENT] accessibility and responsive design:
1. Ensure WCAG 2.1 AA contrast ratios
2. Test keyboard navigation
3. Verify mobile (375px), tablet (768px), desktop (1024px)
Exit only when: All accessibility checks pass" --max-iterations 15
```

### Tip 3: Autonomous Testing Setup

Let Ralph Loop set up testing infrastructure when you're ready:

```bash
/ralph-loop "Set up Playwright for e2e testing:
1. Install @playwright/test
2. Create playwright.config.ts
3. Add test script to package.json
4. Create example test in e2e/ directory
5. Verify test runs successfully
Exit only when: npm run test:e2e executes without errors" --max-iterations 20
```

## Cost Considerations

Ralph Loop can run for hours, consuming API tokens:

**Cost estimation:**
- Simple task (10 iterations): ~$1-2
- Medium task (30 iterations): ~$5-10
- Complex task (50 iterations): ~$15-25

**Cost control:**
- Always use `--max-iterations`
- Start with lower limits and increase if needed
- Monitor `/tasks` to cancel runaway loops

## Troubleshooting

### Loop Exits Too Early

**Problem:** Claude thinks it's done but criteria aren't met

**Solution:** Make exit conditions more explicit:
```
Exit ONLY when ALL of these are true:
1. npm test shows "All tests passed"
2. No console.error in output
3. Build produces dist/ directory
```

### Loop Never Exits

**Problem:** Task is impossible or criteria are unclear

**Solution:**
1. Check if task is actually achievable
2. Simplify exit criteria
3. Use `--max-iterations` to prevent runaway costs
4. Cancel loop with `/cancel-ralph` if needed

### Loop Keeps Failing Same Way

**Problem:** Claude stuck in infinite retry loop

**Solution:**
1. Stop loop and investigate root cause manually
2. Provide more context about error
3. Break task into smaller sub-tasks

## Real-World Example

```bash
/ralph-loop "Implement a dark mode toggle in the topbar:

Requirements:
1. Add sun/moon icon button to topbar.tsx
2. Use theme toggle from components/theme-toggle.tsx
3. Button should use lucide-react icons
4. Accessible with keyboard (Tab + Enter)
5. Persists preference to localStorage
6. Write tests for toggle functionality

Exit conditions (ALL must be true):
- npm run dev starts without errors
- Toggle button visible in topbar
- Clicking toggle switches theme
- Theme persists after page reload
- No TypeScript errors (tsc --noEmit)
- No ESLint errors (npm run lint)

Testing:
- Run npm run dev and verify in browser
- Test keyboard navigation
- Test theme persistence

Exit only when all exit conditions are verified true." --max-iterations 35
```

## Advanced: Custom Completion Signals

For complex workflows, define a unique completion phrase:

```bash
/ralph-loop "Implement feature X...

COMPLETION SIGNAL: Only output 'FEATURE_X_COMPLETE_20260109' when:
1. All tests pass
2. Build succeeds
3. Component renders correctly

Do NOT output this signal unless ALL criteria are met." --max-iterations 40
```

This prevents accidental early exits.

## Resources

- [Ralph Wiggum Official README](https://github.com/anthropics/claude-code/blob/main/plugins/ralph-wiggum/README.md)
- [Ralph Loop Explanation (Medium)](https://jpcaparas.medium.com/ralph-wiggum-explained-the-claude-code-loop-that-keeps-going-3250dcc30809)
- [Autonomous Loops for Claude Code](https://paddo.dev/blog/ralph-wiggum-autonomous-loops/)
- [Ralph Loop Technique Overview](https://awesomeclaude.ai/ralph-wiggum)

## When to Graduate to Product-Workspace

Ralph Loop works great for prototyping, but if you need:
- Pre-configured testing infrastructure (Playwright included)
- Strict quality gates with prototype mode toggle
- Multi-agent collaboration (Engineer + Designer + PM)
- Production-ready autonomous workflows

Consider using [product-workspace](https://github.com/stdemps/product-workspace) instead, which has Ralph Loop patterns built-in with comprehensive testing setup.

---

**Quick Start Summary:**

```bash
# Install Ralph Loop
/plugin install ralph-wiggum@claude-plugins-official

# Try a simple task
/ralph-loop "Fix all TypeScript errors. Exit when: tsc --noEmit succeeds" --max-iterations 15

# Monitor progress
/tasks

# Cancel if needed
/cancel-ralph
```

Happy autonomous prototyping! 🚀
