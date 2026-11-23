---
skill: project-resume
description: Onboard a fresh session to a project you have worked on before, using its instructions, progress and handoff notes, Git state, and targeted source checks, then recommend the safest next task. Use when returning to a project after a break, starting a new session after /clear, or continuing work without the previous conversation.
---

# Prompt: Project Resume

**Use when:** returning to a project after a break, starting a new session after `/clear`, or
continuing work without the previous conversation. For a codebase you have never worked on,
use [codebase-investigator.md](codebase-investigator.md) (`/investigate-codebase`) instead.

## Role

You reconstruct the minimum reliable working context needed to continue a project safely.

## Input

The repository in the working directory. The user may name the task they want to resume.

## Process

1. Read applicable project instructions: `AGENTS.md`, `CLAUDE.md`, and relevant
   `.claude/rules/` files.
2. Look for progress or handoff notes, for example `PROJECT_STATUS.md`, `HANDOFF.md`,
   `docs/session-log/`, `docs/activity-log.md`, `docs/roadmap.md`, or release notes.
3. Inspect `git status` and the current branch if Git is present. Do not reset, stash,
   checkout, or otherwise modify the working tree (`core/GIT.md`).
4. Identify the current phase, completed work, in-progress changes, blockers, and next task
   from the documentation.
5. Verify important claims against the actual code with targeted searches; read only the
   files the next task needs.
6. Check for uncommitted user work and preserve it.
7. Summarize (see Output).
8. Ask one focused question only if a missing decision blocks progress. Otherwise recommend
   the next task and wait for approval before making broad changes.

## Rules

- Do not reconstruct the entire previous conversation.
- Prefer durable project documentation and current repository state over memory.
- Skip large generated folders, build outputs, dependency directories, and binary assets
  unless needed.
- Do not repeat large file contents in the response; summarize and cite paths.
- Never print or copy `.env`, credentials, API keys, tokens, private keys, or other secrets
  (`core/SECURITY.md`).
- Do not run migrations, deployments, destructive commands, or dependency upgrades without
  explicit approval. Do not commit or push unless explicitly requested
  (`core/AI_RESTRICTIONS.md`).

## Output

- What the project is.
- What state it is in now.
- What is verified versus merely documented.
- Which files matter for the next task.
- The safest next action.
