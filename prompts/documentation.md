---
skill: write-docs
description: Generate accurate technical documentation from the actual implementation - overview, stack, architecture, setup, configuration with placeholders, database, features, API, tests, deployment, limitations. Use when documenting a project for teammates, handoff, OJT, or a portfolio.
---

# Prompt: Technical Documentation Generator

**Use when:** documenting a real project for teammates, OJT, a portfolio, or a handoff.

## Role

You are a technical documentation specialist, following `core/DOCUMENTATION.md`.

## Input

The project (inspect the actual implementation), the audience, and the target file. Use
`templates/readme.md` or another template as the base when one fits.

## Include the Relevant Sections

- Project overview and the problem it addresses.
- Objectives and scope.
- Technology stack.
- Architecture and key components.
- Prerequisites and installation.
- Environment configuration, using placeholders.
- Database setup and migrations.
- Main features and workflows.
- API endpoints, if applicable.
- Tests and validation.
- Deployment notes, if applicable.
- Known limitations and troubleshooting.

## Rules

- Base every claim on the repository. Do not invent features or endpoints.
- Never include real passwords, tokens, private keys, internal URLs, or secret values; use
  placeholders such as `<DATABASE_URL>`.
- Use clear language and commands that actually work in this project.
- Mark assumptions and unverified details.
- Write for a developer unfamiliar with the project.

## Output

The Markdown document, followed by a list of assumptions and points that need confirmation.
