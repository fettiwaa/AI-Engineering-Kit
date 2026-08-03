# AI Engineering Kit

> A professional, modular, vendor-neutral engineering toolkit for AI coding agents.

**AI Engineering Kit** is a reusable engineering toolkit — not an application. It codifies the
standards, workflows, and guardrails that every AI coding agent should follow across every
software project. The kit is designed to be **cloned, imported, or referenced** by any repository
so that consistent engineering practices are applied regardless of whether the agent is
**Claude Code**, **OpenAI Codex**, **Kilo Code**, **Cursor**, **GitHub Copilot**, **Gemini CLI**,
**Aider**, **Windsurf**, or any future AI coding agent.

## Why

AI coding agents are powerful, but without a shared contract they produce inconsistent, unsafe, or
non-portable output. This kit provides that contract: a single canonical source of truth
(`AGENTS.md`) that is extended — never duplicated — by per-vendor adapters and per-framework packs.

## Canonical Source of Truth

| Layer | Purpose | Precedence |
|-------|---------|------------|
| Global profile (user home) | Your personal engineering preferences (e.g. "never read .env"). | Lowest |
| Repository `core/AGENTS.md` | Project-specific standards. | High — overrides global |
| Framework packs (`framework-packs/*`) | Stack-specific conventions. | Extends project |
| Adapters (`adapters/*`) | Compatibility with each AI coding tool. | Minimal — references the above |

> Project-level instructions **always take precedence** over global instructions.

## Repository Layout

```
AI-Engineering-Kit/
├── README.md              # This file
├── LICENSE
├── CHANGELOG.md
├── CONTRIBUTING.md
├── core/                  # Canonical, vendor-neutral rules
│   ├── AGENTS.md          # Single source of truth
│   ├── SECURITY.md
│   ├── CODING_STANDARDS.md
│   ├── ARCHITECTURE.md
│   ├── DATABASE.md
│   ├── API.md
│   ├── TESTING.md
│   ├── PERFORMANCE.md
│   ├── DOCUMENTATION.md
│   ├── ACCESSIBILITY.md
│   ├── ERROR_HANDLING.md
│   ├── DEPENDENCIES.md
│   ├── GIT.md
│   ├── AI_WORKFLOW.md
│   └── PROMPTING.md
├── adapters/              # Per-vendor compatibility layers
│   ├── claude-code.md
│   ├── openai-codex.md
│   ├── kilo.md
│   ├── cursor.md
│   ├── copilot.md
│   ├── gemini-cli.md
│   ├── aider.md
│   └── windsurf.md
├── framework-packs/       # Per-stack conventions
│   ├── typescript.md
│   ├── javascript.md
│   ├── react.md
│   ├── nextjs.md
│   ├── vue.md
│   ├── angular.md
│   ├── svelte.md
│   ├── nodejs.md
│   ├── express.md
│   ├── nestjs.md
│   ├── firebase.md
│   ├── supabase.md
│   ├── prisma.md
│   ├── drizzle.md
│   ├── flutter.md
│   ├── laravel.md
│   ├── fastapi.md
│   ├── spring.md
│   ├── aspnet.md
│   └── tailwind.md
├── prompts/               # Reusable prompt library
├── templates/             # Reusable file templates
├── checklists/            # Reusable pre-flight checklists
├── examples/              # Worked examples
├── scripts/               # Utility scripts
└── docs/                  # Narrative documentation
    ├── ARCHITECTURE.md
    ├── INTEGRATION.md
    └── ...
```

## How to Consume

### Option A — Reference this kit

In your project's `AGENTS.md`, prepend a pointer to the canonical source:

```markdown
# Project Agent Instructions

@file ../AI-Engineering-Kit/core/AGENTS.md

<!-- Project-specific overrides below -->
```

### Option B — Copy a framework pack

Copy `framework-packs/typescript.md` (and any others relevant) into your project and annotate
which rules are active.

### Option C — Global profile only

Place a single `AGENTS.md` in your global Kilo profile directory
(`%USERPROFILE%\.config\kilo\AGENTS.md`) to apply personal preferences everywhere.

## Security Posture

See `core/SECURITY.md` for the full policy. Core invariants:

- Never read `.env` files unless explicitly instructed.
- Never expose secrets, tokens, keys, or environment variables.
- Never perform irreversible shell commands automatically.
- Always request confirmation before destructive actions.

## Git Policy

No automatic `git commit`, `git push`, `git reset --hard`, `git rebase`, or `git clean -fd`
unless explicitly instructed.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md). By participating you agree to act as a responsible
steward of vendor-neutral, production-ready engineering practices.

## License

[MIT](LICENSE)
