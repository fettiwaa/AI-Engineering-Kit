# Changelog

All notable changes to this project are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- `templates/claude-settings.json`: Claude Code permission rules that enforce the
  Non-Negotiables. `deny` blocks reading `.env` files; `ask` makes `git push`,
  `reset --hard`, `clean`, `rebase`, recursive deletes, and curl/PowerShell uploads always
  prompt. Documented in `adapters/claude-code.md` §5, with guidance on unknown repositories
  and pasted instructions in §6.

## [1.5.0] - 2026-11-23

### Added

- `/frontend-quality-design` skill (`prompts/frontend-quality-design.md`), imported from the
  General Frontend Engineering & Design Kit: a framework- and style-neutral workflow for UI
  implementation, design systems, responsiveness, accessibility, and visual QA.
- Anthropic's official `frontend-design` plugin documented as a recommended add-on in
  `adapters/claude-code.md`, `docs/USAGE.md`, and `docs/references.md`.
- Four more skills: `/implement-feature`, `/review-architecture`, `/plan-migration`,
  `/optimize-performance`. Their prompts were rewritten in the Role / Input / Process / Rules /
  Output layout.

### Removed

- `prompts/bug-fixing.md`, merged into `prompts/debugging.md` (`/debug-issue`) to avoid two
  near-identical skills competing for the same requests.

## [1.4.0] - 2026-11-23

### Added

- Claude Code skills: 15 prompts carry `skill:` frontmatter and `scripts/install-skills.ps1`
  generates `.claude/skills/<name>/SKILL.md` from them (project or user scope; idempotent;
  never overwrites a skill it did not install). `adopt-kit.ps1 -Skills` installs them during
  adoption. Learning, handoff, and skill-builder skills are manual-only.
- Prompts merged in from the Claude prompt library: `codebase-investigator`,
  `architecture-decision`, `session-handoff`, `skill-builder`, `agent-practices` (snippets),
  and the learning/career set `programming-tutor`, `socratic-coach`, `portfolio-evaluator`,
  `technical-interviewer`. `prompts/README.md` indexes all of them.
- `templates/project-instructions.md` (starter for a project's `AGENTS.md` section or a
  standalone `CLAUDE.md`) and `docs/references.md` (prompting and Claude Code docs).
- Core rules: untrusted content / prompt injection (`SECURITY.md` §Untrusted Content);
  finishing and verification, blocked operations, and ambiguity (`AI_WORKFLOW.md` §8-10);
  external actions such as deploying, publishing, or messaging (`AI_RESTRICTIONS.md`);
  placeholders in docs (`DOCUMENTATION.md`). Summarized in `ESSENTIALS.md`.
- Validator checks skill frontmatter (name format, uniqueness, description length, keys);
  CI installs all skills and asserts the second adoption run changes nothing.

### Changed

- `code-review`, `debugging`, `documentation`, `planning`, `refactoring`, `security-audit`,
  and `testing` prompts rewritten with the library's stronger versions (evidence-based
  findings, severity levels, "never claim an unexecuted check passed").

## [1.3.0] - 2026-11-23

### Added

- `scripts/adopt-kit.ps1`: one command adopts the kit in a project. It vendors the kit into
  `.ai-kit/`, writes a managed block into the project's `AGENTS.md`, and writes shims for
  Claude Code (`CLAUDE.md`), Gemini CLI (`GEMINI.md`), Copilot
  (`.github/copilot-instructions.md`), and Aider (`.aider.conf.yml`). Idempotent; preserves
  content outside the managed block; supports `-DryRun` and `-WithMemory`.
- `core/ESSENTIALS.md`: the compact, always-loaded rule summary inlined into every project.
- CI workflow (`.github/workflows/validate.yml`) running the validator and an adopt-kit smoke
  test on Linux (pwsh) and Windows (PowerShell 5.1).
- Root `CLAUDE.md` so Claude Code picks up this repository's own instructions.
- `.gitattributes` normalizing line endings to LF across Windows and Linux.
- `examples/adopting-kit-nextjs-claude.md`.

### Changed

- All 20 framework packs rewritten with concrete, verifiable rules (verify commands, security
  pitfalls, stack-specific do/don't) instead of skeletal bullets.
- All 8 adapters rewritten against each tool's documented instruction-file behavior.
- `scripts/validate-kit.ps1` now runs from any directory and checks relative links, section
  references, module indexing, pack/adapter citations, the ESSENTIALS size budget, CHANGELOG
  shape, and hard-coded personal paths. Reports every problem instead of the first.
- Precedence model clarified: global profile < kit core < packs < project instructions, with
  the Non-Negotiables above every layer. Adapters are wiring, not a precedence layer.
- `README.md`, `docs/USAGE.md`, `docs/INTEGRATION.md`, `docs/ARCHITECTURE.md`, and
  `docs/PROJECT-DOCUMENTATION.md` rewritten around the adopt script.
- `CONTRIBUTING.md`: security reports go through GitHub private vulnerability reporting.

### Fixed

- Adoption instructions used an `@import [..](..)` / `@file` syntax that no agent supports and
  wrong file names (`codex.md`, `.cursorrules`, `.github/Copilot-instructions.md`,
  `.gemini/GEMINI.md`, `.aider.md`, `.windsurfrc`), so the rules were never loaded.
- The validator failed when run from outside the repository root, contrary to the docs.
- Hard-coded personal paths removed from the docs.
- Broken section reference in the Copilot adapter; Node.js pack wrongly required TypeScript;
  `ENGINEERING_PRINCIPLES.md` kebab-case rule contradicted the kit's own file names.
- Duplicate `[Unreleased]` sections in this changelog.

## [1.2.0] - 2026-08-03

### Added

- `docs/USAGE.md` with per-agent adoption commands.
- `docs/PROJECT-DOCUMENTATION.md` comprehensive guide.

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

### Changed

- `core/AGENTS.md` now imports and indexes the six new workflow modules.
- `core/AI_WORKFLOW.md`, `core/CODING_STANDARDS.md`, `core/GIT.md`, `core/DOCUMENTATION.md`,
  and `core/SECURITY.md` defer to the new modules.

## [1.0.0] - 2026-08-03

### Added

- Initial scaffold: `core/` (hub plus 14 rule modules), 8 adapters, 20 framework packs,
  12 prompts, 9 templates, 8 checklists, an example, `scripts/validate-kit.ps1`, and
  `docs/ARCHITECTURE.md`.
