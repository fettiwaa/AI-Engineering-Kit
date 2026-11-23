# Windsurf Adapter

> How Windsurf (Cascade) loads the kit. Canonical rules: `core/AGENTS.md`. This adapter adds
> no rules.

## 1. What Windsurf Reads

| Scope | Location |
|-------|----------|
| Global | Windsurf global rules (Settings > Cascade > Rules) |
| Project | `AGENTS.md` anywhere in the workspace (root = always on, subfolder = scoped there) |
| Project rules | `.windsurf/rules/*.md` with a trigger: always-on, model decision, glob, or manual |

`AGENTS.md` feeds the same rules engine as `.windsurf/rules/`. Windsurf does not resolve
imports between rule files.

## 2. Adopt

```powershell
& "$KIT/scripts/adopt-kit.ps1" -Project . -Packs typescript
```

No shim is needed.

## 3. Notes

- Windsurf limits how much rule text it applies; keep the managed block lean (select only the
  packs you need).
- For a pack that applies to some files only, add a glob-triggered rule in
  `.windsurf/rules/` that points at `.ai-kit/framework-packs/<pack>.md`.

Reference: <https://docs.windsurf.com/windsurf/cascade/agents-md>
