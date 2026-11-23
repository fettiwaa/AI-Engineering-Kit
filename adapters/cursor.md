# Cursor Adapter

> How Cursor loads the kit. Canonical rules: `core/AGENTS.md`. This adapter adds no rules.

## 1. What Cursor Reads

| Scope | Location |
|-------|----------|
| User (all projects) | Cursor Settings > Rules > User Rules |
| Project | `AGENTS.md` at the repo root (plain Markdown, always applied) |
| Project (scoped) | `.cursor/rules/*.mdc` with `description` / `globs` / `alwaysApply` frontmatter |
| Legacy | `.cursorrules` (deprecated; avoid for new projects) |

Cursor does not follow `@import`-style lines inside rule files.

## 2. Adopt

```powershell
& "$KIT/scripts/adopt-kit.ps1" -Project . -Packs typescript
```

No shim is needed: Cursor applies the generated `AGENTS.md`.

## 3. Optional: Scoped Pack Rules

To apply a pack only to matching files, add a project rule such as
`.cursor/rules/react.mdc`:

```markdown
---
description: React conventions from the AI Engineering Kit
globs: src/**/*.tsx
alwaysApply: false
---
Follow `.ai-kit/framework-packs/react.md`.
```

Reference: <https://docs.cursor.com/context/rules>
