---
description: prototype_sprint - Autonomous scaffolding from a PRD or Idea
---
# Prototype Sprint Workflow

This workflow is designed to kickstart a new feature or page autonomously, progressing from a Product Requirement Document (PRD) or Idea directly to scaffolded UI components. 

**Prerequisites:** You must provide the path to a PRD, Idea document, or explain the feature thoroughly to the agent before starting this workflow.

## Steps

1. **Read & Analyze the Target Document**
   - Use `view_file` to read the provided PRD or Idea document.
   - Absorb the goals, personas, and requirements.

2. **Generate the UX Spec (Act as @designer)**
   - Draft a `UX Spec` conceptually. Define the layout hierarchy, mobile vs desktop views, and primary user interactions required.
   - Refer to `ui-design-guidelines.mdc` or `DESIGN_SYSTEM.md` if available to ensure accurate tokens (colors, typography).

3. **Generate the Implementation Plan (Act as @engineer)**
   - Plan the component structure (e.g., what goes in `app/`, what are the shared `components/`).
   - Write this out internally or in a quick `.md` artifact for the user to review.

4. **Scaffold the Foundation**
   - Create or update the necessary structural files (e.g., Next.js page files, React components).
   - Wire up the basic UI, ensuring routing and imports are correct and there are no TypeScript/build errors.
   - Focus on structure first, styling second. The user can run the `impeccable_refinement` workflow later for deep polish.

// turbo-all
