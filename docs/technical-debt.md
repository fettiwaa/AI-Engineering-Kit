# Technical Debt

> Future improvements and known limitations, tracked so they are not rediscovered each session.
>
> See `templates/technical-debt-item.md` for the item format.

## T1 — Framework packs are skeletal

- **Priority:** Medium
- **Introduced:** 2026-08-03 (V1.0)
- **Details:** Each framework pack currently contains only high-level conventions. They lack
  deep stack-specific guidance (e.g. specific lint rules, build targets, testing conventions).
- **Suggested fix:** Populate each pack with 3-5 concrete, verifiable rules.

## T2 — `scripts/validate-kit.ps1` is link-unaware

- **Priority:** Low
- **Introduced:** 2026-08-03 (V1.0)
- **Details:** The validator only checks that `@import` targets in `core/AGENTS.md` exist. It does
  not verify intra-doc links or framework-pack references.
- **Suggested fix:** Add a Markdown link checker pass.

## T3 — No automated release process

- **Priority:** Low
- **Details:** Releases are tracked in `CHANGELOG.md` but publishing is manual.
- **Suggested fix:** Add a GitHub Actions release workflow + ADR.
