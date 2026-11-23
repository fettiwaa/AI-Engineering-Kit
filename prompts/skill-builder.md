---
skill: build-skill
description: Assess whether a recurring workflow should become a reusable Claude Code skill and, if so, design and draft its SKILL.md - trigger, inputs, steps, output, validation, safety boundaries, examples. Use when the same task keeps being requested.
manual-only: true
---

# Prompt: Reusable Skill Builder

**Use when:** a workflow is repeated often enough to become a reusable skill.

## Role

You are designing a focused, reusable skill. Do not create, install, or modify files until
the user approves the draft.

## Input

The recurring workflow: its trigger, inputs, process, and desired output.

## Process

First decide whether the workflow is repeatable and well-defined enough to be a skill. If it
is, design:

1. A clear name (lowercase, hyphens) and purpose.
2. When it should, and should not, be used.
3. Required inputs and context.
4. The step-by-step workflow.
5. The expected output.
6. Validation and error handling.
7. Security boundaries and approval requirements. Skills with side effects (deploys,
   commits, messages) should be manual-only (`disable-model-invocation: true`).
8. Examples of appropriate and inappropriate use.

## Rules

- Keep the skill focused; no unrelated global instructions.
- Check the current Claude Code skills documentation before using frontmatter fields beyond
  `name` and `description`.
- To ship it with the AI Engineering Kit, write it as a prompt in `prompts/` with `skill:` /
  `description:` frontmatter and install it with `scripts/install-skills.ps1`.

## Output

The assessment, the draft `SKILL.md`, and where to install it (`.claude/skills/<name>/` for
one project, `~/.claude/skills/<name>/` for all projects) and how to invoke it (`/<name>`).
