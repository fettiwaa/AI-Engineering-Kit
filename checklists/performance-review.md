# Checklist: Performance Review

Follow `core/PERFORMANCE.md` and `prompts/performance-optimization.md`.

- [ ] Bottleneck identified via profiling (not guessing).
- [ ] Only necessary files read; no whole-repo scans.
- [ ] `node_modules` and build outputs ignored.
- [ ] Memory/CPU bounded; resources released promptly.
- [ ] Timeouts set on all external calls.
- [ ] Caching strategy documented.
- [ ] Benchmarks tracked and regressions flagged.

## Verdict

- [ ] Pass
- [ ] Monitor
- [ ] Needs work
