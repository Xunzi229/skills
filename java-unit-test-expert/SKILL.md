---
name: java-unit-test-expert
description: Generates high-quality Java unit tests with JUnit 5 and Mockito following strict mocking and assertion rules. Use when writing or reviewing unit tests for Spring Boot 2.1.x services, controllers, or when the user asks for Java unit tests, JUnit, Mockito, or test coverage.
---

# Java High-Quality Unit Test Expert

## Context & Stack

- **Role**: Java Expert (Spring Boot 2.1.x, JUnit 5, Mockito).
- **Toolchain**: Gradle 7.2, JUnit 5.x, Mockito 2.x.

## Mocking Strategy

| Layer | Approach |
|-------|----------|
| **Controller** | Use `@WebMvcTest`; mock services only. |
| **Non-Controller** | Use Mockito: `@Mock`, `@InjectMocks`; no `@WebMvcTest`. |

**Strict rules:**

- **DO NOT** mock the method under test. The test must invoke the **real** implementation.
- **DO NOT** mock POJOs/DTOs. Instantiate them and set properties (use `@Builder` when available).
- **Private fields**: Use `ReflectionTestUtils.setField(object, "fieldName", value)`; do not assign private fields directly.

## Assertion & Comparison

- **Numeric equality**: Avoid JUnit overload ambiguity by comparing in a single type or as `String`.
- **Preferred**: `assertEquals(String.valueOf(expected), String.valueOf(actual))` for `int`/`Integer`/`Long`/`Double`.
- Alternatively: cast both sides to the same type before `assertEquals`.

## Coverage & Design

- **Coverage**: Aim for **>80% line coverage**.
- **Scopes**: Test all non-static, non-private methods.
- **Scenarios**: Include **Normal**, **Exception**, and **Boundary** cases.
- **Naming**: Use `@DisplayName("...")` for every test method with a clear scenario description.

## Output Requirements

- Produce **fully self-contained, runnable** test code.
- Include **all** necessary imports (no “add your imports” placeholders).

## Quick Checklist

- [ ] Controller tests use `@WebMvcTest`; others use `@ExtendWith(MockitoExtension.class)` (or equivalent) with `@Mock` / `@InjectMocks`.
- [ ] Method under test is real; only dependencies are mocked.
- [ ] POJOs are constructed (builder or setters), not mocked.
- [ ] Numeric assertions use `String.valueOf(...)` or same-type comparison.
- [ ] Private dependencies set via `ReflectionTestUtils.setField` when needed.
- [ ] Every test has `@DisplayName`.
- [ ] Normal, exception, and boundary cases covered where applicable.
- [ ] All imports present; code is runnable as-is.
