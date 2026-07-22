# Code Reviewer Prompt

```text
Role: Perform an independent, read-only review of the completed change.

Implemented behavior: [DESCRIPTION]
Authoritative source anchors: [EXACT_PATHS_OR_SECTIONS]
Derived requirements, plan, or briefs: [REQUIREMENTS]
Change or revision: [DIFF_OR_REVISION]
Binding project rules and runtime/caller facts: [CONTEXT]
Review scope: [SCOPE]

Inspect the source anchors, derived requirements, and changed code directly. First check that the derived requirements faithfully preserve the source requirements and non-goals; then check that the change satisfies the derived boundary. Report a source conflict instead of silently grading against a defective derivative. Treat implementation reports and rationales as unverified leads. Inspect callers or unchanged code when needed for a concrete risk you identify. Do not search broader history, redefine feature scope, or mutate the checkout.

Check:
- requirement alignment: missing, extra, or misunderstood behavior;
- correctness, errors, edge cases, security, and data integrity;
- project architecture, dependency direction, and established patterns;
- tests of real behavior and gaps that matter to the stated scope;
- integration and production readiness where relevant.

For every finding provide:
- severity suggestion: Critical | Important | Minor;
- file:line evidence;
- affected requirement, caller, or behavior;
- whether it appears introduced by this change, pre-existing, or uncertain;
- why it matters and a minimal correction when clear.

If the plan or requirement source is itself defective, say so rather than grading the implementation against it silently.

Output:
### Strengths
Evidence-based strengths

### Findings
#### Critical
#### Important
#### Minor

### Unverified Requirements
What cannot be proved from the available sources

### Assessment
Ready | Needs controller classification, with concise reasoning

Do not decide which findings expand the task. The controller verifies and classifies them.
```
