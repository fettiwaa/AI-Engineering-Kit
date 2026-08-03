# Cursor Adapter

> Configures Cursor. Canonical rules: see `AI-Engineering-Kit/core/AGENTS.md`.

## 1. Instruction File

Cursor reads `.cursorrules` (project) and user-level Cursor rules.

## 2. Loading Order

1. User-level rules (lowest precedence).
2. `.cursorrules` at project root (highest precedence).

## 3. Directive

To adopt this kit, place a `.cursorrules` at your project root that references the canonical core.
Cursor supports Markdown imports, so:

```markdown
# Cursor Rules

See AI-Engineering-Kit/core/AGENTS.md for the canonical rule set.
@import ../AI-Engineering-Kit/core/AGENTS.md
```

## 4. Notes

- This adapter does **not** duplicate core rules.
- Overrides must cite the canonical rule path.

See `core/PROMPTING.md` §Context Engineering.
