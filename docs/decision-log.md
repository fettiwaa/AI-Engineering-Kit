# Decision Log

> Architecture decisions, recorded for posterity. Future agents should read this before
> challenging established choices.
>
> See `templates/decision-log-entry.md` for the entry format.
> For heavier decisions, use the full ADR template at `templates/architecture-decision-record.md`.

<!-- format: date | title | status -->

## D1 — V1.1 Workflow Layer as Dedicated Modules

- **Date:** 2026-08-03
- **Status:** Accepted
- **Context:** `core/AGENTS.md` was becoming a catch-all for agent workflow guidance, risking rule
  duplication and reducing maintainability.
- **Decision:** Keep `AGENTS.md` concise as a hub; move workflow detail into dedicated
  `core/*.md` modules (PLANNING, REFACTORING, CODE_REVIEW, COMMIT_WORKFLOW, ENGINEERING_PRINCIPLES,
  AI_RESTRICTIONS) and reference them.
- **Alternatives considered:**
  - Inline everything into `AGENTS.md` — rejected (violates modularity; bloats the hub).
  - A single monolithic `WORKFLOW.md` — rejected (one responsibility per file).
- **Reason:** Modularity and single-responsibility reduce edit conflicts and make each topic
  discoverable.
- **Consequences:** More files to maintain, but each is small and focused. New contributors must
  follow the TOC links, which is acceptable.
