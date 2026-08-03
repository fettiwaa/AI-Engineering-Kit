# AGENTS.md (AI Engineering Kit)

This repository *is* the AI Engineering Kit. The canonical rule set lives in
`core/AGENTS.md` and is the single source of truth.

@import core/AGENTS.md

## Project-specific notes

- This repository contains documentation, templates, and rules — not runnable application code.
- When editing Markdown, prefer short, focused files (see `core/DOCUMENTATION.md`).
- Before adding a new module, check `docs/ARCHITECTURE.md` and propose an ADR
  (`templates/architecture-decision-record.md`).

## Available framework packs

Reference as needed from `framework-packs/`; do not duplicate them here. A specific
pack can be imported as `@import [framework-packs/<name>.md](framework-packs/<name>.md)`.
