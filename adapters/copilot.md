# GitHub Copilot Adapter

> How GitHub Copilot (chat, agent mode, coding agent, CLI) loads the kit. Canonical rules:
> `core/AGENTS.md`. This adapter adds no rules.

## 1. What Copilot Reads

| File | Scope |
|------|-------|
| `.github/copilot-instructions.md` | Repository-wide; the primary file in every Copilot surface. |
| `.github/instructions/*.instructions.md` | Path-specific (`applyTo` glob frontmatter). |
| `AGENTS.md` (nearest in the tree wins) | Agent instructions; also `CLAUDE.md` / `GEMINI.md`. |

Support differs by surface (VS Code, github.com, CLI, code review); `AGENTS.md` may need to be
enabled in VS Code settings. Writing both files covers every surface.

## 2. Adopt

```powershell
& "$KIT/scripts/adopt-kit.ps1" -Project . -Agents copilot -Packs typescript
```

This writes the rules into `AGENTS.md` and a `.github/copilot-instructions.md` shim that
points Copilot at it. Copilot does not resolve imports, so keep project-specific Copilot
guidance short and in that file, below the managed block.

## 3. Notes

- The filename is lowercase: `.github/copilot-instructions.md`.
- Use path-specific `.instructions.md` files to apply a pack only where it is relevant.

Reference: <https://docs.github.com/en/copilot/reference/custom-instructions-support>
