# Prompt Library

Reusable task prompts. Each one works two ways:

- **Paste it** into any agent or chat (fill in the input it asks for).
- **Install it as a Claude Code skill** if it has `skill:` frontmatter:
  `scripts/install-skills.ps1` turns it into `.claude/skills/<skill>/SKILL.md`, invoked with
  `/<skill>` (or automatically, for skills that are not manual-only).

Select only the prompt a task needs; do not paste every prompt into every conversation.

## Software Engineering

| Prompt | Skill | Use when |
|--------|-------|----------|
| [codebase-investigator.md](codebase-investigator.md) | `/investigate-codebase` | Opening an unfamiliar repo or starting a big task |
| [planning.md](planning.md) | `/plan-change` | Adding a feature or changing several files |
| [feature-development.md](feature-development.md) | `/implement-feature` | Implementing a planned or clearly scoped feature |
| [debugging.md](debugging.md) | `/debug-issue` | Something is broken, behaves unexpectedly, or a known bug needs fixing |
| [code-review.md](code-review.md) | `/review-code` | Reviewing a diff or PR before committing |
| [refactoring.md](refactoring.md) | `/refactor-code` | Working code that is hard to maintain |
| [testing.md](testing.md) | `/write-tests` | Designing or adding tests |
| [security-audit.md](security-audit.md) | `/security-audit` | Defensive review of your own application |
| [architecture-decision.md](architecture-decision.md) | `/architecture-decision` | Choosing between technologies or approaches |
| [architecture-review.md](architecture-review.md) | `/review-architecture` | Reviewing a design proposal or existing structure |
| [database-migration.md](database-migration.md) | `/plan-migration` | Designing a schema or data migration |
| [performance-optimization.md](performance-optimization.md) | `/optimize-performance` | Something is slow or resource-heavy |
| [documentation.md](documentation.md) | `/write-docs` | Documenting a project for handoff or portfolio |

## Frontend

| Prompt | Skill | Use when |
|--------|-------|----------|
| [frontend-quality-design.md](frontend-quality-design.md) | `/frontend-quality-design` | UI implementation, design systems, responsive layouts, accessibility, visual QA |

Pairs with Anthropic's official `frontend-design` plugin (broad design guidance); see
`adapters/claude-code.md`. Both follow the project's existing visual identity and the user's
brief; neither imposes a style. This prompt keeps its original section layout as supplied.

## Agent Productivity

| Prompt | Skill | Use when |
|--------|-------|----------|
| [session-handoff.md](session-handoff.md) | `/session-handoff` (manual) | Context is running low or work moves to a new session |
| [skill-builder.md](skill-builder.md) | `/build-skill` (manual) | A workflow repeats often enough to become a skill |
| [remove-ai-coauthor.md](remove-ai-coauthor.md) | `/remove-ai-coauthor` (manual) | GitHub's Contributors list shows an AI assistant from `Co-Authored-By` trailers |
| [agent-practices.md](agent-practices.md) | | Snippets for agents that do not load the kit |

## Learning and Career

| Prompt | Skill | Use when |
|--------|-------|----------|
| [programming-tutor.md](programming-tutor.md) | `/tutor` (manual) | Learning a language, framework, or concept |
| [socratic-coach.md](socratic-coach.md) | `/socratic-coach` (manual) | Practicing problem-solving without being handed answers |
| [portfolio-evaluator.md](portfolio-evaluator.md) | `/portfolio-review` (manual) | Preparing a project for a resume or internship |
| [technical-interviewer.md](technical-interviewer.md) | `/mock-interview` (manual) | Preparing for junior developer, QA, or IT interviews |

"Manual" skills only run when you type the command; Claude will not start them on its own.

## Notes

- Prompts cannot grant capabilities, permissions, tools, or access the agent does not have.
- Time-budget instructions do not create a clock, and parallel-work instructions only help
  where the environment supports subagents.
- A prompt is never a substitute for permissions, sandboxing, backups, code review, or human
  approval of high-impact actions.
- These are original templates adapted for a software-development workflow, not official
  Anthropic prompts. See `docs/references.md` for the prompting guidance they draw on.

## Adding a Prompt or Skill

Use the section layout above (Role, Input, Process/Rules, Output) and cite the core module a
rule comes from. To make it a skill, add frontmatter:

```yaml
---
skill: my-skill            # lowercase letters, digits, hyphens; max 64 chars
description: What it does, and when to use it (max 1024 chars).
manual-only: true          # optional: only runs when invoked with /my-skill
---
```

`scripts/validate-kit.ps1` checks the frontmatter.
