# AI Engineering Kit — Project Documentation & Guides

> Comprehensive documentation of what the AI Engineering Kit is, what was built (V1.0–V1.2),
and how to use it.

- **What it is** → [overview](#overview)
- **What was built** → [build history](#build-history-v10-v11-v12)
- **How the kit is organized** → [structure](#repository-structure)
- **How to adopt in a project** → [quick start](#quick-start-adopting-the-kit)
- **Per-agent adoption** → [docs/USAGE.md](./USAGE.md)
- **Global profile vs project rules** → [profiles](#profile-precedence)
- **Validation** → [validating-the-kit](#validating-the-kit)
- **Project memory & workflow** → [project-memory](#project-memory)

---

## Overview

The **AI Engineering Kit** is a reusable, **vendor-neutral**, modular engineering toolkit — not an
application. It codifies the standards, workflows, and guardrails that any AI coding agent should
follow across any software project.

It works with: **Claude Code, OpenAI Codex, Kilo Code, Cursor, GitHub Copilot, Gemini CLI, Aider,
Windsurf**, and future agents.

The kit's North Star is a single **canonical source of truth** (`core/AGENTS.md`) that every
adapter and framework pack **extends — never duplicates**.

---

## Build History (V1.0 → V1.1 → V1.2)

### V1.0 — Scaffold (commit `b5aaab7`)

- `README.md`, `LICENSE` (MIT), `CHANGELOG.md`, `CONTRIBUTING.md`
- `core/AGENTS.md` hub + 14 canonical rule modules (Security, Git, Coding Standards, Architecture,
  Database, API, Testing, Performance, Documentation, Accessibility, Error Handling, Dependencies,
  AI Workflow, Prompting).
- `adapters/` (8) and `framework-packs/` (20) — each minimal, each pointing back to the core.
- `prompts/` (12), `templates/` (9), `checklists/` (8), `examples/`, `scripts/validate-kit.ps1`.
- `docs/ARCHITECTURE.md` (the kit's engineering design).

### V1.1 — Engineering Workflow Layer (commit `a891fc5`)

Added an **agent workflow layer** so the kit defines *how* agents work, not just *what* to follow.

- **6 new core modules:** `PLANNING.md` (stop-and-approve gate for architecture/API/DB/auth/deploy
  changes), `REFACTORING.md` (read-first, split-don't-rewrite), `CODE_REVIEW.md` (AI auto-review
  checklist), `COMMIT_WORKFLOW.md` (atomic, conventional-commit authoring),
  `ENGINEERING_PRINCIPLES.md` (design/hygiene principles), `AI_RESTRICTIONS.md` (never-reveal/never-do).
- **Project-memory system** under `docs/`: `activity-log.md`, `decision-log.md`, `roadmap.md`,
  `technical-debt.md`, and `session-log/` — so future agents inherit context instead of
  rediscoving it.
- **Templates** for each log type; **`checklists/code-review.md`** (structured auto-review).
- `core/AGENTS.md` reindexed to point the rule-category table at the *dedicated* modules
  (no duplication); `AI_WORKFLOW.md`, `CODING_STANDARDS.md`, `GIT.md`, `DOCUMENTATION.md`, and
  `SECURITY.md` now defer to the new modules.

### V1.2 — Usage Guide (commit `f063463`)

- Added `docs/USAGE.md` with copy-paste terminal commands (PowerShell + bash) for adopting the kit
  in a new project as **each** supported agent. Linked from `README.md` and `docs/INTEGRATION.md`.

---

## Repository Structure

```
AI-Engineering-Kit/
├── README.md                    # Overview + consumption options
├── LICENSE                      # MIT
├── CHANGELOG.md                 # Keep-a-Changelog format
├── CONTRIBUTING.md              # How to contribute
├── .gitignore
├── AGENTS.md                    # Root project instructions (imports core)
├── core/
│   ├── AGENTS.md                # CANONICAL source of truth (hub)
│   ├── SECURITY.md
│   ├── GIT.md
│   ├── COMMIT_WORKFLOW.md
│   ├── CODING_STANDARDS.md
│   ├── REFACTORING.md
│   ├── ARCHITECTURE.md
│   ├── DATABASE.md
│   ├── API.md
│   ├── TESTING.md
│   ├── PERFORMANCE.md
│   ├── DOCUMENTATION.md
│   ├── ACCESSIBILITY.md
│   ├── ERROR_HANDLING.md
│   ├── DEPENDENCIES.md
│   ├── AI_WORKFLOW.md
│   ├── PLANNING.md
│   ├── CODE_REVIEW.md
│   ├── ENGINEERING_PRINCIPLES.md
│   ├── AI_RESTRICTIONS.md
│   └── PROMPTING.md
├── adapters/                    # 8 minimal per-vendor files
├── framework-packs/             # 20 stack-specific packs
├── prompts/                     # 12 reusable agent prompts
├── templates/                   # 9 file templates + 5 log-entry templates
├── checklists/                  # 9 gate checklists
├── examples/                    # Worked examples
├── scripts/                     # validate-kit.ps1
└── docs/
    ├── ARCHITECTURE.md          # kit's engineering design
    ├── INTEGRATION.md           # adoption walkthrough
    ├── USAGE.md                 # per-agent terminal commands
    ├── activity-log.md
    ├── decision-log.md
    ├── roadmap.md
    ├── technical-debt.md
    └── session-log/             # per-session notes
```

---

## Quick Start: Adopting the Kit

> Full per-agent copy-paste commands: see [`docs/USAGE.md`](./USAGE.md).

1. **Point the adapter at the canonical core.** Create the instruction file your agent expects at
   the project root, importing both the core and any framework packs. Example (Kilo / Cursor /
   Codex / Aider — all use `@import`):

   ```markdown
   @import [/abs/path/to/AI-Engineering-Kit/core/AGENTS.md](/abs/path/to/AI-Engineering-Kit/core/AGENTS.md)
   @import [/abs/path/to/AI-Engineering-Kit/framework-packs/typescript.md](/abs/path/to/AI-Engineering-Kit/framework-packs/typescript.md)
   ```

2. **Add more packs** as needed (e.g. `react.md`, `nextjs.md`, `prisma.md`).

3. **Done.** Launching your agent in that folder now follows the kit's rules.

### Why absolute `@import` paths?

Using an absolute path keeps every project's instruction file tiny while the **single canonical
source stays in one place** — edits to the kit propagate to all consumers instantly. Project rules
always override the imported core.

---

## Profile Precedence

```
Global user profile                (lowest)  e.g. %USERPROFILE%\.config\kilo\AGENTS.md
   ↓
Project instruction file                       e.g. AGENTS.md / CLAUDE.md / .cursorrules
   ↓
Active framework packs                                  e.g. typescript.md, react.md
   ↓
Vendor adapter (tool-specific concerns only)             (highest)
```

- **Global** = your personal prefs (never read `.env`, ask before installing deps, never auto-push).
- **Project** = how the AI should work *on that repository*.
- **Framework packs** = stack-specific conventions (additive).
- **Adapter** = only tool-specific directives (file format, comment syntax).

> Project-level instructions always take precedence over global.

---

## Validating the Kit

From anywhere, validate that all internal `@import` links resolve and the expected counts are present:

```powershell
# Windows PowerShell
powershell -ExecutionPolicy Bypass -File <path-to>\AI-Engineering-Kit\scripts\validate-kit.ps1

# macOS / Linux (requires pwsh)
pwsh -File /path/to/AI-Engineering-Kit/scripts/validate-kit.ps1
```

Expected output:

```
All core module imports resolve.
Framework packs: 20 | Adapters: 8
```

---

## Non-Negotiable Invariants (Always Enforced)

These never change, across every layer:

- **Never** read `.env` unless explicitly instructed. **Never** expose secrets/keys/tokens/creds.
  **Never** auto-commit/push/rebase/reset. **Never** run destructive SQL (`DROP DATABASE/TABLE`);
  `DELETE`/`UPDATE` only with `WHERE`. **Never** modify prod data/infra. **Always** confirm before
  irreversible actions.

Full policy lives in `core/SECURITY.md`, `core/AI_RESTRICTIONS.md`, `core/GIT.md`,
`core/COMMIT_WORKFLOW.md`, `core/DATABASE.md`.

---

## Project Memory

The kit treats `docs/` as long-term memory. After each session, append an entry to
`docs/activity-log.md` (template: `templates/activity-log-entry.md`) so the next agent can
understand what changed and why. Related memory files:

- `docs/decision-log.md` — architecture decisions (D1–Dn).
- `docs/roadmap.md` — planned features.
- `docs/technical-debt.md` — future improvements (T1–Tn).
- `docs/session-log/YYYY-MM-DD-brief-title.md` — per-session notes (template:
  `templates/session-log.md`).

This is what lets the kit be useful "for years" across many projects and agents.

---

## Where to Go Next

- Read a specific rule: see the index in `core/AGENTS.md` §3 Rule Categories.
- Adopt in a project: see `docs/USAGE.md`.
- Contribute: see `CONTRIBUTING.md`.
- Extend the kit (new module/pack/adapter): see `core/PLANNING.md` — **stop and seek review**
  before architectural additions.
