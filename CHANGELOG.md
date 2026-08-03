# Changelog

All notable changes to this project are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.1.0] - 2026-08-03

### Added

- Engineering-workflow layer extending the kit beyond coding rules:
  - `core/PLANNING.md` — planning workflow (stop-and-approve gate for architecture/API/DB/auth
    and deployment changes).
  - `core/REFACTORING.md` — refactoring rules and complexity warnings.
  - `core/CODE_REVIEW.md` — AI auto-review checklist for generated code.
  - `core/COMMIT_WORKFLOW.md` — structured, atomic, conventional-commit workflow.
  - `core/ENGINEERING_PRINCIPLES.md` — cross-cutting design and hygiene principles.
  - `core/AI_RESTRICTIONS.md` — explicit restrictions on what an AI agent may reveal or do.
- Project-memory system under `docs/`:
  - `activity-log.md`, `decision-log.md`, `roadmap.md`, `technical-debt.md`.
  - `session-log/` directory with a per-session template and seeded V1.1 entry.
- Templates for each log type (`templates/activity-log-entry.md`,
  `templates/decision-log-entry.md`, `templates/roadmap-item.md`,
  `templates/technical-debt-item.md`, `templates/session-log.md`).
- `checklists/code-review.md` — structured AI auto-review checklist.
- Seed entries in the activity, decision, roadmap, technical-debt, and session logs for V1.1.

### Changed

- `core/AGENTS.md` now imports and indexes the six new workflow modules; rule-category table
  updated to point at authoritative dedicated modules (Planning, Refactoring, Code Review,
  Commit Workflow, Engineering Principles, AI Restrictions, Project Memory).
- `core/AI_WORKFLOW.md` §Planning and §Code Reviews now defer to the dedicated modules.
- `core/CODING_STANDARDS.md` §Refactoring, `core/GIT.md` §Commits,
  `core/DOCUMENTATION.md`, and `core/SECURITY.md` reference the new modules.

## [Unreleased]

### Added

- (Reserved for future work.)
