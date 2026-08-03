# Integration Guide

How to adopt the AI Engineering Kit in a project.

> For ready-to-copy terminal commands per agent, see
> [`USAGE.md`](./USAGE.md).

## 1. Choose an adapter

Identify which AI coding agent your team uses and copy the corresponding file from
`adapters/` into the expected location:

| Agent | File location |
|-------|---------------|
| Kilo Code | `AGENTS.md` (project root) |
| Claude Code | `CLAUDE.md` (project root) |
| Cursor | `.cursorrules` (project root) |
| OpenAI Codex | `codex.md` (project root) |
| GitHub Copilot | `.github/Copilot-instructions.md` |
| Gemini CLI | `.gemini/GEMINI.md` |
| Aider | `.aider.md` (project root) |
| Windsurf | `.windsurfrc` rules entry |

## 2. Reference the canonical core

Each adapter file should begin by pointing back to the canonical core. Example for Kilo:

```markdown
# AGENTS.md

@import ../AI-Engineering-Kit/core/AGENTS.md
```

## 3. Add framework packs

Add the framework packs relevant to your stack. Packs are additive and self-contained.

## 4. Set up a global profile (optional)

For personal preferences across all projects, place an `AGENTS.md` in your global Kilo profile:

- Windows: `%USERPROFILE%\.config\kilo\AGENTS.md`
- Unix: `~/.config/kilo/AGENTS.md`

The global profile should hold preferences only (e.g. "never read .env", "ask before
installing dependencies"). Project instructions take precedence.

## 5. Validate

- [ ] Adapter file exists in the expected location.
- [ ] Core rules are importable (no broken links).
- [ ] Active framework packs are referenced.
- [ ] No rules are duplicated across layers.
