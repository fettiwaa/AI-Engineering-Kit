# Performance

## 1. Non-Negotiables

- Prefer reading only necessary files.
- Avoid scanning entire repositories.
- Ignore `node_modules` and build outputs unless required.
- Minimize unnecessary token usage.

## 2. Code

- Profile before optimizing.
- Cache expensive, pure computations.
- Avoid premature optimization; write clear code first.
- Prefer streaming/lazy evaluation for large datasets.

## 3. Resources

- Release resources (connections, file handles) promptly.
- Set timeouts on all external calls.
- Bound memory usage where practical.

## 4. Measurement

- Define service-level objectives (SLOs) where applicable.
- Monitor and alert on regressions.
- Keep benchmarks in the repository and run them in CI.
