# OpenAI Codex Adapter

> Configures OpenAI Codex (via `codex` CLI / GitHub app). Canonical rules: see
> `AI-Engineering-Kit/core/AGENTS.md`.

## 1. Configuration File

Codex uses `codex.md` or YAML config at `.codex/config.yaml`.

## 2. Loading Order

1. Global config (`~/.codex/config.yaml`).
2. Project config (`.codex/config.yaml`).
3. Project `codex.md` (project-level instructions take precedence).

## 3. Directive

To adopt this kit, create `codex.md` at your project root that begins with:

```markdown
# Codex Instructions

@file ../AI-Engineering-Kit/core/AGENTS.md
```

## 4. Notes

- This adapter is minimal; do not duplicate core rules.
- When an override is required for tool-specific behavior, cite the canonical rule.

See `core/SECURITY.md` — Codex must never read `.env` unless explicitly instructed.
