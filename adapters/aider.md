# Aider Adapter

> Configures Aider. Canonical rules: see `AI-Engineering-Kit/core/AGENTS.md`.

## 1. Instruction File

Aider reads `.aider.md` (project) by default, specified via `--instructions`.

## 2. Loading Order

1. Command-line `--instructions` (highest precedence for a given session).
2. `.aider.md` in the project root.

## 3. Directive

To adopt this kit, create `.aider.md` at your project root:

```markdown
# Aider Instructions

The canonical rule set is AI-Engineering-Kit/core/AGENTS.md — reference it, do not duplicate.
```

## 4. Notes

- Aider in-editor instructions are passed via `/aidir.conf` or the instructions file.
- Keep this file focused on tool-specific concerns only.

See `core/PROMPTING.md`.
