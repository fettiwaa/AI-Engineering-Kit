# Flutter Framework Pack

> Extends `core/AGENTS.md`. Applies to Flutter / Dart projects.

## 1. Verify Before Finishing

- `dart format`, `flutter analyze` (zero new issues with the project's lint set), and
  `flutter test`.

## 2. Widgets

- Small, composable widgets; mark constructors `const` wherever possible.
- No business logic or I/O in `build()`; keep it pure and cheap.
- Dispose every controller, stream subscription, and animation controller.
- After an `await`, check `mounted` (or `context.mounted`) before using `BuildContext`.

## 3. State

- Use the state-management approach the project already uses (Provider, Riverpod, Bloc, ...).
  Do not introduce a second one.

## 4. Security

- Anything shipped in the app bundle is extractable: no API secrets in code or assets. Call a
  backend that holds them.
- Store tokens with secure storage, not plain shared preferences.

## 5. Tests

- Widget tests for UI behavior, unit tests for logic; golden tests only where the project
  already uses them.

See `core/CODING_STANDARDS.md` and `core/SECURITY.md`.
