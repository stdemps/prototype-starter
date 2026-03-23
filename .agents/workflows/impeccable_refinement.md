---
description: impeccable_refinement - Comprehensive autonomous UI review and polish
---
# Impeccable Refinement Workflow

This workflow consolidates the single-shot "impeccable" UI commands (`audit`, `critique`, `polish`, `normalize`) into a single end-to-end refinement pass. It is ideal for taking a raw, functional component and elevating it to a premium, production-level UX.

**Prerequisites:** You must specify a target component or page file to run this against.

## Steps

1. **Audit & Critique the Component**
   - Use `view_file` to review the provided code.
   - Run a mental "audit" checking for: Accessibility (a11y), responsive breakpoints, and semantic HTML.
   - Run a mental "critique" checking for: Visual hierarchy, contrast, spacing inconsistencies, and typography.
   
2. **Plan the Polish**
   - Identify how to "normalize" the code to match the overall `DESIGN_SYSTEM.md` or `ui-design-guidelines.mdc`.
   - Identify areas where "delight" or "animation" can be added (e.g., subtle hover states, Framer Motion/Tailwind transitions).
   - Identify areas where the component can be "simplified" (removing unnecessary DOM nodes) or "clarified" (better copy/labels).

3. **Propose & Implement Changes**
   - Use `multi_replace_file_content` or `replace_file_content` to apply the refinements.
   - Ensure the final component uses appropriate styling standards (e.g., consistent padding/margin scales, dark mode support if applicable).
   - Write a summary of the UX improvements made.

// turbo-all
