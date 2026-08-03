# Kilo Adapter

> Configures Kilo Code. Canonical rules: see `AI-Engineering-Kit/core/AGENTS.md`.

## 1. Instruction Files

Kilo supports:

- Global: `%USERPROFILE%\.config\kilo\AGENTS.md` (Windows) or `~/.config/kilo/AGENTS.md` (Unix).
- Project: `AGENTS.md` at the workspace root.
- Per-directory: `AGENTS.md` in any subdirectory.

## 2. Loading Order

1. Global profile (lowest precedence).
2. Project `AGENTS.md` (overrides global).
3. Subdirectory `AGENTS.md` (overrides project).

## 3. Directive

To adopt this kit, the project root must contain an `AGENTS.md` that imports the canonical core:

```markdown
# AGENTS.md

@import ../AI-Engineering-Kit/core/AGENTS.md

# Project-specific overrides
```

## 4. Notes

- Project-level instructions always take precedence over global.
- The global profile should hold personal preferences only (e.g. "never read .env",
  "ask before installing dependencies").

See `core/AI_WORKFLOW.md` for agent workflow guidance.
