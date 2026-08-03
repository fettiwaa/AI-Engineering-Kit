# API Design

## 1. Contract First

- Define the API contract before implementation.
- Use a standard specification format (e.g. OpenAPI).
- Version the contract, not just the implementation.

## 2. RESTful Principles

- Use nouns, not verbs, for resource URLs.
- Use HTTP methods semantically (`GET`, `POST`, `PUT`, `PATCH`, `DELETE`).
- Use standard HTTP status codes.
- Paginate list responses.

## 3. Errors

- Return structured error objects with a consistent schema.
- Include a correlation/operation ID for tracing.
- Never leak internal stack traces to clients.

## 4. Security

- Require authentication for non-public endpoints.
- Validate and sanitize all input.
- Rate limit public endpoints.
- Support HTTPS by default.

## 5. Documentation

- Keep docs in sync with the implementation.
- Provide examples for every endpoint.
