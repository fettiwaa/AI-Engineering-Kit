# ASP.NET Core Framework Pack

> Extends `core/AGENTS.md`. Applies to ASP.NET Core / .NET projects.

## 1. Verify Before Finishing

- `dotnet build` (no new warnings), `dotnet test`, and `dotnet format --verify-no-changes`.

## 2. Language and Async

- Nullable reference types enabled; do not suppress warnings with `!` without a reason.
- Async all the way: never `.Result`, `.Wait()`, or `async void` (except event handlers).
- Accept and pass `CancellationToken` through every async call chain.

## 3. Configuration and Secrets

- Bind settings with the options pattern (`IOptions<T>`) and validate on start.
- Secrets come from User Secrets in development and a secret store in deployment, never from
  `appsettings*.json`.

## 4. Data

- EF Core migrations via `dotnet ef migrations add`; review them before applying.
- `AsNoTracking()` for read-only queries; parameterized `FromSql` only.

## 5. API and Security

- Set a fallback authorization policy that requires authenticated users; opt out with
  `[AllowAnonymous]`.
- Return errors as `ProblemDetails`. Log with `ILogger<T>` message templates, not string
  interpolation.

See `core/SECURITY.md` and `core/API.md`.
