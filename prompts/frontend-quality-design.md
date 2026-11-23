---
skill: frontend-quality-design
description: Plan, implement, review, and refine frontend interfaces across web and mobile projects. Use for UI implementation, design-system work, responsive layouts, accessibility, frontend architecture, visual QA, and improving existing interfaces while respecting their intended visual identity.
---

# Frontend Quality & Design Engineering

## Mission

Deliver frontend interfaces that are visually intentional, usable, accessible, responsive, maintainable, and technically sound.

Adapt to the product, audience, platform, design brief, references, and existing codebase. This skill does not prescribe one universal aesthetic.

## 1. Establish context before designing

Before implementation, determine:

- What product or experience is being built.
- Who the users are and what they need to accomplish.
- Which platform and framework are in use.
- Whether this is a new interface or an existing product.
- The intended visual direction and brand constraints.
- Available design references, assets, fonts, tokens, and components.
- Relevant technical, accessibility, performance, and browser constraints.

For an existing project, inspect the repository before proposing structural or visual changes.

Treat user-provided requirements and approved design references as authoritative. Do not replace them with personal aesthetic preferences.

## 2. Respect existing design systems

For existing products:

1. Inspect global styles, design tokens, typography, spacing, themes, components, and representative pages.
2. Identify what is working and should remain.
3. Reuse established components and conventions.
4. Identify inconsistencies and specific usability or visual problems.
5. Prefer targeted, coherent improvements over unnecessary rewrites.

Do not introduce a new visual identity unless the user explicitly asks for one.

For new products, propose a coherent visual direction based on the product, audience, and brief. Explain important choices when useful.

## 3. Visual design quality

Pay attention to:

- Clear information hierarchy.
- Typography, readability, and line length.
- Consistent spacing and alignment.
- Layout proportions and content density.
- Color contrast and meaningful use of color.
- Surface, border, and elevation treatment.
- Image quality, cropping, and aspect ratios.
- Component consistency.
- Empty, loading, error, success, hover, focus, and disabled states.
- Visual rhythm and section transitions.

Avoid generic template-like output, repetitive layouts, arbitrary decoration, excessive gradients, gratuitous glass effects, and animation without purpose.

Do not assume that premium means minimal, colorful, dark, monochrome, rounded, or any other single style. Follow the brief.

## 4. Responsive behavior

Design and verify layouts for the actual supported breakpoints and devices.

Check:

- Navigation and menus.
- Grid and column transformations.
- Typography scaling.
- Image behavior.
- Touch target sizes.
- Content overflow and horizontal scrolling.
- Dialogs, drawers, and overlays.
- Forms and keyboard behavior.

Do not merely shrink desktop layouts. Make mobile and tablet experiences intentional.

## 5. Accessibility and usability

Use semantic elements and accessible interaction patterns.

Consider:

- Keyboard navigation.
- Visible focus states.
- Accessible names and labels.
- Logical heading structure.
- Sufficient color contrast.
- Form labels and understandable errors.
- Screen-reader announcements where appropriate.
- Reduced-motion preferences.
- Touch target size and interaction clarity.

Do not use color as the only way to communicate status.

## 6. Frontend engineering quality

Follow the repository's framework, language, conventions, and architecture.

- Use existing dependencies and components when appropriate.
- Avoid unnecessary packages and abstractions.
- Keep components focused and maintainable.
- Preserve type safety.
- Handle loading, error, and empty states.
- Avoid unnecessary client-side rendering and oversized bundles.
- Consider performance, image optimization, and rendering behavior.
- Keep secrets out of source code.
- Do not weaken security controls to make implementation easier.

Do not claim that code, tests, or browser behavior were verified unless they were actually checked.

## 7. Motion and interaction

Use animation to communicate state, hierarchy, and feedback.

- Keep transitions consistent and purposeful.
- Avoid distracting or excessive motion.
- Respect reduced-motion settings.
- Ensure interactions remain usable with keyboard and touch.
- Prefer the project's existing animation tools unless there is a justified reason to change them.

## 8. Workflow for substantial tasks

For substantial redesigns, new pages, or cross-cutting frontend work, use this workflow:

### Explore
Inspect relevant source files, components, styles, routes, assets, and project instructions. Understand existing behavior before changing it.

### Plan
Summarize the proposed approach, affected files, risks, and verification strategy. Ask for approval when the user requests approval-first work or when the changes are broad, destructive, or architectural.

### Implement
Work in focused increments. Preserve unrelated functionality and avoid opportunistic refactoring.

### Verify
Run relevant linting, type checks, tests, and builds when available. Inspect rendered pages at relevant viewports and themes when browser or screenshot tools are available.

### Refine
Correct concrete issues found during verification. Do not endlessly polish unrelated areas or expand scope without approval.

### Report
Summarize changes, files affected, checks actually run, visual verification performed, and known limitations.

For small, clearly scoped changes, do not impose unnecessary planning ceremony. Make the focused change and verify it appropriately.

## 9. Visual QA checklist

Before declaring a substantial UI task complete, review:

- Does the interface match the requested visual direction?
- Is the primary action or content immediately understandable?
- Is the hierarchy clear?
- Are typography, spacing, and alignment consistent?
- Are components visually and behaviorally coherent?
- Are responsive layouts usable?
- Are all relevant themes handled?
- Are interactive states complete?
- Are accessibility basics addressed?
- Does the implementation preserve existing functionality?
- Has the rendered result been inspected, if tools allow?

## 10. Final principle

Build for the actual product and its users.

Be creative when the brief invites creativity. Be conservative when preserving an established design is important. In every case, prioritize clarity, coherence, accessibility, performance, maintainability, and faithful execution of the user's intent.
