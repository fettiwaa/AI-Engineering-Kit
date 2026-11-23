# FastAPI Framework Pack

> Extends `core/AGENTS.md`. Applies to FastAPI projects.

## 1. Verify Before Finishing

- Run the project's linter/formatter (e.g. `ruff check`, `ruff format --check`), type checker
  (mypy or pyright), and `pytest`.

## 2. Structure

- One `APIRouter` per domain; route functions stay thin and call services.
- Pydantic models for every request and response. Set `response_model` (or a return type) so
  internal fields never leak.
- Shared concerns (auth, DB sessions, settings) come in through `Depends`.
- Settings via `pydantic-settings`, validated at startup. Startup/shutdown work in `lifespan`.

## 3. Async

- Use `async def` only when everything awaited inside is async. A blocking call (sync DB
  driver, `requests`, `time.sleep`) inside `async def` blocks the event loop; use plain `def`
  or an async library.

## 4. Errors and Tests

- Raise `HTTPException` or register exception handlers; never return stack traces.
- Test through `TestClient` / `httpx.AsyncClient`, overriding dependencies instead of patching.

See `core/API.md` and `core/ERROR_HANDLING.md`.
