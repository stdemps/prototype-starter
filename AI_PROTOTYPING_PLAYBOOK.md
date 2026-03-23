# AI Prototyping Playbook: Zero to One

Welcome! This playbook is designed to help you leverage AI directly in your workflow, guiding you all the way from a rough idea, through Figma mockups, into a fully functional code prototype, and finally deploying it to live users.

By blending the strengths of **Claude Code** and **AntiGravity**, you can build real, testable products in a fraction of the time.

---

## 🎒 Pre-Flight Checklist (For IDE Beginners)

Before jumping in, let's make sure you're oriented in your code editor (Cursor / VS Code):

- **You need the Terminal:** The terminal is where you'll type commands to start your app or talk to Claude. Open it by going to **View > Terminal** or pressing `Cmd + J` (Mac) or `Ctrl + \`` (Windows).
- **Don't Panic on Red:** Development is messy. If your terminal outputs red error text, don't worry! Just copy the text, paste it to the AI, and say, "I got this error, help me fix it."
- **Make sure you've run Setup:** Ensure you've followed the initial install steps in [SETUP.md](./SETUP.md).

---

## 🛠️ The Toolchain

Your prototyping environment uses two primary tools, each with a specific superpower:

1. **Claude (CLI or Extension)**
   - **Best for:** Fast lookups, Q&A, and tapping into specific "Agent Personas".
   - **Your Choice:** You can run `claude` directly in your terminal if you prefer the speed of the CLI, **OR** you can install the **Claude Extension** in your code editor (like VS Code) for a more visual, chat-like interface. Both work perfectly!
   - **How it works:** Both methods load the files in `.claude/`—giving you instant access to conversational agents (like `/designer` or `@designer`) and "impeccable" UI commands (`/audit`, `/polish`).
