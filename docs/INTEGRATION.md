# Integration Guide

A checklist for wiring the AI Engineering Kit into a project. Commands and options are in
[`USAGE.md`](./USAGE.md).

## 1. Choose Packs

Pick the framework packs matching the stack (see `framework-packs/`). Packs stack: a Next.js
app typically uses `typescript,react,nextjs,tailwind` plus its ORM pack.

## 2. Run the Adopt Script

```powershell
& "$KIT/scripts/adopt-kit.ps1" -Project <project> -Agents <your-agents> -Packs <packs> -WithMemory
```

## 3. Add Project Rules

Below the managed block in `AGENTS.md`, record the project's build, test, and lint commands
and any conventions the packs do not cover. Agents rely on these to verify their work.

## 4. Commit

Commit `AGENTS.md`, `.ai-kit/`, the shims, and `docs/` memory files on a feature branch.

## 5. Validate

- [ ] `AGENTS.md` contains exactly one `ai-kit:start` / `ai-kit:end` block.
- [ ] Each agent the team uses has its entry file (see the "What gets written" table in `USAGE.md`).
- [ ] The project section lists real build/test/lint commands.
- [ ] The agent can recite the Non-Negotiables when asked.
- [ ] No rules are duplicated between the managed block and the project section.

## Related Guides

- [`USAGE.md`](./USAGE.md): parameters, updating, global profiles.
- [`ARCHITECTURE.md`](./ARCHITECTURE.md): why the kit is distributed this way.
- [`PROJECT-DOCUMENTATION.md`](./PROJECT-DOCUMENTATION.md): full kit documentation.
