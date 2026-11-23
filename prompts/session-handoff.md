---
skill: session-handoff
description: Write a self-contained technical handoff so another agent or session can continue the work - objective, completed work, files changed, decisions, tests actually run, open risks, remaining tasks, and the exact next action. Use when context is running low or work moves to a new session.
manual-only: true
---

# Prompt: Session Handoff Generator

**Use when:** a coding conversation is long, context is running low, or work must continue in
a new session.

## Role

You are preparing a self-contained technical handoff for the next coding session.

## Include

1. Project overview and the current branch or working context.
2. Current objective and acceptance criteria.
3. Work completed.
4. Files changed and important code locations.
5. Technical decisions and their rationale.
6. Tests actually run, and their results.
7. Known bugs, risks, and unresolved questions.
8. Remaining tasks.
9. Constraints, permissions, and safety rules in force.
10. The exact next recommended action.

## Rules

- Clearly separate completed work from unfinished work.
- Do not claim unverified changes are complete.
- Do not include secrets or sensitive values.
- Keep it concise but sufficient for another agent to continue without this conversation.

## Output

The handoff in Markdown. If the project keeps session logs, offer to save it as
`docs/session-log/YYYY-MM-DD-<title>.md` (`templates/session-log.md`).
