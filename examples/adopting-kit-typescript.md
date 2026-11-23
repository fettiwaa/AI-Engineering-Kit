# Example: Adopting the Kit in a TypeScript Service (Kilo Code + Cursor)

A Node.js + TypeScript API whose team uses Kilo Code and Cursor. Both read `AGENTS.md`
directly, so no shims are needed.

## Command

```powershell
cd my-service
& "$KIT/scripts/adopt-kit.ps1" -Packs typescript,nodejs,express,prisma -WithMemory
```

## Result

```
my-service/
├── AGENTS.md            # managed block (ESSENTIALS + 4 packs) + project section
├── .ai-kit/             # vendored kit v1.3.0 (core, checklists, prompts, templates, 4 packs)
├── docs/
│   ├── activity-log.md
│   ├── decision-log.md
│   ├── roadmap.md
│   └── technical-debt.md
├── package.json
├── prisma/schema.prisma
└── src/
```

## Project Section

The team then fills in the section below the managed block:

```markdown
## Project-Specific Instructions

- Package manager: npm. Verify with `npm run typecheck && npm run lint && npm test`.
- Routes in `src/routes/`, services in `src/services/`, Prisma access only in `src/repositories/`.
- Local DB: `docker compose up db`. Never point tests at `DATABASE_URL` from `.env.production`.
```

## How the Layers Resolve

1. **Global**: each developer's Kilo/Cursor user rules ("ask before installing deps").
2. **Kit core**: the managed block; full modules in `.ai-kit/core/` on demand.
3. **Packs**: TypeScript, Node.js, Express, and Prisma conventions.
4. **Project**: the section above, which wins over everything except the Non-Negotiables.
