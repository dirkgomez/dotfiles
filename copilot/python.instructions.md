---
applyTo: "**/*.py"
---
Coding standards, domain knowledge, and preferences that AI should follow.


## Testing

Use PyTest as the testing framework.

Include tests for:
1. Normal expected inputs
2. Edge cases
3. Invalid inputs


Please consider:
- Error handling
- Edge cases
- Performance optimization
- Best practices for Python

Best practices for PyTest:

1. Use descriptive test function names to clearly indicate what is being tested.
2. Group related tests into classes or modules for better organization.
3. Use fixtures to set up and tear down test data or state.
4. Keep tests independent; avoid dependencies between tests.
5. Use parameterization to test multiple input values efficiently.
6. Assert expected outcomes clearly and specifically.
7. Test both positive (expected) and negative (error/edge) cases.
8. Avoid using print statements; rely on PyTest's reporting.
9. Keep tests fast and focused on a single behavior.
10. Use marks (e.g., @pytest.mark.skip, @pytest.mark.parametrize) to control test execution when needed.
11. Name parametrized tests clearly to indicate the parameters being tested.

Please do not unnecessarily remove any comments or code.

Generate the code with clear comments explaining the logic.

Please do not use any external libraries unless specified.

Please do not use any deprecated libraries or functions.

