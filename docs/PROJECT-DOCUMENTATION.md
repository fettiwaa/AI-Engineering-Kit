# AI Engineering Kit — Project Documentation

> What the kit is, how it evolved, and where to find each part. Task-oriented guides live in
> [`USAGE.md`](./USAGE.md) (adoption) and [`ARCHITECTURE.md`](./ARCHITECTURE.md) (design).

- [Overview](#overview)
- [Build history](#build-history)
- [Repository structure](#repository-structure)
- [Quick start](#quick-start)
- [Precedence](#precedence)
- [Validating the kit](#validating-the-kit)
- [Project memory](#project-memory)

---

## Overview

The **AI Engineering Kit** is a reusable, **vendor-neutral** set of engineering rules for AI
coding agents: security and data-safety non-negotiables, git discipline, planning gates,
code-review and testing expectations, and per-stack conventions. It works with Claude Code,
OpenAI Codex, Cursor, GitHub Copilot, Gemini CLI, Kilo Code, Windsurf, and Aider.

Every rule lives in one `core/` module. `core/ESSENTIALS.md` is the compact summary that each
adopting project loads on every task; the full modules are vendored alongside it for on-demand
reading.

---

## Build History

### V1.0 — Scaffold

`core/` hub plus 14 rule modules, 8 adapters, 20 framework packs, 12 prompts, 9 templates,
8 checklists, an example, a validator, and `docs/ARCHITECTURE.md`.

### V1.1 — Engineering Workflow Layer

Six workflow modules (`PLANNING`, `REFACTORING`, `CODE_REVIEW`, `COMMIT_WORKFLOW`,
`ENGINEERING_PRINCIPLES`, `AI_RESTRICTIONS`), the project-memory system in `docs/`, log
templates, and `checklists/code-review.md`. See decision D1.

### V1.2 — Usage Guide

`docs/USAGE.md` and this document.

### V1.3 — Working Adoption

V1.2's per-agent instructions relied on an `@import` syntax no agent supports and on several
wrong file names, so adopted rules were never actually loaded. V1.3 fixes that:

- `scripts/adopt-kit.ps1` vendors the kit, writes a managed `AGENTS.md` block, and writes the
  per-tool shims (decision D2).
- `core/ESSENTIALS.md` provides the always-loaded rule digest.
- Adapters rewritten against each tool's documented behavior; all 20 packs filled with
  concrete rules.
- The validator works from any directory and checks links, section references, and more; CI
  runs it on Linux and Windows.

### V1.4 — Prompt Library and Skills

An external Claude prompt library was merged in (stronger review, debugging, testing,
security, and docs prompts; new investigation, handoff, architecture-decision, and
learning/career prompts), and its safety rules were folded into core. Fifteen prompts now
install as Claude Code skills through `scripts/install-skills.ps1` (decision D3).

Details: [`CHANGELOG.md`](../CHANGELOG.md).

---

## Repository Structure

```
AI-Engineering-Kit/
├── AGENTS.md, CLAUDE.md     # Instructions for agents working on the kit itself
├── core/
│   ├── AGENTS.md            # Index of every module
│   ├── ESSENTIALS.md        # Always-loaded digest (inlined into projects)
│   ├── SECURITY.md, AI_RESTRICTIONS.md, GIT.md, COMMIT_WORKFLOW.md
│   ├── PLANNING.md, REFACTORING.md, CODE_REVIEW.md, ENGINEERING_PRINCIPLES.md
│   ├── CODING_STANDARDS.md, ARCHITECTURE.md, DATABASE.md, API.md, TESTING.md
│   └── PERFORMANCE.md, DOCUMENTATION.md, ACCESSIBILITY.md, ERROR_HANDLING.md,
│       DEPENDENCIES.md, AI_WORKFLOW.md, PROMPTING.md
├── framework-packs/         # 20 stack packs
├── adapters/                # 8 tool adapters
├── prompts/                 # 20 task prompts; 19 install as Claude Code skills
├── templates/               # 10 file templates + 5 log-entry templates
├── checklists/              # 9 gate checklists
├── examples/                # Worked adoption examples
├── scripts/                 # adopt-kit.ps1, install-skills.ps1, validate-kit.ps1
├── .github/workflows/       # CI
└── docs/                    # Design, usage, and this repo's project memory
```

---

## Quick Start

```powershell
& "<path-to-kit>/scripts/adopt-kit.ps1" -Project <project> -Agents claude -Packs typescript,react
```

Then add project-specific rules below the managed block in the project's `AGENTS.md`. All
options, updating, and verification: [`USAGE.md`](./USAGE.md).

---

## Precedence

```
Global user profile           (lowest)  personal preferences
   ↓
Kit core                                 managed block + .ai-kit/core/
   ↓
Framework packs                          stack-specific additions
   ↓
Project instructions          (highest) AGENTS.md outside the managed block
```

The Non-Negotiables in `core/ESSENTIALS.md` override every layer; only the user, in the
conversation, can relax them. Adapters only wire tools to `AGENTS.md`; they are not a layer.

---

## Validating the Kit

```powershell
./scripts/validate-kit.ps1        # works from any directory
```

On success it prints counts of modules, packs, adapters, links, and section references
checked. On failure it lists every problem and exits 1. CI
(`.github/workflows/validate.yml`) runs it plus an adoption smoke test.

---

## Project Memory

`docs/` doubles as this repository's long-term memory, and `adopt-kit.ps1 -WithMemory`
creates the same files in adopting projects:

- `activity-log.md`: significant work (template: `templates/activity-log-entry.md`).
- `decision-log.md`: architecture decisions (D1–Dn).
- `roadmap.md`: planned features.
- `technical-debt.md`: known limitations (T1–Tn).
- `session-log/YYYY-MM-DD-title.md`: per-session notes (template: `templates/session-log.md`).

Before extending the kit with a new module, pack, or adapter, follow `core/PLANNING.md`:
propose the change and record the decision.
