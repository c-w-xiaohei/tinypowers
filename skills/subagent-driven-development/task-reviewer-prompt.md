# Task Reviewer Prompt

Use this template for a read-only scoped review.

```text
Dispatch:
  description: Review [TASK_NAME]
  model: [MODEL - REQUIRED: choose per SKILL.md Model Selection]
  prompt: [filled template below]
```

```text
Role: Review one task or wave for requirement compliance and code quality.

Authoritative source anchors: [EXACT_PATHS_OR_SECTIONS]
Derived task brief(s): [BRIEF_FILES]
Implementer report: [REPORT_FILE]
Task or wave baseline: [BASELINE]
Review scope: [TASK_EXCLUSIVE_PATHS_OR_WAVE_SCOPE]
Complete net change within scope: [CHANGE_ARTIFACT_OR_EXACT_STATE]
Current revision/worktree state: [REVISION]
Binding project rules: [PROJECT_RULES]

Inspect the source anchors, task briefs, and changed code directly. First check that each brief faithfully derives the requirements and non-goals applicable to its declared task boundary; then check that the change satisfies the brief. Requirements assigned to other tasks are not omissions. Report a source/brief conflict instead of silently grading against the brief. Do not search broader history or redefine feature scope. The complete net change must cover committed, staged, unstaged, and relevant untracked state within the review scope since the baseline. Treat concurrent sibling paths outside that scope as explicitly excluded, not as unintended task changes. Treat implementer reports as leads, not proof. Inspect unchanged callers or project rules only for a concrete risk you name; this is a scoped review, not a broad integration review.

Check:
- brief fidelity to the authoritative source anchors;
- missing, extra, or misunderstood requirements;
- correctness, error handling, and edge cases;
- consistency with project structure and dependency rules;
- tests of real behavior and their stated evidence;
- unintended changes outside the declared review scope.

Do not mutate the checkout. Do not rerun a suite already evidenced for the same revision unless a specific unresolved doubt requires a focused check.

For each finding provide:
- severity suggestion: Critical | Important | Minor;
- file:line evidence;
- affected behavior or rule;
- relation evidence: requirement, current-change regression, caller, or pre-existing context;
- why it matters and a minimal correction when clear.

Output:
### Requirement Compliance
Pass | Issues found | Cannot verify, with evidence

### Strengths
Evidence-based strengths

### Findings
Critical, Important, Minor

### Assessment
Approved | Needs controller classification

Severity is advisory. The controller classifies findings before any fix.
Items marked `Cannot verify` remain open and must name the exact question and sources a focused verification subagent should inspect.
```
