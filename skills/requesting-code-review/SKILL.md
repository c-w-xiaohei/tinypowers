---
name: requesting-code-review
description: Use when independent review is needed for completed code, substantial behavior changes, cross-module work, or before integration; also governs how review findings are verified and acted on
---

# Requesting Code Review

Treat independent review findings as evidence to evaluate, not commands to implement.

## When Review Adds Value

Request independent review when a change:

- crosses module or runtime boundaries;
- changes public APIs, schemas, persistence, concurrency, authorization, billing, or security;
- is large, hard to reason about, or difficult to reverse;
- completes multi-task integration;
- is explicitly requested.

A trivial non-behavioral change may use self-review plus verification. SDD owns when task and integration reviews occur.

## Review Packet

Give the reviewer:

- current requirements, binding decisions, and non-goals;
- description of the implemented behavior;
- current revision or changed worktree paths;
- relevant project rules, callers, runtime facts, and acceptance checks;
- explicit review scope.

Use [code-reviewer.md](code-reviewer.md). The reviewer reads source and changes directly; producer reports are leads, not proof.

## Evaluate Findings Before Acting

Read and understand all findings, then verify each against this codebase. Check:

- Does it map to a binding requirement?
- Did the current change introduce it?
- Is there a real caller or reproducible path?
- Would the suggestion break existing behavior or a user decision?
- Is it needed now, or is it speculative expansion?
- Did the reviewer have enough context?

Ask for clarification when the finding is unclear. If it cannot be verified, state that and the missing evidence. Push back with code, tests, callers, or project rules when it is wrong.

## Finding Classification

Classify before dispatching a fix:

| Class | Meaning | Action |
| --- | --- | --- |
| `acceptance-gap` | Requested behavior is missing or wrong | Fix |
| `revision-regression` | Current changes introduced a defect | Fix |
| `source-conflict` | Finding conflicts with a binding source or requires a new decision | Ask the user |
| `adjacent-or-pre-existing` | Valid concern outside current scope | Record; do not expand automatically |
| `false-positive` | Finding is not supported by the codebase | Reject with evidence |

Severity describes impact if a finding is valid; it does not decide scope. Security, data-loss, or correctness risks still require evidence linking them to a real path.

Record blocking decisions in one line:

```text
Finding -> class -> evidence -> action
```

## Recheck

After accepted fixes, recheck only:

- whether those findings are closed;
- whether their fixes introduced direct regressions.

Resume the original reviewer when possible. New adjacent concerns return to classification rather than reopening a broad review.
