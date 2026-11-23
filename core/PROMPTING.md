# Prompting & Context Engineering

## 1. Prompt Engineering

### 1.1 Principles

- Be explicit and unambiguous.
- Provide role, task, constraints, and desired output format.
- Prefer examples over long prose descriptions.
- Iterate on prompts; treat them as code.

### 1.2 Reusable Prompts

Reusable agent prompts live in the kit's `prompts/` directory (index: `prompts/README.md`).
Each prompt is self-contained: it states its purpose, required input, rules, and expected
output. Prompts with `skill:` frontmatter can be installed as Claude Code skills with
`scripts/install-skills.ps1`.

## 2. Context Engineering

### 2.1 Principle

Minimize context bloat. Load only the files, examples, and rules relevant to the current task.

### 2.2 Practices

- Prefer targeted file reads over whole-repo scans.
- Ignore `node_modules`, build outputs, and generated artifacts.
- When referencing rules, link to the canonical source (do not paste).
- Trim examples to the smallest reproducing slice.

## 3. Output Quality

- Ask for structured output where it aids downstream automation.
- Request explanations when correctness is uncertain.
- Prefer code that is idiomatic to the active framework pack.

See `../prompts/` for concrete prompt templates and `../checklists/` for pre-flight gates.
