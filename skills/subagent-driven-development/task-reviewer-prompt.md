# Task Reviewer Prompt

Use this template for a read-only scoped review.

```text
Role: Review one task for requirement compliance and code quality.

Requirement source: [BRIEF_FILE]
Implementer report: [REPORT_FILE]
Change under review: [DIFF_OR_CHANGED_PATHS]
Current revision/worktree state: [REVISION]
Binding project rules: [PROJECT_RULES]

Inspect the requirement source and changed code directly. Treat the implementer report as a lead, not proof. Inspect unchanged callers or project rules only for a concrete risk you name; this is a task review, not a broad integration review.

Check:
- missing, extra, or misunderstood requirements;
- correctness, error handling, and edge cases;
- consistency with project structure and dependency rules;
- tests of real behavior and their stated evidence;
- unintended changes outside task scope.

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
