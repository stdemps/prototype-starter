---
description: prototype_from_mockup - Autonomous scaffolding from Figma screenshots or images
---
# Prototype From Mockup Workflow

This workflow is designed to translate visual mockups (such as Figma screens) into functioning code prototypes. It is optimized for experimentation, allowing the designer to quickly spin up multiple iterations to test different ideas.

**Prerequisites:** You must attach one or more screenshots/images of your design to your prompt when invoking this workflow.

## Steps

1. **Vision Analysis**
   - Carefully review the attached images provided in the ongoing context.
   - Identify the primary layout structure, typography hierarchy, colors, and interactive elements (buttons, forms, navbars).
   - Check if any elements match existing components in the workspace or `DESIGN_SYSTEM.md`.

2. **Scaffold the Prototype Components**
   - Create the necessary React components, using the workspace's styling framework (e.g. Tailwind CSS).
   - Structure the components thoughtfully (e.g., extracting a `Button` or `Card` if reused frequently in the mockup).
   - If generating variations (e.g., Variant A vs Variant B), ensure they are placed in suitably named directories or files to prevent collisions.

3. **Wire Up the Example Page**
   - Integrate the created components into a functioning page.
   - Add placeholder data or interactions if necessary so the prototype feels "alive" when tested in the browser.

4. **Review & Iterate**
   - Conclude by providing a short summary of how the code matches the visual design.
   - Ask the user if they'd like to experiment with a different variation or proceed with refining this one via the `impeccable_refinement` workflow.

// turbo-all
