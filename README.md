# AI Engineering Kit

> A modular, vendor-neutral engineering rulebook for AI coding agents, with one command to
> adopt it in any project.

**AI Engineering Kit** codifies the standards, workflows, and guardrails an AI coding agent
should follow: security non-negotiables, git and database safety, planning gates, code review,
testing, and stack-specific conventions. It is a toolkit, not an application.

It works with **Claude Code**, **OpenAI Codex**, **Cursor**, **GitHub Copilot**,
**Gemini CLI**, **Kilo Code**, **Windsurf**, and **Aider**, through the cross-tool
[`AGENTS.md`](https://agents.md) convention plus a thin shim for tools that need one.

## Quick Start

```powershell
# From anywhere; PowerShell 5.1+ on Windows, or pwsh on macOS/Linux.
& "<path-to-kit>/scripts/adopt-kit.ps1" -Project . -Agents claude,cursor -Packs typescript,react
```

This:

1. Vendors the kit into `.ai-kit/` inside your project, so every agent can read it without
   leaving the workspace.
2. Writes a managed block into your `AGENTS.md` containing the always-on rules
   ([`core/ESSENTIALS.md`](core/ESSENTIALS.md)) plus the packs you chose. Anything you write
   outside the block is kept.
3. Writes shims where a tool needs one (`CLAUDE.md`, `GEMINI.md`,
   `.github/copilot-instructions.md`, `.aider.conf.yml`).

Re-run it any time to update. Add `-DryRun` to preview, `-WithMemory` to create the
project-memory files in `docs/`, and `-Skills all` to install the Claude Code skills. Full
guide: [`docs/USAGE.md`](docs/USAGE.md).

## Claude Code Skills

Nineteen prompts double as Claude Code skills, generated from [`prompts/`](prompts/):

| Engineering (auto + `/command`) | Manual only (`/command`) |
|---------------------------------|--------------------------|
| `/investigate-codebase`, `/plan-change`, `/implement-feature`, `/debug-issue`, `/review-code`, `/refactor-code`, `/write-tests`, `/security-audit`, `/optimize-performance`, `/architecture-decision`, `/review-architecture`, `/plan-migration`, `/write-docs` | `/session-handoff`, `/build-skill`, `/tutor`, `/socratic-coach`, `/portfolio-review`, `/mock-interview` |

```powershell
& "<path-to-kit>/scripts/install-skills.ps1" -Skills all -Scope user   # every project
& "<path-to-kit>/scripts/install-skills.ps1" -Skills all               # this project only
```

Auto skills load when your request matches their description; manual ones run only when you
type the command. List them with `install-skills.ps1 -List`.

## How Agents Load It

| Agent | Reads | Shim written |
|-------|-------|--------------|
| OpenAI Codex, Cursor, Kilo Code, Windsurf | `AGENTS.md` | none |
| GitHub Copilot | `.github/copilot-instructions.md`, `AGENTS.md` | `.github/copilot-instructions.md` |
| Claude Code | `CLAUDE.md` | `CLAUDE.md` containing `@AGENTS.md` |
| Gemini CLI | `GEMINI.md` | `GEMINI.md` containing `@./AGENTS.md` |
| Aider | files listed under `read:` | `.aider.conf.yml` with `read: [AGENTS.md]` |

Per-tool details: [`adapters/`](adapters/).

## Precedence

Later layers override earlier ones:

1. Global user profile (your personal preferences).
2. Kit core rules (`core/`).
3. Framework packs (`framework-packs/`).
4. The project's own instructions (outside the managed block in its `AGENTS.md`).

The **Non-Negotiables** sit above every layer; only the user, in the conversation, can relax
them:

- Never read `.env` files or expose secrets, credentials, or customer data.
- Never auto-run `git commit`, `push`, `rebase`, `reset --hard`, or `clean -fd`.
- Never generate destructive SQL or touch production data or infrastructure.
- Always ask before irreversible actions and before adding dependencies.

## Repository Layout

```
AI-Engineering-Kit/
├── core/                 # Canonical rules
│   ├── AGENTS.md         #   index of every module
│   ├── ESSENTIALS.md     #   always-loaded summary (inlined into projects)
│   └── *.md              #   21 modules: SECURITY, GIT, DATABASE, PLANNING, CODE_REVIEW, ...
├── framework-packs/      # 20 stack packs: typescript, react, nextjs, prisma, fastapi, ...
├── adapters/             # How each of the 8 supported tools loads the rules
├── prompts/              # 20 task prompts (19 also install as Claude Code skills)
├── templates/            # 15 templates (ADR, RFC, PR, project instructions, log entries, ...)
├── checklists/           # 9 gates (before commit/PR/merge/release, security, a11y, ...)
├── examples/             # Worked adoption examples
├── scripts/
│   ├── adopt-kit.ps1     # Adopt or update the kit in a project
│   ├── install-skills.ps1# Install prompts as Claude Code skills
│   └── validate-kit.ps1  # Consistency checks (run in CI)
├── docs/                 # Design, usage, and this repo's own project memory
├── AGENTS.md / CLAUDE.md # Instructions for agents working on the kit itself
└── CHANGELOG.md · CONTRIBUTING.md · LICENSE
```

## Documentation

- [`docs/USAGE.md`](docs/USAGE.md): adopting, updating, and customizing.
- [`docs/ARCHITECTURE.md`](docs/ARCHITECTURE.md): layers, distribution model, design principles.
- [`docs/PROJECT-DOCUMENTATION.md`](docs/PROJECT-DOCUMENTATION.md): full guide and build history.
- [`prompts/README.md`](prompts/README.md): prompt and skill index.
- [`docs/references.md`](docs/references.md): prompting and Claude Code documentation.
- [`core/AGENTS.md`](core/AGENTS.md): index of every rule module.

## Validating

```powershell
./scripts/validate-kit.ps1
```

Checks module indexing, relative links, section references, pack/adapter citations, the
ESSENTIALS size budget, CHANGELOG shape, and hard-coded personal paths. CI runs it on every
push and pull request.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).

## License

[MIT](LICENSE)
