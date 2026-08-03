# Checklist: Production Readiness

Follow `core/AI_WORKFLOW.md` §Production Readiness.

- [ ] SLOs/error budget defined and monitored.
- [ ] Observability in place (structured logs with correlation IDs).
- [ ] Alerting on error rate and latency, not just failures.
- [ ] Capacity and scaling plan documented.
- [ ] Failure modes and fallbacks documented.
- [ ] Secrets managed via a secrets manager (never committed).
- [ ] Dependency audit (`npm audit` / `pip-audit`) clean.
- [ ] Recovery and restore procedures tested.
