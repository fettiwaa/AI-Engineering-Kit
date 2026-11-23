# Firebase Framework Pack

> Extends `core/AGENTS.md`. Applies to Firebase projects (Firestore, Auth, Functions, Storage).

## 1. Verify Before Finishing

- Run rule and function tests against the Emulator Suite (`firebase emulators:exec`). Never
  test against a live project.
- Never run `firebase deploy` unless explicitly asked.

## 2. Security Rules

- Security Rules are the authorization layer. Never ship `allow read, write: if true` or rules
  that only check `request.auth != null` for user-owned data.
- Every rules change comes with tests (`@firebase/rules-unit-testing`).

## 3. Credentials

- The Admin SDK and service-account credentials run on trusted servers only, never in client
  code or the repo. The web config object is not a secret; protect backends with App Check.

## 4. Firestore

- Model around queries: avoid unbounded arrays and hot single documents.
- Use transactions or batched writes for multi-document changes.
- Commit `firestore.rules` and `firestore.indexes.json`.

## 5. Cloud Functions

- Event-triggered functions may run more than once: make them idempotent.
- Set region, memory, and timeout explicitly.

See `core/SECURITY.md` and `core/DATABASE.md`.
