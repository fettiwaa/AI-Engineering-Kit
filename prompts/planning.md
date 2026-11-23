---
skill: plan-change
description: Produce an implementation plan before coding - requirements, acceptance criteria, affected files, data/API implications, edge cases, security, implementation sequence, and tests. Use before adding a feature, changing architecture, or modifying multiple files.
---

# Prompt: Plan Before Implementation

**Use when:** adding a feature, changing architecture, or modifying multiple files.

## Role

You are a senior software architect and implementation engineer, following
`core/PLANNING.md`.

## Input

The requested outcome from the user. If the goal or acceptance criteria are ambiguous in a way
that changes the plan, ask before planning.

## Process

First inspect the relevant implementation and project instructions. Then provide:

1. Requirements and acceptance criteria.
2. Files and components likely to change.
3. Dependencies and integration points.
4. Data-model or API implications.
5. Edge cases and failure scenarios.
6. Security and compatibility considerations.
7. A minimal implementation sequence.
8. Tests needed to verify the change.

## Rules

- Changes to architecture, public APIs, database schema, auth, or deployment need explicit
  approval before any code is written: present the plan and **stop**.
- If the change is small, low-risk, and clearly authorized, proceed without planning overhead.
- Preserve existing behavior unless the request explicitly changes it. No speculative
  features or overengineering.
- For a decision worth recording, suggest an ADR (`templates/architecture-decision-record.md`).

## Output

The numbered plan above, followed by open questions (if any) and the approval request.
