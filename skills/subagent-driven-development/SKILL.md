---
name: subagent-driven-development
description: Use when executing an implementation plan with tasks that can be delegated and independently checked in the current session
---

# Subagent-Driven Development

Execute a prepared plan with fresh context for new work, focused implementers, maximum safe concurrency, independent feedback, targeted correction, and evidence-based completion.

## Preconditions

Before dispatching, confirm the plan states:

- the current goal and binding requirements;
- non-goals and superseded decisions;
- required runtime, caller, storage, and module facts;
- task dependencies and acceptance checks.

Read the plan's cited source before treating the plan or a derived brief as authoritative. If its binding decisions, non-goals, or superseded directions conflict with the plan, present the conflicting source text to the user before implementation.

If implementation depends on an unresolved fact, stop and return to discovery rather than guessing it into a task. If plan text conflicts with a binding user or project decision, present the conflict to the user before execution.

## Task Graph and Parallel Waves

Read the plan once, create todos, and map dependencies into waves. Merge tightly coupled tasks that share files, mutable state, an unstable interface, schema, or runtime ownership.

Parallel execution is the default. Dispatch every ready, non-conflicting task in the same response. Use `dispatching-parallel-agents` as the canonical independence policy. Integrate and review a wave before releasing tasks that depend on it.

In a shared checkout:

- give each writer exclusive paths;
- prohibit staging and committing in implementer prompts;
- let the controller integrate the wave.

Parallel writers may commit only in isolated checkouts with one integration owner. Never let concurrent agents compete for the same index, HEAD, mutable test resource, or generated output.

Before each writer wave, record the baseline needed to reconstruct the complete net change for each task or wave. Review committed work from its recorded `BASE` through `HEAD`, never only `HEAD~1`; for shared uncommitted work, include all tracked and relevant untracked changes within the task's exclusive paths or the wave's declared scope, and identify concurrent sibling paths as out of scope.

## Execution Loop

For each ready wave:

1. Create one self-contained task brief per implementer.
2. Dispatch new tasks to fresh implementers, in parallel when independent.
3. Resolve statuses and integrate completed work.
4. Run focused checks covering the integrated wave.
5. Request scoped review when required by Review Proportionality.
6. Send `Cannot verify` items to a focused subagent for direct verification.
7. Classify findings before dispatching fixes.
8. Resume implementers for accepted fixes and reviewers for targeted rechecks.
9. Mark tasks complete only when acceptance and quality gates are satisfied.

Continue without routine check-ins. A task-local blocker pauses only that task and its dependents; recompute the ready set and continue all unaffected work. Ask the user only when no further independent progress is possible, batching unrelated decisions into one question. Stop immediately when a blocker invalidates shared assumptions, creates a source conflict, or makes continued work unsafe.

## Handoffs

Use [implementer-prompt.md](implementer-prompt.md). A task brief is the task's execution boundary, not a replacement for authoritative requirements. It should contain:

- task outcome and context;
- the exact authoritative source anchors applicable to the task;
- binding requirements and non-goals;
- interfaces and dependencies from prior waves;
- allowed paths and forbidden scope;
- acceptance checks and report path.

Each brief must restate the applicable Global Constraints, requirements, non-goals, known facts, and binding decisions as well as the selected task. Cite only the source paths or exact sections needed to validate that boundary; do not make a fresh implementer reconstruct it from earlier tasks or session history.

Use file artifacts for detailed briefs and reports so controller context does not accumulate repeated task history. The implementer returns only status, changed paths, test summary, report path, and concerns.

## Implementer Status

- **DONE:** inspect the report and changed paths, then integrate.
- **DONE_WITH_CONCERNS:** resolve correctness or scope concerns before review; record non-blocking observations.
- **NEEDS_CONTEXT:** provide the missing information and resume the same task.
- **BLOCKED:** provide context, use a more capable model, regroup the task, or ask the user if the plan is wrong.

Do not ignore an escalation or blindly retry unchanged instructions.

## Fresh and Resume

- New task or first independent reviewer: fresh session.
- Same task `NEEDS_CONTEXT`, empty return, or transient failure: resume the original session.
- Accepted finding fix on the same task: resume the original implementer.
- Targeted recheck of the same finding: resume the original reviewer.
- Deleted session or capability mismatch: use a fresh session with an explicit handoff.

On OpenCode, resume by passing the original `task_id`. Ordinary implementation, review, and audit subagent sessions are not disposable test sessions.

## Review Proportionality

- Single trivial change with no logic, control-flow, security, schema, persistence, or API impact: self-review plus verification.
- Ordinary single-task behavior change: one scoped task review; do not repeat the same scope as a final review.
- Multi-task, cross-module, or high-impact change: scoped task or wave reviews plus one final integration review.

Use [task-reviewer-prompt.md](task-reviewer-prompt.md) for scoped review and `requesting-code-review`'s [code-reviewer.md](../requesting-code-review/code-reviewer.md) for integration review.

Give reviewers the applicable authoritative source anchors, the derived plan or brief, and evidence, not conclusions. Reviewers check source-to-brief fidelity before brief-to-change fidelity. Do not tell them what not to flag or cap a finding's severity; classify findings only after review returns.

## Findings and Fixes

Reviewer severity does not authorize implementation. Before dispatching any blocking fix, apply the finding classification and action owned by `requesting-code-review`.

Re-review only the accepted finding set and direct regressions from its fix. A newly discovered adjacent concern returns to classification; it does not automatically open another broad review wave.

`Cannot verify` remains open. Dispatch a focused subagent with the requirement, relevant sources, and exact question; then classify its evidence as a gap, satisfied requirement, source conflict, or residual risk. The controller schedules and records the transition but does not perform the verification or implementation itself.

After an accepted fix, require the implementer to update the report with the covering command, relevant output, and current revision or worktree state. Do not dispatch the targeted recheck until that evidence is present.

## Model Selection

Use the least capable model that reliably handles the role:

- complete-code transcription or a single-file mechanical fix: fast model;
- implementers working from prose, multi-file integration, debugging, and scoped reviewers: standard model or stronger;
- architecture, subtle concurrency, and broad integration review: strongest available model.

Specify the model explicitly in every dispatch. Omitting it may inherit the session default and bypass this selection. Turn count and failed retries can cost more than a stronger model.

## Progress and Completion

Use a durable progress file only when execution may span compaction or multiple days. When needed, store it at `.superpowers/sdd/progress.md`, record the plan and worktree identity plus each task or wave's gate state, and update it immediately after a task passes acceptance and review. On start or resume, read it and reconcile every entry with the current revision and worktree before dispatching more work.

After all waves:

1. Run any required integration review once.
2. Resolve accepted blocking findings with targeted rechecks.
3. Use `verification-before-completion` to map every binding requirement to current evidence, a gap, or an accepted residual risk.
4. Report verification and worktree state. Do not commit, push, merge, or create a PR unless requested.
