# Template: Project Instructions

> Starting point for the project-specific section of `AGENTS.md` (below the kit's managed
> block), or for a standalone `CLAUDE.md` in a project that does not use the kit. Replace the
> placeholders, delete sections that do not apply, and keep it short: link to detailed docs
> instead of copying them. Agents rely on the commands here to verify their work.

## Project

- Name: [PROJECT NAME]
- Purpose: [ONE OR TWO SENTENCES]
- Main stack: [LANGUAGES, FRAMEWORKS, DATABASE]

## Repository Map

- `[PATH]`: [RESPONSIBILITY]
- `[PATH]`: [RESPONSIBILITY]

## Development Commands

- Install: `[COMMAND]`
- Run locally: `[COMMAND]`
- Test: `[COMMAND]`
- Lint: `[COMMAND]`
- Type check: `[COMMAND]`
- Build: `[COMMAND]`

## Conventions

- Follow existing patterns before introducing new ones.
- [PROJECT-SPECIFIC STYLE OR ARCHITECTURE RULES]

## Safety

<!-- Projects using the kit already get these from the managed block; keep this section only
     for a standalone file, or for rules stricter than the kit's. -->

- Never expose secrets or commit `.env` files.
- Do not push, deploy, or perform destructive operations without explicit approval.
- Ask before major architectural changes.
- Run relevant checks and report actual results.

## Definition of Done

- Acceptance criteria are met.
- Relevant tests and checks have been run, and their real results reported.
- Documentation is updated where needed.
- Known limitations are disclosed.
