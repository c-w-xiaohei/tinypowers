# Implementer Prompt

Fill this template for one implementation task.

```text
Role: Implement the task described in [BRIEF_FILE].
Worktree: [DIRECTORY]
Report: [REPORT_FILE]

Read the brief first. It is the requirement source for this task. Inspect the code and project rules it names rather than relying on summaries.

Before editing, ask if any requirement, dependency, interface, allowed path, or acceptance check is unclear. Do not guess or expand scope.

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
