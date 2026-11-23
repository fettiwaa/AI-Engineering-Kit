---
skill: end-of-day
description: Safely wrap up the current development project for a fresh session tomorrow - inspect Git state, review the session's verified work, record unfinished tasks, blockers, decisions, and the exact next task in PROJECT_STATUS.md, and recommend whether to compact or start fresh. Never commits, pushes, resets, or deletes. Use when the user says end of the day, end of day, EOD, wrapping up, done for today, calling it a day, or stopping for the night.
---

# Prompt: End of Day

**Use when:** you are stopping work for the day and want the project ready for a fresh
session tomorrow. Tomorrow, start with [project-resume.md](project-resume.md)
(`/project-resume`).

## Role

You close out the day's session safely. You record verified project state; you do not change
code, history, or the working tree.

## Input

The repository in the working directory and the current conversation.

## Process

1. **Inspect.** Run `git status`, note the current branch, and review focused diffs of
   uncommitted changes. Read `PROJECT_STATUS.md` if it exists.
2. **Review the session.** List the work done today and verify each item against the code and
   any checks that were actually run. Anything not verified is "in progress" or "unverified",
   never "done".
3. **Collect open items:** unfinished tasks, blockers, errors seen, and decisions still
   pending.
4. **Write the handoff.** Follow [session-handoff.md](session-handoff.md) (`/session-handoff`)
   for content and template, with this target:
   - If `PROJECT_STATUS.md` exists, update it in place: keep sections that are still
     accurate, replace stale ones, and do not delete history the user wrote.
   - If it does not exist, ask once before creating it. If the user declines, give the
     handoff in the response only.
   - Ask before creating any other persistent file (session logs, notes).
5. **Preserve decisions and the next step.** Record important technical decisions with their
   reason, and the single exact next recommended task with the files to open first.
6. **Context check.** Apply [context-guardian.md](context-guardian.md) (`/context-guardian`):
   recommend `/compact`, `/clear`, or a fresh session tomorrow, and state what is now
   preserved in `PROJECT_STATUS.md`. Do not run `/compact` or `/clear` yourself.
7. **Summarize** (see Output).

## Rules

- Never claim unverified work is complete, or tests passed that were not run and passed.
- Never delete, reset, stash, checkout, commit, or push anything (`core/AI_RESTRICTIONS.md`,
  `core/GIT.md`). Uncommitted changes stay exactly as they are; list them in the handoff.
- Never put secrets, credentials, tokens, personal data, or `.env` contents in documentation
  (`core/SECURITY.md`).
- Only `PROJECT_STATUS.md` may be written without asking, and only if it already exists.

## Output

1. Done today (verified) and in progress.
2. Uncommitted changes left in place.
3. Blockers, errors, and pending decisions.
4. The exact next task for tomorrow.
5. Context recommendation (compact, clear, or fresh session).
6. Whether `PROJECT_STATUS.md` was updated, created, or left alone.
