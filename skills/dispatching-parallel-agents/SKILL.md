---
name: dispatching-parallel-agents
description: Use when two or more ready tasks can proceed independently without shared mutable state, overlapping writes, or unmet dependencies
---

# Dispatching Parallel Agents

Parallelize independent work by problem domain, maximizing safe concurrency rather than agent count.

## Independence Test

Dispatch all currently ready, non-conflicting tasks in the same response. Tasks are independent only when they have:

- no unmet dependency on another task's result;
- no overlapping writes;
- no shared mutable state, test resource, or environment;
- no shared schema, runtime, or interface decision still changing.

Group coupled work under one agent. Serialize dependency chains. When uncertain whether failures share a root cause, investigate their relationship before splitting them.

## Read-Only and Writer Tasks

Read-only investigations may run in parallel by problem domain.

Writers may run in parallel with exclusive ownership. In a shared checkout, they must not stage or commit concurrently; integrate after the wave. In isolated checkouts, they may commit independently under one integration owner.

## Prompt Contract

Each task prompt must state:

- one focused scope and goal;
- relevant context and evidence;
- allowed and forbidden changes;
- expected result and report.

Do not pass the session's accumulated history. Give the agent the sources, interfaces, constraints, and evidence needed for its domain.

## Integration

After the wave returns:

1. Inspect every result and changed path.
2. Check for conflicts, invalid assumptions, and shared effects.
3. Integrate the wave.
4. Run verification covering the combined result.

Do not treat successful isolated reports as proof that the integrated system works.
