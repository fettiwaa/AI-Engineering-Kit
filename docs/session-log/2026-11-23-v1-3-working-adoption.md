# Session Log: 2026-11-23 — V1.3 Working Adoption

- **Session Goal:** Audit the whole kit and fix everything found.

## Completed Work

- Audit: the per-agent adoption instructions could not work (unsupported `@import` / `@file`
  syntax, wrong file names for Codex, Cursor, Copilot, Gemini CLI, Aider, Windsurf, and a
  `CLAUDE.md` that listed paths as plain text). The validator failed outside the repo root.
  Docs had a hard-coded personal path, a duplicated `[Unreleased]` changelog section, a broken
  section reference, and contradictory precedence descriptions.
- Verified each tool's current instruction-file behavior against vendor docs.
- Added `scripts/adopt-kit.ps1` and `core/ESSENTIALS.md` (decision D2).
- Rewrote all adapters and framework packs; rewrote and extended the validator; added CI.
- Rewrote README, USAGE, INTEGRATION, ARCHITECTURE, PROJECT-DOCUMENTATION, CONTRIBUTING,
  CHANGELOG; updated memory files.

## Files Changed

- See the V1.3 entry in `docs/activity-log.md`.

## Issues Encountered

- Windows PowerShell 5.1 reads BOM-less `.ps1` files as ANSI, which corrupted a literal `§`
  in a validator regex. Fixed by building the character with `[char]0xA7`; scripts are now
  ASCII-only (documented in the root `AGENTS.md`).
- .NET file APIs on Linux do not translate `\`; script paths now use `/`.

## Architecture Decisions

- D2: distribute by vendoring into `.ai-kit/` plus a managed `AGENTS.md` block and shims.

## Next Steps

- Push to a GitHub remote so CI runs.
- Re-adopt any project set up with the V1.2 instructions.
- Technical debt T5 (adapter drift) and T6 (thin prompts/checklists).

## Suggested Next Prompt

> "Deepen every file in `prompts/` and `checklists/` with explicit inputs, outputs, and
> checkable items, following the style of the V1.3 framework packs."
