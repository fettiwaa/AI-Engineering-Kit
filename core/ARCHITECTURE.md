# Architecture

## 1. Decision Records

Every significant architectural decision must be captured as an Architecture Decision Record
using `templates/architecture-decision-record.md`.

## 2. Module Boundaries

- Prefer loose coupling and high cohesion.
- Define clear interfaces between modules.
- Avoid circular dependencies.
- Enforce boundaries with the build/lint configuration of the active framework pack.

## 3. Layering

Follow a strict dependency direction:

```
UI / API  -->  Application  -->  Domain  -->  Infrastructure
```

Higher layers may depend on lower layers; lower layers must never depend on higher ones.

## 4. Vendor Neutrality

- Abstract external services behind interfaces.
- Avoid lock-in to a single provider or tool.
- Prefer standard protocols over proprietary APIs.

## 5. Evolution

Re-evaluate architecture regularly. Treat the architecture document as living documentation.
