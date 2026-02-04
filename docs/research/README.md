# Research Documentation

This directory is for storing user research, competitive analysis, and other research artifacts.

## Structure

- **User Interviews:** Place interview transcripts and notes here
- **Surveys:** Survey results and analysis
- **Competitive Analysis:** Research on competitors and market positioning
- **User Personas:** Detailed persona documents
- **Pain Points:** Documented user pain points and problems
- **Insights:** Synthesized research insights and findings

## Best Practices

- Date all documents (YYYY-MM-DD format)
- Include research methodology
- Link to source materials
- Tag by user segment or persona
- Keep insights actionable and specific

## Example Files

- `user-interview-2024-01-15.md`
- `survey-results-q1-2024.md`
- `competitive-analysis-2024.md`
- `user-personas.md`
- `pain-points-synthesis.md`

---

## File conventions (sync to project context)

These conventions let you sync research into `.cursor/rules/project-context.mdc` via the **sync-research-to-context** command so the AI has up-to-date personas and pain points.

### user-personas.md

Use one heading per persona, then Role / Goals / Pain points. The sync maps this into the project context **User Personas** section.

```markdown
## [Persona Name]

- **Role:** [One line]
- **Goals:** [What they want to achieve]
- **Pain Points:** [What frustrates them or blocks them]
```

You can use `###` for persona names if you prefer. Multiple personas = multiple sections. Add any extra bullets (e.g. context, quote); the sync will preserve them.

### pain-points-synthesis.md

Optional. Use a list of pain points (global or per segment). The sync can merge these into persona **Pain Points** or keep them as a short summary in project context. Structure is flexible (headings, bullets, or paragraphs).

### Key terminology

If you have a research file that defines domain terms (e.g. `key-terms.md` or a section in an insights doc), use **Term:** definition. The sync can update the **Key Terminology** section in project context when present.

