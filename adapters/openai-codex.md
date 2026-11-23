# OpenAI Codex Adapter

> How OpenAI Codex (CLI, IDE extension, cloud) loads the kit. Canonical rules:
> `core/AGENTS.md`. This adapter adds no rules.

## 1. What Codex Reads

Codex reads `AGENTS.md` natively and merges every file it finds:

1. Global: `~/.codex/AGENTS.md`.
2. Each directory from the repo root down to the working directory (closer files win).

Codex does not resolve imports, so the rules must be inside `AGENTS.md` itself, which is
exactly what `adopt-kit.ps1` produces.

## 2. Adopt

```powershell
& "$KIT/scripts/adopt-kit.ps1" -Project . -Packs typescript
```

No shim is needed.

## 3. Notes

- Codex caps the combined size of project instruction files (32 KiB by default). The adopt
  script warns when the managed block exceeds 24 KB; select fewer packs if it does.
- Ask Codex to "summarize your current instructions" to confirm the rules loaded.

Reference: <https://agents.md>
