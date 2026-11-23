# Kilo Code Adapter

> How Kilo Code loads the kit. Canonical rules: `core/AGENTS.md`. This adapter adds no rules.

## 1. What Kilo Code Reads

| Scope | Location |
|-------|----------|
| Project | `AGENTS.md` at the workspace root (loaded automatically; `AGENT.md` also accepted) |
| Project rules | `.kilo/rules/` referenced from `kilo.jsonc`; legacy `.kilocode/rules/` still loads |
| Global | Your Kilo global profile (e.g. `~/.config/kilo/AGENTS.md` for current Kilo; the legacy extension used `~/.kilocode/rules/`) |

Kilo Code treats `AGENTS.md` as write-protected, so the agent will not edit it without asking.

## 2. Adopt

```powershell
& "$KIT/scripts/adopt-kit.ps1" -Project . -Packs typescript
```

No shim is needed.

## 3. Notes

- Keep the global profile for personal preferences only ("never read `.env`", "ask before
  installing dependencies"); the project's `AGENTS.md` overrides it.
- Mode-specific rules (e.g. a reviewer mode) can live in Kilo's rules directories and point at
  `.ai-kit/checklists/` or `.ai-kit/prompts/`.

Reference: <https://kilo.ai/docs/customize/agents-md>
