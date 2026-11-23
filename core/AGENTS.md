# AGENTS.md

> **Canonical source of truth** for the AI Engineering Kit.
>
> This file is the index of every rule module in `core/`. Framework packs extend these rules
> and adapters only wire them into a specific tool; neither duplicates them.
>
> The `@import [..](..)` lines below are the kit's own index markers, checked by
> `scripts/validate-kit.ps1`. They are not a directive any agent understands; to load the
> rules in a project, use `scripts/adopt-kit.ps1` (see `docs/USAGE.md`).

---

## 1. Introduction

### 1.1 Scope

These rules are the shared engineering baseline for **every** project that adopts this kit,
regardless of the AI coding agent in use.

### 1.2 Always-Loaded Summary

[ESSENTIALS.md](ESSENTIALS.md) condenses the rules every agent must follow on every task. It is
inlined into each adopting project's `AGENTS.md`; the modules below hold the full detail.

### 1.3 Precedence

Later layers override earlier ones:

1. Global user profile (personal preferences).
2. Kit core rules (this index and its modules).
3. Active framework packs (stack-specific additions).
4. The project's own instructions (outside the kit's managed block in its `AGENTS.md`).

The **Non-Negotiables** in [ESSENTIALS.md](ESSENTIALS.md) sit above every layer: only an
explicit instruction from the user in the current conversation can relax them. Adapters are
not a precedence layer; they only make a tool load the rules. Any override must cite the rule
it changes. See the kit's `docs/ARCHITECTURE.md` for the full model.

---

## 2. Security

@import [SECURITY.md](SECURITY.md)

### 2.1 Non-Negotiables

- Never read `.env` files unless explicitly instructed.
- Never expose secrets, tokens, keys, or environment variables.
- Never perform irreversible shell commands automatically.
- Always request confirmation before destructive actions.

---

## 3. Git

@import [GIT.md](GIT.md)

### 3.1 Non-Negotiables

No automatic `git commit`, `git push`, `git reset --hard`, `git rebase`, or `git clean -fd`
unless explicitly instructed.

---

## 4. Coding Standards

@import [CODING_STANDARDS.md](CODING_STANDARDS.md)

---

## 5. Architecture

@import [ARCHITECTURE.md](ARCHITECTURE.md)

---

## 6. Database

@import [DATABASE.md](DATABASE.md)

### 6.1 Non-Negotiables

- Never generate destructive SQL.
- Never `DROP DATABASE` or `DROP TABLE`.
- Never `DELETE`/`UPDATE` without `WHERE` unless explicitly requested.

---

## 7. API Design

@import [API.md](API.md)

---

## 8. Testing

@import [TESTING.md](TESTING.md)

---

## 9. Performance

@import [PERFORMANCE.md](PERFORMANCE.md)

### 9.1 Non-Negotiables

- Prefer reading only necessary files.
- Avoid scanning entire repositories.
- Ignore `node_modules` and build outputs unless required.
- Minimize unnecessary token usage.

---

## 10. Documentation

@import [DOCUMENTATION.md](DOCUMENTATION.md)

---

## 11. Accessibility

@import [ACCESSIBILITY.md](ACCESSIBILITY.md)

---

## 12. Error Handling

@import [ERROR_HANDLING.md](ERROR_HANDLING.md)

---

## 13. Dependencies

@import [DEPENDENCIES.md](DEPENDENCIES.md)

---

## 14. AI Workflow

@import [AI_WORKFLOW.md](AI_WORKFLOW.md)

---

## 15. Prompting & Context Engineering

@import [PROMPTING.md](PROMPTING.md)

---

## 16. Planning Workflow

@import [PLANNING.md](PLANNING.md)

## 17. Refactoring

@import [REFACTORING.md](REFACTORING.md)

## 18. Code Review

@import [CODE_REVIEW.md](CODE_REVIEW.md)

## 19. Commit Workflow

@import [COMMIT_WORKFLOW.md](COMMIT_WORKFLOW.md)

## 20. Engineering Principles

@import [ENGINEERING_PRINCIPLES.md](ENGINEERING_PRINCIPLES.md)

## 21. AI Restrictions

@import [AI_RESTRICTIONS.md](AI_RESTRICTIONS.md)

## 22. Project Memory

Significant work is recorded in the **project's** `docs/` directory (create the files with
`scripts/adopt-kit.ps1 -WithMemory`; entry formats are in `templates/`):

- `activity-log.md` — significant engineering work.
- `decision-log.md` — architecture decisions.
- `roadmap.md` — planned features.
- `technical-debt.md` — future improvements.
- `session-log/` — per-session notes.

## 23. Rule Categories

The following cross-cutting rule categories are enforced across all modules above. They are
defined in detail in the imported modules but summarized here for discoverability.

| Category | Governed by |
|----------|-------------|
| Security | `SECURITY.md`, `AI_RESTRICTIONS.md` |
| Untrusted Content | `SECURITY.md` §Untrusted Content |
| Verification | `AI_WORKFLOW.md` §Finishing and Verification |
| AI Restrictions | `AI_RESTRICTIONS.md` |
| Git | `GIT.md`, `COMMIT_WORKFLOW.md` |
| Database | `DATABASE.md` |
| Architecture | `ARCHITECTURE.md` |
| API Design | `API.md` |
| Testing | `TESTING.md` |
| Performance | `PERFORMANCE.md` |
| Documentation | `DOCUMENTATION.md` |
| Accessibility | `ACCESSIBILITY.md` |
| Error Handling | `ERROR_HANDLING.md` |
| Dependencies | `DEPENDENCIES.md` |
| Logging | `DOCUMENTATION.md` §Logging |
| Debugging | `AI_WORKFLOW.md` §Debugging |
| Prompt Engineering | `PROMPTING.md` §Prompt Engineering |
| Context Engineering | `PROMPTING.md` §Context Engineering |
| Code Reviews | `CODE_REVIEW.md` |
| Refactoring | `REFACTORING.md` |
| Deployment | `AI_WORKFLOW.md` §Deployment |
| File Organization | `CODING_STANDARDS.md` §File Organization |
| Naming Conventions | `CODING_STANDARDS.md` §Naming |
| Planning | `PLANNING.md` |
| Commit Workflow | `COMMIT_WORKFLOW.md` |
| Engineering Principles | `ENGINEERING_PRINCIPLES.md` |
| Production Readiness | `AI_WORKFLOW.md` §Production Readiness |
| Project Memory | The project's `docs/` (activity/decision/roadmap/debt/session logs) |

---

## 24. Framework Packs & Adapters

Framework packs (`framework-packs/` in the kit) are **additive**: they extend the rules in this
file and must cite the canonical rule they reference or override. Adapters (`adapters/`)
document how each AI tool loads the rules; they add no rules of their own.

See the kit's `docs/USAGE.md` for setup instructions.
