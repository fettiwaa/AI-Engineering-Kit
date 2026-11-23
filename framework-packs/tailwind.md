# Tailwind CSS Framework Pack

> Extends `core/AGENTS.md`. Applies to Tailwind CSS projects.

## 1. Verify Before Finishing

- Build the CSS (or run the dev build) and check the changed UI renders as intended.

## 2. Configuration

- Check the major version: v4 is configured in CSS (`@import "tailwindcss"`, `@theme`); v3
  uses `tailwind.config.js`. Follow the one the project uses.

## 3. Classes

- Use theme tokens (spacing, colors, fonts). Arbitrary values (`w-[13px]`) only when no token
  fits, and add a token if the value repeats.
- Never build class names dynamically (`bg-${color}-500`): the scanner cannot see them. Map to
  complete class strings instead.
- Compose conditional classes with the project's helper (`clsx`, `tailwind-merge`).
- Prefer extracting a component over growing `@apply` blocks.

## 4. Accessibility

- Keep visible focus styles (`focus-visible:`); never remove outlines without a replacement.
- Check color contrast for new color pairs; do not convey state by color alone.

See `core/CODING_STANDARDS.md` §File Organization and `core/ACCESSIBILITY.md` §Principles.
