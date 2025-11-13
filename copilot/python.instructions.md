---
applyTo: "**/*.py"
---
Coding standards, domain knowledge, and preferences that AI should follow.

## Python Coding Standards

Please follow these Python coding standards:

1. **PEP 8 Compliance**: Follow the PEP 8 style guide for Python code, including naming conventions, indentation, and line length.
2. **Docstrings**: Use docstrings to document functions, classes, and modules. Include a brief description of the purpose, parameters, and return values.
3. **Type Annotations**: Use type annotations for function parameters and return types to improve code readability and maintainability.
4. **Error Handling**: Implement proper error handling using exceptions. Avoid using bare `except` clauses; specify the exception type.
5. **Avoid Global Variables**: Minimize the use of global variables. Use function parameters and return values to pass data.
6. **Use List Comprehensions**: Prefer list comprehensions for creating lists when appropriate, as they are more concise and often more efficient.
7. **Avoid Magic Numbers**: Use named constants instead of magic numbers to improve code readability.
8. **Use Meaningful Names**: Use descriptive names for variables, functions, and classes to make the code self-documenting.
9. **Keep Functions Small**: Write small, focused functions that do one thing well. This improves readability and testability.
10. **Use Context Managers**: Use context managers (the `with` statement) for resource management, such as file handling, to ensure proper cleanup.
11. **Avoid Side Effects**: Functions should not have side effects that affect global state or other functions unless explicitly intended.
12. **Testing**: Write unit tests for your code using a testing framework like `unittest` or `pytest`. Ensure that tests cover both normal and edge cases.
13. **Performance Considerations**: Optimize for performance where necessary, but prioritize readability and maintainability. Use profiling tools to identify bottlenecks.
14. **Version Control**: Use version control (e.g., Git) to manage code changes. Write clear commit messages that describe the changes made.

# Example Python Code Following the Standards
```python
def calculate_factorial(n: int) -> int:
    """
    Calculate the factorial of a non-negative integer n.

    :param n: A non-negative integer for which to calculate the factorial.
    :return: The factorial of n.
    :raises ValueError: If n is negative.
    """
    if n < 0:
        raise ValueError("Input must be a non-negative integer.")

    if n == 0 or n == 1:
        return 1

    result = 1
    for i in range(2, n + 1):
        result *= i

    return result
```

Where possible, prefer duck-typing tests than isinstance, e.g. hasattr(x, attr) not isinstance(x, SpecificClass)

Prefer f-strings for formatting strings rather than .format or % formatting

When creating log statements, never use runtime string formatting. Use the extra argument and % placeholders in the log message

Please do not unnecessarily remove any comments or code.

Generate the code with clear comments explaining the logic.

Please do not use any external libraries unless specified.

Please do not use any deprecated libraries or functions.



## Testing

Use PyTest as the testing framework.

Include tests for:
- Normal expected inputs
- Edge cases
- Invalid inputs


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

