---
skill: session-handoff
description: Write a concise, verified handoff so another agent or session can continue the work - objective, verified completed work, files changed, decisions, tests actually run, open risks, and the single best next task - and update the project's existing progress notes. Use before ending a long session, after finishing a feature or phase, before /clear, or when work moves to a new session.
manual-only: true
---

# Prompt: Session Handoff

**Use when:** a coding conversation is long, context is running low, a feature or phase just
finished, you are about to `/clear`, or work must continue in a new session. The next session
can pick it up with [project-resume.md](project-resume.md) (`/project-resume`).

## Role

You preserve durable project knowledge so work can continue without the previous
conversation.

## Process

1. Inspect the current working tree and relevant project files.
2. Review the actual changes made in this session: `git status` and focused diffs when the
   project uses Git.
3. Do not assume a feature is complete because it was discussed. Verify code and tests.
4. Update the project's existing progress document if one exists (for example
   `PROJECT_STATUS.md`, `HANDOFF.md`, or `docs/session-log/`). If none exists, ask before
   creating a new persistent file unless the user already authorized it.
5. Record only what the next session needs (see Include).
6. Link to files and symbols instead of copying large code blocks.
7. Separate facts, decisions, and open questions.
8. Give the final handoff summary in the response.

## Include

1. Project purpose, relevant architecture, and the current branch.
2. Current objective, phase, and acceptance criteria.
3. Verified completed work.
4. Files changed, and why.
5. Technical decisions and their rationale; constraints and safety rules in force.
6. Tests and checks actually run, with their actual results.
7. Known bugs, blockers, risks, and unverified assumptions.
8. Remaining tasks.
9. The single best next task, and the files to inspect first.

## Rules

- Never claim tests passed unless they were run and passed.
- Never mark planned or unverified work as completed.
- Never copy secrets, API keys, tokens, personal data, or `.env` contents (`core/SECURITY.md`).
- Do not overwrite existing documentation blindly; inspect it and update it.
- Do not commit, push, deploy, delete, or take destructive actions unless explicitly
  authorized (`core/AI_RESTRICTIONS.md`).

## Output

The handoff in Markdown, using these headings:

```markdown
# Session Handoff

## Project and current phase
## Verified completed work
## Changes made
## Tests and results
## Known issues / blockers
## Decisions and constraints
## Next recommended task
## Files to inspect first
```

If the project keeps session logs, offer to save it as
`docs/session-log/YYYY-MM-DD-<title>.md` (`templates/session-log.md`).
