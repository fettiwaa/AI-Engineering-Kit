# Technical Debt

> Future improvements and known limitations, tracked so they are not rediscovered each session.
>
> See `templates/technical-debt-item.md` for the item format.

## Open

### T3 — No automated release process

- **Priority:** Low
- **Introduced:** 2026-08-03 (V1.0)
- **Details:** Releases are tracked in `CHANGELOG.md` but tagging and publishing are manual.
- **Suggested fix:** A GitHub Actions workflow that tags `vX.Y.Z` from the top CHANGELOG entry.

### T4 — No POSIX-shell adopt script

- **Priority:** Low
- **Introduced:** 2026-11-23 (V1.3)
- **Details:** `adopt-kit.ps1` needs `pwsh` on macOS/Linux. A `sh` port would remove that
  dependency but would duplicate the logic.
- **Suggested fix:** Only if demand appears; otherwise keep one implementation.

### T5 — Adapter facts drift as tools change

- **Priority:** Medium
- **Introduced:** 2026-11-23 (V1.3)
- **Details:** Each adapter documents a third-party tool's instruction-file behavior, verified
  against vendor docs in November 2026. Tools change these conventions often.
- **Suggested fix:** Re-verify each adapter against its linked reference every release; add a
  "verified on" date if drift becomes a problem.

### T6 — Some prompts and the checklists are still thin

- **Priority:** Low
- **Introduced:** 2026-08-03 (V1.0)
- **Details:** V1.4 rewrote most prompts, but `bug-fixing`, `feature-development`,
  `architecture-review`, `database-migration`, and `performance-optimization` keep the older
  fill-in style, and `checklists/` are short generic lists.
- **Suggested fix:** Give those five prompts the V1.4 layout (Role, Input, Process, Rules,
  Output), consider making them skills, and give each checklist concrete, checkable items.

### T7 — Skills not yet exercised in a live session

- **Priority:** Medium
- **Introduced:** 2026-11-23 (V1.4)
- **Details:** Generated `SKILL.md` files are validated structurally, but whether each
  description triggers at the right time has only been reasoned about, not observed.
- **Suggested fix:** Install with `-Scope user`, use each auto skill on a real task, and tune
  descriptions that over- or under-trigger.

## Resolved

- **T1 — Framework packs are skeletal:** resolved in V1.3; every pack now has concrete,
  verifiable rules and a "Verify Before Finishing" section.
- **T2 — `validate-kit.ps1` is link-unaware:** resolved in V1.3; the validator checks relative
  links, section references, module indexing, citations, and runs in CI.
