# AGENTS.md (AI Engineering Kit)

This repository **is** the AI Engineering Kit: documentation, templates, rules, and two
PowerShell scripts. There is no application code.

## Rules for Working Here

- Follow [core/ESSENTIALS.md](core/ESSENTIALS.md); the full rules are indexed in
  [core/AGENTS.md](core/AGENTS.md).
- Before adding a module, pack, or adapter, or changing how the kit is distributed, read
  [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md) and propose the change first
  (`core/PLANNING.md`). Record decisions in `docs/decision-log.md`.
- Define each rule once. Packs and adapters cite core modules; they never copy them.
- Keep `core/ESSENTIALS.md` under its 6 KB budget and each pack under about 2 KB: both are
  inlined into every adopting project.
- Prompts use the Role / Input / Process / Rules / Output layout (imported prompts may keep
  their original layout) and must read correctly as skill instructions. Skill frontmatter allows only `skill`, `description`, `manual-only`.
- Scripts must run on Windows PowerShell 5.1 and pwsh 7 (Linux/macOS): no PS7-only syntax, use
  `/` in paths, and keep `.ps1` files ASCII-only.

## Verify Before Finishing

```powershell
./scripts/validate-kit.ps1
```

For script changes, also run `scripts/adopt-kit.ps1` against a scratch directory twice and
confirm the second run reports no changes.

## Record the Work

Update `CHANGELOG.md` (`[Unreleased]`), and for significant work `docs/activity-log.md` and a
`docs/session-log/` entry.
