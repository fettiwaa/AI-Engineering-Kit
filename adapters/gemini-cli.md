# Gemini CLI Adapter

> Configures Google Gemini CLI. Canonical rules: see `AI-Engineering-Kit/core/AGENTS.md`.

## 1. Instruction File

Gemini CLI reads `.gemini/GEMINI.md` (project) and a global user file.

## 2. Loading Order

1. Global user instructions (lowest precedence).
2. `.gemini/GEMINI.md` (project precedence).

## 3. Directive

To adopt this kit, create `.gemini/GEMINI.md` at your project root:

```markdown
# Gemini CLI Instructions

Reference the canonical rule set: AI-Engineering-Kit/core/AGENTS.md
```

## 4. Notes

- This adapter is minimal; do not duplicate core rules.
- Gemini CLI respects `@` includes in Markdown; use them to pull in framework packs.

See `core/GIT.md` and `core/SECURITY.md`.
