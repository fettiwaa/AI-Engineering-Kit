# Dependencies

## 1. Philosophy

- Add a dependency only when it solves a problem the project cannot reasonably solve itself.
- Prefer fewer, well-maintained dependencies over many small ones.
- Pin versions for reproducibility.

## 2. Selection Criteria

- Actively maintained and widely adopted.
- Clear license compatible with the project (see `LICENSE`).
- Minimal transitive footprint.
- No known critical CVEs.

## 3. Management

- Keep a lockfile and commit it.
- Update dependencies routinely; automate where safe.
- Audit dependencies regularly (`npm audit`, `pip-audit`, etc.).
- Remove unused dependencies periodically.

## 4. Supply Chain

- Verify package integrity signatures where available.
- Avoid installing from untrusted sources.
- Review transitive dependencies before adding a new library.

## 5. Runtime

- Avoid runtime compilation or dynamic code execution where possible.
- Prefer static linking or vendoring for critical paths.
