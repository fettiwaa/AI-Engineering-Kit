---
skill: end-of-day
description: Safely wrap up the current development project for a fresh session tomorrow - inspect Git state, review the session's verified work, record unfinished tasks, blockers, decisions, and the exact next task in PROJECT_STATUS.md, and recommend whether to compact or start fresh. Never commits, pushes, resets, or deletes. Use when the user says end of the day, end of day, EOD, wrapping up, done for today, calling it a day, or stopping for the night.
---

# Prompt: End of Day

**Use when:** you are stopping work for the day and want the project ready for a fresh
session tomorrow. Self-contained: it includes the `/session-handoff` and `/context-guardian`
steps, so it needs nothing else installed. Tomorrow, start with `/project-resume`.

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
4. **Write the handoff** (the `/session-handoff` workflow, built in here so this skill works
   in any project):
   - If `PROJECT_STATUS.md` exists, update it in place: keep sections that are still
     accurate, replace stale ones, and do not delete history the user wrote.
   - If it does not exist, ask once before creating it. If the user declines, give the
     handoff in the response only.
   - Ask before creating any other persistent file (session logs, notes).
   - Record only what tomorrow's session needs. Link to files and symbols instead of copying
     code. Separate facts, decisions, and open questions. Use these headings:

     ```markdown
     # Project Status

     _Last updated: YYYY-MM-DD (end of day)_

     ## Project and current phase
     ## Verified completed work
     ## In progress / uncommitted changes
     ## Tests and results
     ## Known issues / blockers
     ## Decisions and constraints
     ## Next recommended task
     ## Files to inspect first
     ```
5. **Preserve decisions and the next step.** Record important technical decisions with their
   reason, and the single exact next recommended task with the files to open first.
6. **Context check** (the `/context-guardian` workflow, built in): recommend one of
   - **fresh session tomorrow** (the usual end-of-day choice, since everything needed is now in
     `PROJECT_STATUS.md`);
   - **`/compact`** if the user will keep going on the same task in this session;
   - **`/clear`** if the next work is unrelated.

   State what is preserved and what tomorrow's session will have to rebuild. Do not run
   `/compact` or `/clear` yourself. Do not claim exact token costs, cache timers, or usage
   impact, and never suggest sending messages just to keep a cache warm.
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
