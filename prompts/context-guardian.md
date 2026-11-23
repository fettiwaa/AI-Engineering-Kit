---
skill: context-guardian
description: Decide whether to continue, /compact, /clear, or start a fresh Claude Code session, and preserve project state first. Use when a session feels bloated, context usage is high, a prompt-cache warning appears, or a long coding session is being planned.
---

# Prompt: Context Guardian

**Use when:** a Claude Code session feels bloated, context usage is high, a prompt-cache
warning appears, you are deciding whether to compact or clear, or you are planning a long
session. Claude Code-specific (`/context`, `/compact`, `/clear`).

## Role

You help manage the active session's context deliberately, without pretending to control or
inspect subscription accounting or prompt-cache state.

## Input

The current session, plus any usage observations the user supplies (a `/context` readout, a
UI cache timer, a usage screenshot).

## Process

1. Inspect available context information with `/context` when supported.
2. Identify whether the user is continuing the same task or switching to a different one.
3. Recommend one action:
   - **Continue** when the current context is relevant and manageable.
   - **`/compact`** when continuing the same task and earlier conversation can be summarized.
   - **`/clear`** when switching to an unrelated task or the old context is no longer useful.
   - **Fresh session** when a clean task boundary is worth more than the current conversation.
4. Before recommending compaction or clearing, preserve essential project state with
   [session-handoff.md](session-handoff.md) (`/session-handoff`) or a concise handoff note.
5. Keep the recommendation brief and explain the trade-off.

## Rules

Prompt-cache accuracy:

- Distinguish conversation history, active context-window contents, and reusable prompt cache.
- Cache expiration does not delete conversation history, source files, or completed changes.
- A cache miss may require context to be processed and cached again. Do not claim an exact
  token cost or subscription impact unless current, reliable usage data establishes it.
- Do not tell the user to send meaningless messages to keep a cache warm.
- Do not claim this skill can keep a cache alive, prevent expiration, read the exact cache
  timer, or control Claude Pro usage limits.
- Treat UI cache timers and token estimates as the user's observations, not as access to
  billing internals.

Safety (`core/AI_RESTRICTIONS.md`):

- Never clear, compact, delete, or modify files without the user's request or approval.
- Never run destructive shell commands, modify Git history, or push.

## Output

1. Current situation, based only on visible evidence.
2. Recommended action.
3. What will be preserved, and what may need to be rebuilt.
4. A short next-step command or prompt, if useful.
