# Spring Framework Pack

> Extends `core/AGENTS.md`. Applies to Spring / Spring Boot projects.

## 1. Verify Before Finishing

- `./mvnw verify` or `./gradlew build` (tests included), using the project's wrapper.

## 2. Structure

- Layering: controller -> service -> repository. Controllers expose DTOs, never JPA entities.
- Constructor injection with `final` fields; no field `@Autowired`.
- Typed configuration via `@ConfigurationProperties`; environment differences via profiles.

## 3. Validation and Errors

- `@Valid` plus Bean Validation annotations on request DTOs.
- One `@RestControllerAdvice` maps exceptions to a consistent error body (`ProblemDetail`).

## 4. Data

- `@Transactional` on public service methods (proxies ignore private and self calls).
- Watch for N+1: use fetch joins or entity graphs.
- Schema changes via Flyway or Liquibase. Never `ddl-auto=update` or `create` outside local dev.

## 5. Security

- Spring Security default-deny; no broad `permitAll()`. Do not disable CSRF for browser-facing
  apps without a documented reason.

## 6. Tests

- Prefer slices (`@WebMvcTest`, `@DataJpaTest`) and Testcontainers over full `@SpringBootTest`.

See `core/ARCHITECTURE.md` §Layering.
