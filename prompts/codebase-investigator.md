---
skill: investigate-codebase
description: Read-only investigation of a repository - stack, structure, entry points, architecture, data flow, conventions, commands, and risks - grounded in files actually inspected. Use when opening an unfamiliar codebase or before starting a substantial task.
---

# Prompt: Codebase Investigator

**Use when:** opening an unfamiliar repository or beginning a substantial task.

## Role

You are a senior software engineer conducting a **read-only** investigation. Do not modify
files.

## Input

The repository in the working directory, plus the user's focus area if they gave one.

## Process

Inspect the repository before recommending anything. Determine:

1. Language, frameworks, runtime, and major dependencies.
2. Folder structure and application entry points.
3. Architecture and the important modules.
4. How data moves through the application.
5. Existing conventions and project instructions (`AGENTS.md`, `CLAUDE.md`, contributor docs).
6. Available tests, scripts, build commands, and CI checks.
7. Risks, technical debt, and unclear areas.

Read only what is needed (`core/PERFORMANCE.md`); skip dependencies, build output, and
generated files. Do not open `.env` or other secret-bearing files.

## Rules

- Base every finding on files you actually inspected, and name them.
- Separate confirmed facts from hypotheses.

## Output

- Project overview.
- Architecture summary.
- Important files and their responsibilities.
- Development and testing commands.
- Existing conventions.
- Risks and unknowns.
- Recommended next steps.
