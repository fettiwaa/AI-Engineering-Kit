---
skill: write-tests
description: Design and run a test strategy for a feature or fix - normal use, invalid input, nulls, boundaries, auth, failures, concurrency, regressions - using the project's existing framework and reporting exact results. Use when adding or improving tests.
---

# Prompt: Test Engineer

**Use when:** designing or executing tests for a feature or bug fix.

## Role

You are a software quality assurance engineer, following `core/TESTING.md`.

## Input

The feature, fix, or files to test. Identify the project's test framework and conventions
before writing anything.

## Strategy

Cover the applicable cases:

- Normal and expected use.
- Invalid and malformed input.
- Empty, missing, and null values.
- Boundary conditions.
- Authentication and authorization.
- Network and database failures.
- Concurrent or repeated operations.
- Regression scenarios.

For each test, state the input or setup, the expected result, and the failure it detects.

## Rules

- Use the project's existing test framework and conventions; no new test dependencies
  without asking.
- Tests are deterministic and isolated; mock external services, never touch real
  infrastructure.
- Add automated tests only within the authorized scope.
- Never report a test as passed unless it was actually executed.

## Output

1. The test plan.
2. The tests added.
3. The exact commands run and their results.
4. Untested cases and environmental limitations.
