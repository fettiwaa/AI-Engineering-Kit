# Usage Guide

How to adopt, update, and customize the AI Engineering Kit in a project.

## 1. Requirements

- Windows PowerShell 5.1+ (built into Windows) or PowerShell 7+ (`pwsh`, for macOS/Linux).
- A local clone of this kit. Below, `$KIT` is the path to that clone:

```powershell
$KIT = '<path-to>/AI-Engineering-Kit'     # PowerShell
```

```bash
KIT="<path-to>/AI-Engineering-Kit"        # bash / zsh (run the scripts with pwsh)
```

If script execution is blocked on Windows, run with
`powershell -ExecutionPolicy Bypass -File "$KIT\scripts\adopt-kit.ps1" ...`.

## 2. Adopt in a Project

From the project root:

```powershell
& "$KIT/scripts/adopt-kit.ps1" -Agents claude,copilot -Packs typescript,react,nextjs
```

```bash
pwsh "$KIT/scripts/adopt-kit.ps1" -Agents claude,copilot -Packs typescript,react,nextjs
```

| Parameter | Meaning |
|-----------|---------|
| `-Project <path>` | Project to configure (default: current directory). |
| `-Agents a,b` | Shims to write: `claude`, `gemini`, `copilot`, `aider`, or `all`. `codex`, `cursor`, `kilo`, `windsurf` read `AGENTS.md` directly and need none. |
| `-Packs a,b` | Framework packs to inline (names of files in `framework-packs/`). |
| `-Skills a,b` | Install Claude Code skills into `.claude/skills/` (`all`, or names from `install-skills.ps1 -List`). |
| `-WithMemory` | Create `docs/activity-log.md`, `decision-log.md`, `technical-debt.md`, `roadmap.md` if missing. |
| `-DryRun` | Show what would change; write nothing. |

### What gets written

| Path | Content | Edit it? |
|------|---------|----------|
| `.ai-kit/` | Vendored core, checklists, prompts, templates, selected packs, `VERSION` | No (regenerated) |
| `AGENTS.md` | Managed block between `<!-- ai-kit:start -->` and `<!-- ai-kit:end -->` | Only outside the block |
| `CLAUDE.md` | `@AGENTS.md` import | Below the block |
| `GEMINI.md` | `@./AGENTS.md` import | Below the block |
| `.github/copilot-instructions.md` | Pointer to `AGENTS.md` | Below the block |
| `.aider.conf.yml` | `read: [AGENTS.md]` | Yes, outside the block |
| `.claude/skills/<name>/SKILL.md` | Skills generated from `prompts/` (with `-Skills`) | No (regenerated) |

Commit all of these so teammates and cloud agents get the same rules.

## 3. Add Project-Specific Rules

Write them in `AGENTS.md` **below** the managed block, for example:

```markdown
## Project-Specific Instructions

- Package manager: pnpm. Test: `pnpm test`. Type check: `pnpm typecheck`.
- API handlers live in `src/server/routes/`; never call the database from components.
```

Project instructions override kit rules, except the Non-Negotiables.

## 4. Update

Pull the latest kit, then re-run the same command in the project. Only the managed block and
`.ai-kit/` change; review the diff and commit. `.ai-kit/VERSION` records the kit version in
use.

To add or remove packs, re-run with the new `-Packs` list.

## 5. Use the Operational Assets

Point an agent at a vendored asset when you start a task:

- "Plan this feature using `.ai-kit/prompts/planning.md`."
- "Before opening the PR, run through `.ai-kit/checklists/before-pull-request.md`."
- "Write the ADR with `.ai-kit/templates/architecture-decision-record.md`."

### Claude Code skills

Most prompts install as skills (see `prompts/README.md`):

```powershell
& "$KIT/scripts/install-skills.ps1" -List                       # what is available
& "$KIT/scripts/install-skills.ps1" -Skills all -Scope user     # ~/.claude/skills: every project
& "$KIT/scripts/install-skills.ps1" -Skills debug-issue,review-code   # this project's .claude/skills
```

Run a skill with `/<name>` (for example `/debug-issue the login form returns 500`), or just
describe the task: non-manual skills load when the request matches. Re-run the script after
updating the kit; it only overwrites skills it installed. To add your own skill to the kit,
see `prompts/skill-builder.md`.

## 6. Global Profile (Optional)

Personal preferences that apply to every project go in your agent's user-level file, e.g.
`~/.claude/CLAUDE.md`, `~/.codex/AGENTS.md`, `~/.gemini/GEMINI.md`, or your Kilo global
profile. Keep it to preferences; project rules override it.

## 7. Verify It Loaded

Ask the agent: "What are your Non-Negotiables for this project?" It should list the kit's
rules. Tool-specific checks are in each file under [`adapters/`](../adapters/).
