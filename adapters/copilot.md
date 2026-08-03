# GitHub Copilot Adapter

> Configures GitHub Copilot (Copilot Chat / Copilot Agent mode). Canonical rules: see
> `AI-Engineering-Kit/core/AGENTS.md`.

## 1. Instruction File

Copilot reads `.github/Copilot-instructions.md` (repo) and user-configured global instructions.

## 2. Loading Order

1. User global instructions (lowest precedence).
2. `.github/Copilot-instructions.md` (project precedence).
3. Inline chat instructions (highest — turn-level).

## 3. Directive

To adopt this kit, create `.github/Copilot-instructions.md` at your repository root:

```markdown
# Copilot Instructions

The canonical rule set for this project is AI-Engineering-Kit/core/AGENTS.md.
Reference it and add project-specific overrides below.
```

## 4. Notes

- Copilot does not support automatic file imports; rules must be inlined or linked.
- Keep this file minimal: point to the canonical core and state project-specific overrides only.

See `core/SECURITY.md` §Non-Negotiables.
