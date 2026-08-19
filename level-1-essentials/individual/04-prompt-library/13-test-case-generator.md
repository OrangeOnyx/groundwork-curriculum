# Test Case Generator

**Purpose:** Generate a comprehensive test plan for a function or feature.

**When to use:** Before writing tests, or when reviewing test coverage.

**Category:** Engineering

**Model recommendation:** Claude Sonnet — deliberate about edge cases.

---

## The prompt

```
Generate a test plan for:

Feature / function:
{CODE_OR_DESCRIPTION}

Test framework: {FRAMEWORK}

Format:

## Happy path
Numbered test cases. Each: name, input, expected output.

## Edge cases
Numbered. Include: empty inputs, boundary values, unicode, timezone edges, large payloads, concurrent calls.

## Error cases
Numbered. Include: invalid inputs, downstream failures, timeouts, auth failures.

## Not tested (by design)
Bulleted — things you're deliberately not covering, with one-line reasoning.

## Runnable stubs
Code block with `{FRAMEWORK}` test scaffolds for every case above, empty bodies with descriptive names.

Rules:
- Aim for property-based tests where useful.
- Flag flaky-test-prone cases with ⚠️.
```

## Variables

- `{CODE_OR_DESCRIPTION}`, `{FRAMEWORK}`

## Example use case

A `generateLeasePackage()` function.

## Expected output shape

Four categories + code stubs.
