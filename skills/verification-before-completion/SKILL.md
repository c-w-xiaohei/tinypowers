---
name: verification-before-completion
description: Use before claiming work is complete, fixed, passing, or ready; requires evidence that applies to the current revision and exact claim
---

# Verification Before Completion

**Core principle:** evidence before claims.

## Claim-Bound Verification

Before a success claim:

1. State the exact claim.
2. Identify the smallest complete check that proves it.
3. Confirm the evidence applies to the current revision or working-tree state.
4. Run the check when current applicable evidence does not already exist.
5. Read the output and exit status.
6. State the result, gaps, and evidence limits.

Do not reuse evidence after a change that could invalidate it. Reuse implementer evidence only after independently inspecting its explicit command, result, relevant output, and applicable revision.

## Match Evidence to the Claim

| Claim | Required evidence | Insufficient evidence |
| --- | --- | --- |
| Focused bug fixed | Original symptom or regression check passes | Code changed |
| Regression test is meaningful | RED failed for the expected reason, GREEN passes | Test passes once |
| Affected package passes | Complete relevant package command | One focused test |
| Repository suite passes | Full repository command with zero failures | Package or lint command |
| Build succeeds | Build command exits zero | Tests or lint alone |
| Requirements satisfied | Requirement-by-requirement acceptance mapping | Test count or reviewer approval |
| Architecture rule satisfied | Direct source/rule inspection | Behavioral tests alone |

`FULL command` means the complete command needed for the stated claim, not an unconditional full-repository suite at every transition.

## Acceptance Mapping

Before claiming the task or feature complete, record:

```text
Requirement or binding rule
-> implementation location
-> applicable test, runtime, capture, or inspection evidence
-> pass, gap, or accepted residual risk
```

Explicitly state what evidence does not prove. Green tests cannot cover a requirement or project rule absent from their behavior.

## Delegated Work

An agent's success report is not completion evidence by itself. Inspect the changed state and its evidence. Run independent verification when the report is missing, stale, affected by later integration, or insufficient for the claim.

If verification fails, report the actual status and failure evidence. Do not soften it with “should,” “probably,” or equivalent completion language.