2. **AntiGravity (Autonomous Agent)**
   - **Best for:** Heavy lifting, visual processing (image-to-code), and end-to-end autonomous workflows without needing your constant supervision.
   - **Where to find it:** AntiGravity runs in the primary AI Chat panel in your IDE (e.g., Cursor's chat tab).
   - **How it works:** It uses `.agents/workflows/` to execute complex multi-step instructions (like scaffolding an entire feature from a Figma mockup).

---

## ⚡ Giving Claude Superpowers (Figma MCP)

Claude Code can be extended with "superpowers" via the Model Context Protocol (MCP). For a designer, the most powerful addition is the **Figma MCP**, which allows Claude to read design data, layout structures, and typography directly from your live Figma files, removing the friction of exporting screenshots.

### Setting up the Figma MCP

1. Get a **Figma Personal Access Token** (Settings -> Personal access tokens).
2. Open your terminal and run the following command to install the Figma MCP server into Claude Code:
   ```bash
   claude mcp add figma npx -y @modelcontextprotocol/server-figma <YOUR_FIGMA_TOKEN>
   ```
3. Once running, you can paste Figma node URLs directly into Claude:
   > "Hey Claude, act as my `@designer` and extract the component hierarchy for this frame: `https://www.figma.com/file/...`"

---

## 🚀 The Lifecycle: Idea to Playable Prototype

Here is your step-by-step guide to shipping a prototype to real users.

### Phase 1: Ideation (The Product Partner)

Before pushing pixels, use Claude Code to pressure-test your ideas. Claude comes pre-loaded with specific "Skills" (Personas) to help you.

- run `/pm` to discuss feature scope, prioritization, and user journeys.
- run `/user-researcher` to validate your assumptions and outline a testing plan.
- _Tip:_ If you write down your ideas in a PRD document (e.g., `docs/prds/idea.md`), you can use `/setup-project-context docs/prds/idea.md` to load it into the AI's long-term memory.

### Phase 2: Visual Design (Figma)

Take the insights from Phase 1 and build your mockups in Figma. Don't worry about CSS or React yet—just focus on the layout, spacing, and user experience.

### Phase 3: Code Prototyping

When you are ready to see your Figma designs in code, use the **Figma MCP** to bypass image exports entirely and turn your live designs directly into React components.

1. Ensure the Figma MCP is running (as set up in the previous section).
2. Open Claude Code and point it directly to your Figma file:
   > "Hey Claude, act as my `@designer` and turn this Figma frame into a full React page (or component): `https://figma.com/file/...`. Please use our `DESIGN_SYSTEM.md`."
3. Claude will instantly read the exact auto-layouts, color tokens, and typography from Figma and scaffold your full page or code prototype.
4. **View your prototype:** Open your IDE's terminal (`Cmd + J`), type `npm run dev`, hit Enter, and then open [localhost:3000](http://localhost:3000) in your web browser to see your code live!

> **🖼️ Pro-Tip on Assets:** While the MCP reads layouts and text perfectly, it won't automatically download your high-res photos or custom SVG icons. Manually export those assets from Figma, place them into your `public/` folder, and let Claude know they are there!

_(Alternatively, if you only have screenshots, you can ask AntiGravity to run the `/slash-command prototype_from_mockup` workflow on the attached images)._

### Phase 4: Making it Real (Firebase Data)

A prototype isn't testable if it doesn't save data! To make your app functional, we use **Google Firebase** for Database (Firestore) and Authentication.

1. Go to [Firebase Console](https://console.firebase.google.com/) and create a new project.
2. Enable **Firestore Database** (you may start in **Test Mode** for local spikes only) and **Authentication** (Email/Password).
3. Grab your Firebase Config keys from the project settings.

> **Security:** Firestore Test Mode uses **open read/write rules for a limited time**. Use it only on throwaway projects or local experiments. Before any deploy or real users, **replace rules with least-privilege security rules** (and consider [App Check](https://firebase.google.com/docs/app-check)). Never ship production with default test rules. See [Firestore security rules](https://firebase.google.com/docs/firestore/security/get-started). 4. In your code editor, duplicate the file named `.env.example`, rename the copy to `.env.local`, and paste your keys into that new file. 5. Ask AntiGravity or Claude Code to hook it up:
> "Hey Claude, use the `/engineer` skill. Hook up my 'Variant A' prototype form so it saves user submissions directly to Firestore."

### Phase 5: Experimentation & Refinement

Your goal is to experiment! Ask AntiGravity to spin up a "Variant B". Once you settle on a layout, refine it using the autonomous polish workflow:

> "Hey AntiGravity, run the `/slash-command impeccable_refinement` workflow on Variant A."
> _(AntiGravity will audit accessibility, critique the UX, fix spacing, and add subtle animations)._

### Phase 5.5: Security & Best Practices

Before pushing your code to live users, it's critical to ensure it is secure and performant. You can use Claude's built-in skills to audit your prototype.

1. Open Claude Code and run:
   > "Hey Claude, please run the `/harden` command and apply `/vercel-react-best-practices` to my new pages and components."
2. Claude will automatically review your forms for proper validation, ensure any database queries are secured, and optimize your React code for Vercel.

### Phase 5.9: Saving Your Work (Push to GitHub)

Deployment tools like Vercel need your code to be safely stored on GitHub. If you don't know Git commands, let the AI do it for you:

1. Open your terminal or AI Chat.
2. Say: _"Hey Claude (or AntiGravity), please save my work, commit all my recent changes, and push them to GitHub."_

### Phase 6: Testing on Users (Vercel Deployment)

To test your prototype, you need a live URL to text to your users. **Vercel** is the easiest way to deploy Next.js/React apps.

1. Create a free account on [Vercel.com](https://vercel.com).
2. Connect your GitHub repository (where this workspace lives).
3. Import the repository in the Vercel dashboard.
4. **Important:** Add your Firebase environment variables (`NEXT_PUBLIC_FIREBASE_API_KEY`, etc.) in the Vercel Environment Variables settings.
5. Click **Deploy**. Vercel will give you a live URL (e.g., `my-prototype.vercel.app`) that updates automatically every time you push code to GitHub.

### Phase 7: The Feedback Loop (Iterating)

Deploying your prototype isn't the end—it's the beginning! Once you've tested the app with your users, it's time to close the loop on your sprint.

1. Gather all your user feedback, quotes, or pain points.
2. Open Claude Code and use the `/user-researcher` or `/pm` persona to synthesize the messy data:
   > "Hey Claude, act as my `/user-researcher`. Here are the messy notes from 3 user tests on Variant A. Can you synthesize the top friction points and suggest solutions?"
3. With those insights, you can either jump back into Figma (Phase 2) to rethink the layout, or dive straight back into Code (Phase 5) to implement the fixes!

---

## 💡 Quick Reference: Claude Code Snippets

When you just need a quick assist rather than a full workflow, drop into Claude Code in your terminal:

- **Quick UI Review:** `/critique components/Button.tsx`
- **Fix Mobile:** `/adapt components/Navbar.tsx`
- **Add subtle animation:** `/animate components/Modal.tsx`
- **Ask a Design Question:** `/designer What's the best pattern for a complex multi-step form on mobile?`
