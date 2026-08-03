# Activity Log

> Significant engineering work only. Do **not** record formatting, typos, generated files,
> dependency reinstalls, or whitespace-only changes.
>
> See `templates/activity-log-entry.md` for the entry format.

<!-- format: date | summary | files | breaking | tests | todo | commit -->

## 2026-08-03 — V1.1: Engineering Workflow Modules

- **Summary:** Extended the kit with an end-to-end agent engineering-workflow layer (planning,
  code review, refactoring, commit workflow, engineering principles, AI restrictions) and added a
  project-memory system (`docs/activity-log.md`, `decision-log.md`, `roadmap.md`,
  `technical-debt.md`, `session-log/`).
- **Reason:** The kit defined coding rules but not how AI agents work across a whole session.
  V1.1 closes that gap and records history so future agents can understand project context.
- **Files changed:** new `docs/`, `checklists/code-review.md`, 6 `core/*.md` modules, templates,
  edits to `core/AGENTS.md`, `core/CODING_STANDARDS.md`, `core/GIT.md`, `core/DOCUMENTATION.md`,
  `core/SECURITY.md`.
- **Breaking changes:** None (additive documentation toolkit).
- **Testing:** `scripts/validate-kit.ps1` passes; all `@import` links resolve.
- **Remaining TODO:** flesh out each framework pack with stack-specific rules; add worked
  examples under `examples/`.
- **Suggested commit:** `feat: add V1.1 engineering workflow and project-memory modules`

## 2026-08-03 — V1.2: Usage Guide

- **Summary:** Added `docs/USAGE.md` with copy-paste terminal commands (PowerShell + bash) for
  adopting the kit in a project as Kilo, Claude Code, Cursor, OpenAI Codex, Copilot, Gemini CLI,
  Aider, and Windsurf; linked from `README.md` and `docs/INTEGRATION.md`.
- **Reason:** Answer "how do I actually use this in another project" with concrete commands.
- **Files changed:** new `docs/USAGE.md`; edited `README.md`, `docs/INTEGRATION.md`,
  `docs/activity-log.md`.
- **Breaking changes:** None.
- **Testing:** Validator passes; new file references existing templates/paths.
- **Remaining TODO:** add per-agent worked examples under `examples/`.
- **Suggested commit:** `docs: add USAGE.md with per-agent adoption commands`
