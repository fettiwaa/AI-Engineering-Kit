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

## 2026-11-23 — V1.3: Working Adoption

- **Summary:** Replaced the non-functional per-agent adoption instructions with
  `scripts/adopt-kit.ps1` (vendors the kit into `.ai-kit/`, writes a managed `AGENTS.md` block,
  writes shims for Claude Code, Gemini CLI, Copilot, Aider). Added `core/ESSENTIALS.md`.
  Rewrote all adapters and framework packs, hardened the validator, added CI.
- **Reason:** An audit found the documented `@import [..](..)` / `@file` syntax is not supported
  by any agent and several instruction file names were wrong, so adopting projects never loaded
  the rules. The validator also failed outside the repo root.
- **Files changed:** new `core/ESSENTIALS.md`, `scripts/adopt-kit.ps1`,
  `.github/workflows/validate.yml`, `CLAUDE.md`, `examples/adopting-kit-nextjs-claude.md`;
  rewritten `adapters/*`, `framework-packs/*`, `scripts/validate-kit.ps1`, `README.md`,
  `docs/USAGE.md`, `docs/INTEGRATION.md`, `docs/ARCHITECTURE.md`,
  `docs/PROJECT-DOCUMENTATION.md`, `CONTRIBUTING.md`, `CHANGELOG.md`, `AGENTS.md`; edited
  `core/AGENTS.md`, `core/SECURITY.md`, `core/ENGINEERING_PRINCIPLES.md`, docs memory files.
- **Breaking changes:** Adoption method changed. Projects set up with the V1.2 instructions
  should delete their old `codex.md` / `.cursorrules` / `.windsurfrc` / `.aider.md` /
  `.gemini/GEMINI.md` / `.github/Copilot-instructions.md` and run `adopt-kit.ps1`.
- **Testing:** `validate-kit.ps1` passes from inside and outside the repo; `adopt-kit.ps1`
  run twice against a scratch project (second run reports no changes, existing content kept).
- **Remaining TODO:** see `technical-debt.md` T4–T6.
- **Suggested commit:** `feat: add adopt-kit script, ESSENTIALS digest, and working adapters`

## 2026-11-23 — V1.4: Prompt Library and Claude Code Skills

- **Summary:** Merged an external Claude prompt library into the kit and made 15 prompts
  installable as Claude Code skills via `scripts/install-skills.ps1` (and
  `adopt-kit.ps1 -Skills`). Folded the library's safety and agent-practice rules into core.
- **Reason:** The kit had prompts agents could not discover or invoke on their own; the
  library had stronger versions of several prompts plus new ones (investigation, handoff,
  learning/career) and rules the kit lacked (prompt injection, external actions).
- **Files changed:** new `scripts/install-skills.ps1`, `prompts/README.md`, 9 new prompts,
  `templates/project-instructions.md`, `docs/references.md`; rewrote 7 prompts; edited
  `core/SECURITY.md`, `core/AI_RESTRICTIONS.md`, `core/AI_WORKFLOW.md`,
  `core/DOCUMENTATION.md`, `core/ESSENTIALS.md`, `core/AGENTS.md`, `scripts/adopt-kit.ps1`,
  `scripts/validate-kit.ps1`, CI, README, USAGE, Claude Code adapter.
- **Breaking changes:** None.
- **Testing:** validator passes (15 skills); installer run twice on a scratch project (second
  run unchanged); CI smoke test reproduced locally on PowerShell 5.1, including a check that
  the idempotency assertion detects real changes.
- **Remaining TODO:** confirm the skills in a live Claude Code session; T5, T6.
- **Suggested commit:** `feat: add prompt library and Claude Code skills installer`
