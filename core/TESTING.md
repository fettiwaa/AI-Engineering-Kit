# Testing

## 1. Philosophy

- Tests are a safety net, not a checklist item.
- Prefer deterministic, fast tests over broad coverage.
- Every bug fix should include a regression test.

## 2. Test Types

| Type | Scope | Speed | When |
|------|-------|-------|------|
| Unit | Single function/module | Fast | Always |
| Integration | Module interactions | Medium | Always |
| Contract | API/spec boundaries | Medium | Always |
| End-to-end | Full workflow | Slow | Selectively |

## 3. Naming & Structure

- Test files mirror source structure.
- Test names describe the behavior, not the implementation.
- Use `describe`/`it` (or equivalent) consistently with the framework pack.

## 4. Fixtures

- Keep test data isolated and deterministic.
- Clean up after tests.
- Mock external services; never touch real infrastructure.

## 5. CI

- Fail fast on lint and test errors.
- Gate merges on passing tests.
