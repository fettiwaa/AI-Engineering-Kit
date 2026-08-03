# Architecture

## Overview

The AI Engineering Kit is a **reference framework**, not a runtime artifact. It exists as a set of
interoperable Markdown documents that together define a portable contract between an AI coding
agent and any software project.

The design is layered so that each layer has a single responsibility and a single source of truth.

## Layers

### 1. Canonical Core (`core/AGENTS.md`)

The **single source of truth**. Every rule in the repository is either defined here or explicitly
references this file. `core/AGENTS.md` imports (via Markdown links) the other modules in `core/` so
that a single load of `AGENTS.md` surfaces the full rule set.

```
core/AGENTS.md  -->  imports every other core/* file
```

When a vendor adapter or framework pack wants to override a rule, it must do so with an explicit
precedence statement so that the override is discoverable.

### 2. Framework Packs (`framework-packs/*.md`)

Each file is a **focused, optional** rule set scoped to one technology. A framework pack never
redefines a core rule; it only adds stack-specific conventions (e.g. "use `tsc --noEmit` for type
checking", "lint with ESLint flat config") and links back to the relevant core principle.

Framework packs are intentionally additive and self-contained so that a project can adopt just the
ones it needs.

### 3. Adapters (`adapters/*.md`)

Each adapter is a **minimal** file scoped to one AI coding tool. Its responsibilities are:

1. Identify itself (e.g. "This file configures Cursor").
2. Point to `core/AGENTS.md` as the canonical source.
3. Provide only the directives that the tool actually understands (file format, comment syntax,
   include/exclude patterns).

Adapters **must not** duplicate core rules. If an adapter needs to relax or tighten a rule for
tool-specific reasons, it does so with an explicit note referencing the core rule by path.

### 4. Operational Assets

| Asset | Purpose |
|-------|---------|
| `prompts/` | Reusable agent prompts (feature dev, bug fix, review, etc.). |
| `templates/` | Fill-in-the-blank file templates (README, RFC, ADR, etc.). |
| `checklists/` | Gate-gate checklists (before commit, before PR, before release). |
| `examples/` | End-to-end worked examples combining multiple layers. |
| `scripts/` | Automation that supports the kit itself (e.g. link checker, lint). |

## Resolution Order

When an agent loads instructions for a given repository, precedence (highest last) is:

1. **Global user profile** — `%USERPROFILE%\.config\kilo\AGENTS.md` (or platform equivalent).
2. **Repository core** — `core/AGENTS.md` and the modules it imports.
3. **Framework packs** — active packs selected by the project.
4. **Adapter** — the vendor-specific file the agent is running under.

Later layers may override earlier ones **only** for tool-specific or stack-specific reasons, and
every override must cite the canonical rule it modifies.

## Design Principles

1. **Vendor neutral** — no rule is written for a single tool.
2. **Single responsibility** — one purpose per file.
3. **No duplication** — rules are defined once and referenced.
4. **Enterprise quality** — assume a regulated, production context.
5. **Long-lived** — prefer simple formats that survive tooling churn.
6. **Portable** — Markdown everywhere; no proprietary formats.

## Maintenance Model

- Each core module should be owned by one maintainer (see `CONTRIBUTING.md`).
- Major changes require an entry in `CHANGELOG.md` and an Architecture Decision Record
  (template in `templates/`).
- Framework packs are versioned independently and may be adopted on a per-project basis.

## See Also

- `core/AGENTS.md` — canonical rule set.
- `docs/INTEGRATION.md` — how to wire this kit into a new project.
