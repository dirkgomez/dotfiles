---
description: 'Python coding conventions and guidelines'
applyTo: '**/*.py'
---
> **Note**: This document serves as GitHub Copilot instructions for Python development. It automatically applies to all `.py` files in this repository.

# Python Coding Standards & Best Practices

Comprehensive coding standards, domain knowledge, and preferences for writing world-class Python code.

**Target Python Version**: 3.11+ (or 3.12+ for latest features)

**Recommended Tools**:
- **Formatter**: `black` (88 char line length) + `isort` for import sorting
- **Linter**: `ruff` (replaces flake8, pylint, isort - much faster)
- **Type Checker**: `mypy` in strict mode
- **Dependency Management**: `poetry` or `uv` (modern alternatives to pip)

---

## Table of Contents
1. [Core Principles](#core-principles)
2. [Code Style & Formatting](#code-style--formatting)
3. [Type Annotations](#type-annotations)
4. [Modern Python Features](#modern-python-features)
5. [Documentation](#documentation)
6. [Error Handling](#error-handling)
7. [Performance & Optimization](#performance--optimization)
8. [Testing](#testing)
9. [Logging](#logging)
10. [Security](#security)
11. [Dependencies & Environment](#dependencies--environment)

---

## Core Principles

1. **Readability over cleverness**: Code is read far more often than written
2. **Explicit is better than implicit**: Make intentions clear
3. **Simplicity over complexity**: Choose the simplest solution that works
4. **Fail fast**: Detect and report errors early
5. **Write self-documenting code**: Use meaningful names and clear structure
6. **Don't repeat yourself (DRY)**: Extract reusable logic into functions
7. **Single Responsibility Principle**: Functions and classes should do one thing well

---

## Code Style & Formatting

### PEP 8 Compliance
Follow [PEP 8](https://pep8.org/) style guide strictly:
- 4 spaces for indentation (never tabs)
- Max line length: 88 characters (Black formatter default) or 79 (PEP 8)
- 2 blank lines between top-level definitions
- 1 blank line between method definitions
- Imports at the top of the file

### Import Organization
Order imports in three groups, separated by blank lines:
1. Standard library imports
2. Third-party library imports
3. Local application imports

Within each group, sort alphabetically.

```python
# Standard library
import os
import sys
from pathlib import Path
from typing import Any, Optional

# Third-party
import boto3
import pandas as pd
from pydantic import BaseModel

# Local
from myapp.models import User
from myapp.utils import validate_email
```

### Naming Conventions
- Use `snake_case` for variables and functions
- Use `CamelCase` for classes
- Use `UPPER_CASE` for constants

### Whitespace
- Avoid extraneous whitespace in expressions and statements.
- Use a single blank line to separate logical sections of code within functions.

### Comments
- Use `#` for inline comments and `"""` for block comments.
- Write comments in English and use complete sentences.
- Update comments when code changes to avoid misleading information.

---

## Type Annotations
- Use type annotations for all function parameters and return values.
- Use `Optional` for parameters that can be `None`.
- Prefer `List`, `Dict`, `Set`, and `Tuple` from `typing` module over built-in types for annotations.

```python
from typing import List, Dict, Optional

def get_usernames(user_ids: List[int], active_only: bool = True) -> List[str]:
    """
    Get a list of usernames by user IDs.

    :param user_ids: List of user IDs.
    :param active_only: Flag to filter only active users.
    :return: List of usernames.
    """
    ...
```

---

## Modern Python Features
- Use f-strings for string formatting.
- Use `with` statement for resource management.
- Use `enumerate` and `zip` for iterating with counters or multiple iterables.
- Use dictionary and set comprehensions for creating dictionaries and sets.
- Prefer `match`...`case` for pattern matching over `if`...`elif`...`else` chains.

```python
# Bad
for i in range(len(items)):
    print(i, items[i])

# Good
for i, item in enumerate(items):
    print(i, item)

# Pattern matching example
match command:
    case "start":
        start()
    case "stop":
        stop()
    case _:
        print("Unknown command")
```

---

## Documentation
- Use docstrings to document all public modules, classes, and functions.
- Use reStructuredText or Google style for docstrings.
- Include descriptions for parameters, return values, and exceptions.

```python
def divide(a: float, b: float) -> float:
    """
    Divide two numbers.

    :param a: The numerator.
    :param b: The denominator.
    :return: The quotient.
    :raises ZeroDivisionError: If b is zero.
    """
    ...
```

---

## Error Handling
- Use exceptions for error handling, not return codes.
- Define custom exceptions for module-specific errors.
- Use `try`...`except` blocks to handle exceptions, and log the errors.

```python
class MyError(Exception):
    """Base class for other exceptions"""
    pass

class ValidationError(MyError):
    """Raised when there is a validation error"""
    pass
```

---

## Performance & Optimization
- Optimize code only after identifying bottlenecks through profiling.
- Prefer built-in functions and libraries, as they are usually optimized.
- Use lazy evaluation (e.g., generators) for large data sets or expensive computations.
- Consider using `async`/`await` for I/O-bound and high-level structured network code.

```python
# Bad: Eager evaluation, loading all data into memory
data = [load_data(file) for file in files]

# Good: Lazy evaluation, loading data on demand
def read_data(files):
    for file in files:
        yield load_data(file)

# Async example
async def fetch_data(url):
    async with aiohttp.ClientSession() as session:
        async with session.get(url) as response:
            return await response.json()
```

---

## Testing
- Use PyTest as the testing framework.
- Include tests for normal, edge, and invalid inputs.
- Test error handling, edge cases, and performance.
- Follow best practices for writing clear, independent, and efficient tests.
- Use fixtures for setup code, parametrization for multiple input sets, and mocking for external dependencies.

```python
import pytest

@pytest.fixture
def sample_data():
    return [1, 2, 3, 4, 5]

def test_divide(sample_data):
    assert divide(4, 2) == 2
    assert divide(9, 3) == 3

@pytest.mark.parametrize("a,b,expected", [(4, 2, 2), (9, 3, 3)])
def test_divide_parametrized(a, b, expected):
    assert divide(a, b) == expected

def test_divide_zero_division():
    with pytest.raises(ZeroDivisionError):
        divide(4, 0)

def test_divide_mocking(mocker):
    mocker.patch('myapp.module_name.divide', return_value=3)
    assert divide(4, 2) == 3
```

---

## Logging
- Use the `logging` module for logging messages.
- Configure logging level and format in the main entry point of the application.
- Use appropriate log levels: DEBUG, INFO, WARNING, ERROR, CRITICAL.
- Avoid logging sensitive information such as passwords or personal data.

```python
import logging

logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

def process_data(data):
    logging.info("Processing %d items", len(data))
    ...
```

---

## Security
- Validate and sanitize all inputs to prevent injection attacks.
- Use parameterized queries or ORM methods for database access.
- Avoid exposing sensitive information in error messages or logs.
- Use environment variables or configuration files for managing secrets and sensitive data.
- Regularly update dependencies and use security tools to scan for vulnerabilities.

---

## Dependencies & Environment
- Use virtual environments to manage dependencies.
- Pin dependencies to specific versions in `requirements.txt` or `Pipfile.lock`.
- Regularly update dependencies to incorporate security fixes and improvements.
- Use tools like `pip-tools` or `Poetry` for dependency management and to generate lock files.

