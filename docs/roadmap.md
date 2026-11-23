# Roadmap

> Planned capabilities, ordered by priority. Each item links to its tracking issue/ADR when
> available.
>
> See `templates/roadmap-item.md` for the item format.

## Done in V1.3

- [x] Flesh out stack-specific rules in every `framework-packs/*.md`.
- [x] Link-integrity checks in `scripts/validate-kit.ps1`, run in CI.
- [x] `CONTRIBUTING.md` points contributors at the activity/decision logs.
- [x] One-command adoption (`scripts/adopt-kit.ps1`) with working per-agent wiring.

## Done in V1.4

- [x] Claude Code skills generated from prompts (`scripts/install-skills.ps1`).
- [x] Prompt library merged in: investigation, handoff, architecture decisions, learning and
      career prompts.

## Near Term (V1.5)

- [ ] Finish the remaining older prompts and deepen `checklists/` (technical debt T6).
- [ ] Tune skill descriptions after real use (T7).
- [ ] Worked examples for a Python (FastAPI) and a mobile (Flutter) project.
- [ ] `adopt-kit.ps1 -Check`: report whether a project's `.ai-kit/VERSION` is behind the kit.

## Medium Term

- [ ] Optional per-tool extras generated from packs: Cursor `.mdc` and Copilot
      `.instructions.md` files scoped by glob, so packs load only for matching files.
- [ ] Generate the equivalent of skills for other tools that support reusable commands
      (verify each tool's current format first).
- [ ] Publish the kit as a GitHub template repository with tagged releases (T3).

## Long Term

- [ ] Translate canonical docs (see `core/DOCUMENTATION.md` §Localization).
- [ ] Machine-readable pack metadata (parents, applicable globs) to drive the adopt script.
