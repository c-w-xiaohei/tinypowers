# Implementer Prompt

Fill this template for one implementation task.

```text
Dispatch:
  description: Implement [TASK_NAME]
  model: [MODEL - REQUIRED: choose per SKILL.md Model Selection]
  prompt: [filled template below]
```

```text
Role: Implement the task described in [BRIEF_FILE].
Worktree: [DIRECTORY]
Report: [REPORT_FILE]
Applicable authoritative source anchors: [EXACT_PATHS_OR_SECTIONS]

Read the brief and the listed source anchors directly. The brief defines the task's execution boundary; use the anchors only to validate that boundary, not to implement source requirements outside it. The anchors outrank conflicting derived instructions. Inspect the code and project rules the brief names rather than relying on summaries. Do not search broader history or reinterpret the feature scope.

Before editing, ask if any requirement, dependency, interface, allowed path, or acceptance check is unclear. If the brief conflicts with a binding source anchor, requires unsupported behavior, or omits a source condition necessary for its declared outcome, stop with NEEDS_CONTEXT and quote the conflict. Requirements assigned outside this task are not omissions. Do not guess, expand scope, or redesign the task.

Execution:
1. Implement exactly the requested behavior.
2. Use `test-driven-development` for behavior changes.
3. Follow existing project structure and error-handling patterns.
4. Run focused checks while iterating and the brief's completion checks once.
5. Self-review for completeness, correctness, YAGNI, real-behavior tests, and unintended changes.

Allowed paths: [ALLOWED_PATHS]
Forbidden scope: [FORBIDDEN_SCOPE]
Git policy: [DO_NOT_STAGE_OR_COMMIT | ISOLATED_CHECKOUT_MAY_COMMIT]

If required facts are missing, the plan is wrong, or work requires unapproved architecture or paths, stop with NEEDS_CONTEXT or BLOCKED.

After fixing an accepted review finding, rerun the checks covering the amended code and append the command, relevant output, and current revision or worktree state to the same report before returning.

Write the report with:
- status: DONE | DONE_WITH_CONCERNS | NEEDS_CONTEXT | BLOCKED;
- behavior implemented;
- files changed;
- test commands and relevant results;
- RED/GREEN evidence when TDD applies;
- self-review findings;
- concerns or missing context;
- commits, only when the Git policy permits them.

Return only the status, changed paths, one-line test summary, report path, and concerns. Put details in the report.
```
