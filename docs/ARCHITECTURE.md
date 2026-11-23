# Architecture

## Overview

The AI Engineering Kit is a **reference framework**, not a runtime artifact: a set of Markdown
documents that define a portable contract between an AI coding agent and a software project,
plus two scripts that distribute and validate it.

Each layer has a single responsibility and a single source of truth.

## Layers

### 1. Canonical Core (`core/`)

Every rule is defined in exactly one `core/*.md` module. `core/AGENTS.md` indexes them (its
`@import` lines are index markers checked by the validator, not a tool directive).

`core/ESSENTIALS.md` is the one deliberate summary: a short digest of the rules every agent
must follow on every task, each linking to its defining module. It exists because agents load
a limited amount of always-on context; see decision D2 in `decision-log.md`.

### 2. Framework Packs (`framework-packs/*.md`)

Optional, stack-specific rules (verify commands, framework pitfalls). A pack never redefines a
core rule; it adds conventions and cites the core module it builds on. Every pack starts with a
`> Extends core/AGENTS.md` line, enforced by the validator.

### 3. Adapters (`adapters/*.md`)

Documentation of how each AI tool discovers instruction files and how the kit is wired into
it. Adapters add no rules and are not a precedence layer.

### 4. Operational Assets

| Asset | Purpose |
|-------|---------|
| `prompts/` | Reusable task prompts; those with `skill:` frontmatter are also generated into Claude Code skills by `install-skills.ps1` (decision D3). |
| `templates/` | Fill-in templates (README, RFC, ADR, PR, log entries, ...). |
| `checklists/` | Gate checklists (before commit, PR, merge, release; security; a11y). |
| `examples/` | Worked adoption examples. |
| `scripts/` | `adopt-kit.ps1` (distribution), `install-skills.ps1` (skills), and `validate-kit.ps1` (consistency). |

## Distribution Model

Agents differ in what they read, and most do not resolve imports or read outside the
workspace. The common denominator is a plain `AGENTS.md` at the project root, so
`scripts/adopt-kit.ps1`:

1. **Vendors** the kit into `<project>/.ai-kit/`, so the full modules are inside the
   workspace for any agent to open on demand.
2. **Inlines** `ESSENTIALS.md` and the chosen packs into a managed block in
   `<project>/AGENTS.md`, so the critical rules load without relying on imports.
3. **Shims** the tools that read a different file (`CLAUDE.md`, `GEMINI.md`,
   `.github/copilot-instructions.md`, `.aider.conf.yml`) to point at `AGENTS.md`.

The managed block is delimited by `ai-kit:start` / `ai-kit:end` markers. Only that block and
`.ai-kit/` are ever rewritten, which makes adoption idempotent and updates a reviewable diff.

```
kit repo                        project
core/ESSENTIALS.md ──inline──►  AGENTS.md  [managed block | project rules]
framework-packs/x.md ─inline─┘      ▲
core/, checklists/, ... ──copy──►  .ai-kit/  (full reference, read on demand)
                                    │
             CLAUDE.md, GEMINI.md, copilot-instructions.md, .aider.conf.yml ──► AGENTS.md
```

## Resolution Order

Later layers override earlier ones:

1. **Global user profile**: personal preferences in the agent's user-level file.
2. **Kit core**: the managed block and `.ai-kit/core/`.
3. **Framework packs**: stack-specific additions.
4. **Project instructions**: everything outside the managed block in the project's
   `AGENTS.md` (and tool-specific additions in the shims).

The **Non-Negotiables** in `core/ESSENTIALS.md` sit above every layer: only an explicit
instruction from the user in the current conversation relaxes them. Every override must cite
the rule it changes.

## Design Principles

1. **Vendor neutral**: no rule is written for a single tool.
2. **Single responsibility**: one purpose per file.
3. **No duplication**: rules are defined once and referenced (ESSENTIALS is the sole,
   budgeted summary).
4. **Enterprise quality**: assume a regulated, production context.
5. **Long-lived**: plain Markdown and PowerShell; no build step, no runtime dependencies.
6. **Verifiable**: the validator and CI enforce the structure, not convention alone.

## Maintenance Model

- Major changes require a `CHANGELOG.md` entry and a decision-log entry or ADR
  (`templates/architecture-decision-record.md`).
- `scripts/validate-kit.ps1` must pass; CI runs it plus an adoption smoke test.
- Adopting projects pin a version via `.ai-kit/VERSION` and update by re-running the script.

## See Also

- `core/AGENTS.md`: rule index.
- `docs/USAGE.md`: adoption and updates.
