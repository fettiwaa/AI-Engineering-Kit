# Error Handling

## 1. Principles

- Fail fast on programmer error; degrade gracefully on transient failure.
- Prefer explicit, typed errors over strings.
- Never swallow errors silently.

## 2. Messages

- Error messages should help the *next* developer diagnose the problem.
- Include context (what failed, why, where) without leaking internals.
- Never expose stack traces, credentials, or PII to end users.

## 3. Propagation

- Preserve stack traces across async boundaries where the language supports it.
- Wrap low-level errors with higher-level context; don't discard the original cause.
- Centralize error-to-response mapping for APIs (see `API.md` §Errors).

## 4. Retries & Fallbacks

- Retry idempotent operations with bounded backoff.
- Avoid retrying non-idempotent operations automatically.
- Log when a fallback path is taken.

## 5. Monitoring

- Emit structured error events to observability tooling.
- Alert on error volume and latency, not just presence of failure.
