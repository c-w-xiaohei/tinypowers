---
name: test-driven-development
description: Use before implementing feature, bug-fix, refactor, or behavior-changing production code; establishes RED-GREEN-REFACTOR and regression evidence
---

# Test-Driven Development

Write the behavior test first, observe the expected failure, implement the smallest change, and keep the suite green.

## Core Rule

```text
No behavior-changing production code without a failing behavior test first.
```

If production code was written first, remove it and restart from the test unless the user approves an exception. Do not keep the implementation as a template for tests-after.

Ask before making exceptions for throwaway prototypes, generated code, configuration-only changes, or environments where an automated behavior test is not practical.

## Test Necessity

Before RED, name the observable behavior or regression risk. Test production behavior and contracts, not the ritual. Docs, comments, docstrings, formatting, and static wording need no new test unless the text is itself a consumed contract; use the relevant format, type, build, or existing-suite check instead.

## RED

Write one minimal test that states the required behavior:

- clear behavior-focused name;
- one reason to fail;
- real production behavior, with mocks only at unavoidable boundaries;
- desired public interface rather than implementation details.

Run it and confirm:

- it fails rather than errors;
- the failure message is expected;
- it fails because behavior is missing or wrong, not because of a test defect.

A test that passes immediately does not establish regression evidence. Correct the test or demonstrate the failure by reverting the relevant fix.

## GREEN

Implement the simplest production change that satisfies the test. Do not add adjacent features, speculative options, or unrelated refactors.

Run the focused test, then the relevant surrounding tests. Confirm zero failures and investigate new warnings or errors.

## REFACTOR

Only while green:

- remove duplication;
- improve names and structure;
- keep behavior unchanged;
- rerun affected tests.

Repeat with the next behavior.

## Test Quality and Design

Good tests demonstrate observable behavior and survive implementation refactors. Hard-to-test code can reveal excessive coupling or a poor public interface, but test convenience alone does not justify a new production seam.

```typescript
// Good: verifies caller-visible behavior.
test('rejects an empty email', async () => {
  const result = await submitForm({ email: '   ' });
  expect(result.error).toBe('Email required');
});

// Bad: verifies an implementation call.
test('calls the validator', async () => {
  await submitForm({ email: '   ' });
  expect(validateEmail).toHaveBeenCalled();
});
```

Before adding mocks, fakes, helpers, dependency injection, or production methods for tests, read [testing-anti-patterns.md](testing-anti-patterns.md). Never add a production field, API, or lifecycle solely because tests need access; verify a real production caller or keep the seam internal to tests.

## Completion Evidence

Report:

- RED command, relevant failure, and why it was expected;
- GREEN command and result;
- relevant surrounding suite result;
- any behavior or edge case not covered.

Use `verification-before-completion` before claiming the behavior fixed or complete.
