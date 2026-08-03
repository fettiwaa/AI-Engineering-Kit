# Claude Code Adapter

> Configures Claude Code. Canonical rules: see `AI-Engineering-Kit/core/AGENTS.md`.

## 1. File Format

Claude Code reads `CLAUDE.md` (project) and `~/.claude/CLAUDE.md` (global).

## 2. Loading Order

1. `~/.claude/CLAUDE.md` (lowest precedence).
2. `CLAUDE.md` at project root (highest precedence).

## 3. Directive

To adopt this kit, create a `CLAUDE.md` at your project root that begins with:

```markdown
# Claude Code Instructions

@file ../AI-Engineering-Kit/core/AGENTS.md
```

## 4. Notes

- This adapter does **not** duplicate core rules; it only points to them.
- Overrides must cite the canonical rule path.
- Prefer including `framework-packs/*.md` as needed.

See `core/PROMPTING.md` §Context Engineering for token-minimization guidance.
