---
name: writing-plans
description: Use when you have a spec or requirements for a multi-step task, before editing code
---

# Writing Plans

Write an implementation plan that a capable engineer with little project context can execute correctly. Preserve requirements, expose dependencies, and make verification concrete.

## Readiness Gate

Before planning implementation, confirm:

- the original requirement source;
- the requested outcome and binding decisions;
- explicit non-goals and superseded directions;
- runtime, storage, caller, module, and interface facts required by the design;
- acceptance checks for the requested behavior.

If implementation depends on an unresolved fact, return `DISCOVERY_REQUIRED` and name the missing evidence. Do not turn assumptions into precise files, interfaces, or code.

## Scope and Structure

If requirements span independent subsystems, propose separate plans that each produce working, testable software.

Before tasks, map files and responsibilities:

- follow established project structure and dependency direction;
- keep code that changes together close;
- split by responsibility, not arbitrary technical layers;
- do not introduce restructuring unrelated to the requested change.

## Task Boundaries

A task is the smallest independently testable deliverable worth a separate implementation handoff. Fold setup, configuration, and documentation into the task that needs them. Split only when one task can be accepted or rejected independently of its neighbor.

Order tasks by dependency. Identify tasks that can run concurrently without overlapping writes, shared mutable state, or unstable interfaces.

## Plan Format

Save plans to the user-requested location, or `docs/tinypowers/plans/YYYY-MM-DD-<feature-name>.md` by default.

```markdown
# [Feature] Implementation Plan

**Source:** [Original request, conversation, issue, or specification]

**Goal:** [Requested outcome]

**Approach:** [Short implementation approach]

## Global Constraints
- [Project-wide constraint, with exact values copied from the source]

Every task's requirements include this section.

## Requirements and Scope
- [Detailed original requirement]
- [Included behavior and boundaries]
- [Binding user or project decision]

## Non-goals
- [Explicitly excluded work]

## Known Facts
- [Runtime/caller/module fact and source]

## Tasks

### Task N: [Deliverable]

**Depends on:** [Task IDs or none]

**Files:**
- Create: `exact/path`
- Modify: `exact/path:relevant area`
- Test: `exact/test/path`

**Interfaces:**
- Consumes: [stable signatures or artifacts]
- Produces: [stable signatures or artifacts]

**Requirements:**
- [Task-specific behavior and non-goals]
- [Every applicable Global Constraint]

**Steps:**
- [ ] If meaningful behavior changes, write the failing behavior test; otherwise state why no new test is needed.
- [ ] Run the failing test; expect [failure proving missing or wrong behavior].
- [ ] Implement the minimal change. When the shape is not obvious, include the exact code or pseudocode under this step.
- [ ] Run `[focused command]`; expect [result].
- [ ] Run `[integration command if needed]`; expect [result].

**Acceptance:**
- [Observable behavior or direct rule check]
```

## Detail Standard

- Each checklist step is one action. Split multi-part implementation into ordered steps.
- Use exact paths, commands, values, signatures, and expected outcomes when known.
- Include enough implementation detail to prevent rediscovery, but do not duplicate obvious code mechanically.
- Never use `TBD`, vague “handle errors,” unspecified “write tests,” or references to undefined interfaces.
- Prefer observable behavior and project rules over implementation trivia.
- Do not require commits; Git actions follow user and project instructions.

## Self-Review

Before handoff:

1. Map every source requirement and scope boundary to at least one task, acceptance check, or explicit non-goal.
2. Confirm non-goals are not implemented by the plan.
3. Check task dependency and interface consistency.
4. Remove placeholders and unsupported assumptions.
5. Confirm parallel tasks satisfy `dispatching-parallel-agents` independence rules.

Then offer execution with `subagent-driven-development`.
