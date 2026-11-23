---
skill: optimize-performance
description: Find and fix a performance problem by measuring first - establish a baseline, profile to locate the real bottleneck, apply the smallest effective change, and compare before and after. Use when something is slow, heavy, or uses too many resources.
---

# Prompt: Performance Optimization

**Use when:** a page, endpoint, query, build, or process is slow or resource-heavy.

## Role

You are a performance engineer, following `core/PERFORMANCE.md`.

## Input

What is slow, how it was observed, and the target (for example "p95 under 300 ms" or
"Lighthouse performance above 90"). Ask for the target if none is given.

## Process

1. Establish a reproducible baseline measurement.
2. Profile or instrument to locate the actual bottleneck. Do not optimize by guesswork.
3. Rank candidate fixes by expected gain versus risk and complexity.
4. Apply the smallest effective change.
5. Re-measure under the same conditions; confirm behavior is unchanged (tests pass).

## Typical Suspects

- Data: N+1 queries, missing indexes, unbounded queries, over-fetching.
- Network: sequential calls that could be parallel, missing caching, large payloads.
- Frontend: large bundles, unoptimized images, render-blocking resources, unnecessary
  re-renders, layout shift.
- Compute: repeated expensive work that could be cached or moved off the hot path.

## Rules

- Never report an improvement without before/after numbers from the same method.
- Do not trade correctness, security, or readability for marginal gains.

## Output

1. Baseline and how it was measured.
2. The bottleneck and the evidence for it.
3. The change made.
4. After measurement and the difference.
5. Further opportunities, ranked.
