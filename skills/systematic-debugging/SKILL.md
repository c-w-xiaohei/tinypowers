---
name: systematic-debugging
description: Use when a bug, test failure, build failure, performance issue, or unexpected behavior needs diagnosis before a fix is proposed
---

# Systematic Debugging

Find and verify the root cause before changing production behavior. Random fixes hide evidence and create secondary failures.

## Choose the Shortest Valid Path

```text
Root cause already supported by evidence:
    reproduce -> fix -> verify

Root cause unknown:
    investigate -> hypothesize -> test -> fix -> verify
```

“Obvious” is not evidence. A stable reproduction, trace, failing test, or direct code path may be.

## 1. Investigate

- Read the complete error, stack trace, paths, and warnings.
- Reproduce consistently and record exact conditions.
- Inspect recent changes and environmental differences.
- Trace bad data or control flow backward to its source.
- Find a working analogue and compare relevant differences.

For a multi-component path, gather evidence at the boundaries: input, output, configuration, state, commit point, and retry/lifecycle owner. Instrument only the boundaries needed to locate the failure.

When a deep call chain hides the origin, read [root-cause-tracing.md](root-cause-tracing.md). For timing failures, use [condition-based-waiting.md](condition-based-waiting.md) instead of increasing arbitrary delays.

## 2. Form and Test One Hypothesis

State:

```text
I think [root cause] because [evidence].
```

Test the smallest possible change or observation that distinguishes this hypothesis. Change one variable. If it fails, discard the hypothesis and return to investigation instead of stacking fixes.

If you do not understand a dependency or result, say so and gather the missing evidence.

## 3. Implement the Root-Cause Fix

1. Create the smallest failing reproduction, preferably an automated test.
2. Use `test-driven-development` for the behavior fix.
3. Make one focused change at the source of the problem.
4. Avoid “while here” improvements and bundled refactors.
5. Verify the original symptom and relevant regressions.

After three failed hypotheses that expose new coupling, shared state, or symptoms, stop, reconsider the model, and discuss the architecture with the user instead of applying a fourth speculative patch.

## Defense in Depth

After the root cause is known, add validation at other boundaries only when it protects a real failure mode or improves diagnosis. Read [defense-in-depth.md](defense-in-depth.md) when the fix needs boundary validation; do not add layers mechanically.

Use `verification-before-completion` before claiming the issue fixed.
