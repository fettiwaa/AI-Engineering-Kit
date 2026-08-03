# NestJS Framework Pack

> Extends `core/AGENTS.md` and `framework-packs/nodejs.md`. Applies to NestJS projects.

## 1. Architecture

- Follow Hexagonal/Clean architecture with modules, controllers, and providers.
- Keep DTOs, entities, and services in their own files.

## 2. DI

- Prefer constructor injection.
- Use scopes (`REQUEST`, `TRANSIENT`) judiciously.

See `core/ARCHITECTURE.md` §Layering.
