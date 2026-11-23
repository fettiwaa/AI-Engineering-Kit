# Decision Log

> Architecture decisions, recorded for posterity. Future agents should read this before
> challenging established choices.
>
> See `templates/decision-log-entry.md` for the entry format.
> For heavier decisions, use the full ADR template at `templates/architecture-decision-record.md`.

<!-- format: date | title | status -->

## D1 — V1.1 Workflow Layer as Dedicated Modules

- **Date:** 2026-08-03
- **Status:** Accepted
- **Context:** `core/AGENTS.md` was becoming a catch-all for agent workflow guidance, risking rule
  duplication and reducing maintainability.
- **Decision:** Keep `AGENTS.md` concise as a hub; move workflow detail into dedicated
  `core/*.md` modules (PLANNING, REFACTORING, CODE_REVIEW, COMMIT_WORKFLOW, ENGINEERING_PRINCIPLES,
  AI_RESTRICTIONS) and reference them.
- **Alternatives considered:**
  - Inline everything into `AGENTS.md` — rejected (violates modularity; bloats the hub).
  - A single monolithic `WORKFLOW.md` — rejected (one responsibility per file).
- **Reason:** Modularity and single-responsibility reduce edit conflicts and make each topic
  discoverable.
- **Consequences:** More files to maintain, but each is small and focused. New contributors must
  follow the TOC links, which is acceptable.

## D2 — Distribute by Vendoring + Managed AGENTS.md Block

- **Date:** 2026-11-23
- **Status:** Accepted
- **Context:** V1.2 told each agent to `@import` the kit from an absolute path outside the
  project. No agent supports that syntax; most do not resolve imports at all, and several do not
  read files outside the workspace. Adopting projects silently got no rules.
- **Decision:** `scripts/adopt-kit.ps1` copies the kit into `<project>/.ai-kit/` and writes a
  marker-delimited block into `<project>/AGENTS.md` containing `core/ESSENTIALS.md` plus the
  selected packs. Tools that read another file get a shim pointing at `AGENTS.md`
  (`CLAUDE.md` / `GEMINI.md` via native `@` imports; Copilot via a pointer; Aider via
  `read:`).
- **Alternatives considered:**
  - Inline every core module into `AGENTS.md`: rejected, ~27 KB plus packs exceeds some tools'
    instruction-size limits and wastes context on every task.
  - Pointer-only `AGENTS.md` ("read `.ai-kit/core/AGENTS.md`"): rejected, compliance would
    depend on the agent choosing to open the file.
  - Git submodule: rejected as the default; adds friction for every clone and CI job. Still
    possible manually.
- **Reason:** A plain root `AGENTS.md` is the only file nearly every tool reads natively.
  Inlining a budgeted digest guarantees the critical rules load; vendoring keeps the full
  modules one file-open away inside the workspace.
- **Consequences:** `ESSENTIALS.md` is a deliberate summary of other modules (an exception to
  "no duplication"), kept honest by linking every line to its source and by a 6 KB budget
  enforced in the validator. Each project carries a copy of the kit (~100 KB) that must be
  refreshed by re-running the script.

## D3 — Skills Are Generated From Prompts

- **Date:** 2026-11-23
- **Status:** Accepted
- **Context:** The kit's prompts should be usable as Claude Code skills without maintaining a
  second copy of each one.
- **Decision:** A prompt opts in with `skill:` / `description:` (and optional `manual-only:`)
  frontmatter. `scripts/install-skills.ps1` generates `SKILL.md` from it, marking the file so
  re-runs update only kit-installed skills. Conversational modes (tutor, interviewer, coach,
  portfolio review), the handoff, and the skill builder are manual-only.
- **Alternatives considered:**
  - A hand-written `skills/` tree: rejected, duplicates every prompt.
  - Skills that only say "read `.ai-kit/prompts/x.md`": rejected, breaks for user-scope
    installs where `.ai-kit/` does not exist, and adds an extra file read per use.
- **Reason:** One source per prompt; works for both project and user scope.
- **Consequences:** Prompt bodies must make sense as skill instructions (second person,
  "Input" section instead of fill-in placeholders). The validator enforces the frontmatter.
