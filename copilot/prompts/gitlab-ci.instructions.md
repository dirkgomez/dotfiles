---
description: 'Gitlab-ci.yaml coding conventions and guidelines'
applyTo: '.gitlab-ci.yaml'
---

> **Note**: This document serves as GitHub Copilot instructions for GitLab CI/CD configuration files. It automatically applies to the `.gitlab-ci.yaml` file in this repository.

# GitLab CI/CD Configuration Standards & Best Practices

Comprehensive coding standards, domain knowledge, and preferences for writing world-class GitLab CI/CD configuration files.

---

## Table of Contents
1. [Core Principles](#core-principles)
2. [Job Definitions](#job-definitions)
3. [Stages](#stages)
4. [Variables](#variables)
5. [Artifacts and Caching](#artifacts-and-caching)
6. [Scripts](#scripts)
7. [Best Practices](#best-practices)
8. [Security](#security)
---

## Core Principles
1. **Clarity over complexity**: Make CI/CD configurations easy to understand
2. **Modularity**: Break down jobs into reusable components
3. **Efficiency**: Optimize job execution time and resource usage
4. **Maintainability**: Write configurations that are easy to update and extend
5. **Version Control**: Keep CI/CD configurations under version control for traceability
---

## Job Definitions
- Use clear and descriptive job names.
- Define `stage`, `script`, `tags`, and `only/except` policies explicitly.
- Use `extends` to reuse common job definitions.
---

## Stages
- Define stages in a logical order (e.g., `build`, `test`, `deploy`).
- Ensure jobs are assigned to appropriate stages.
---

## Variables
- Use CI/CD variables for sensitive data and configuration settings.
- Define global variables at the top level and job-specific variables within jobs.
---
## Artifacts and Caching
- Use `artifacts` to store build outputs and test results.
- Implement `cache` to speed up job execution by reusing dependencies.
---
## Scripts
- Keep scripts concise and focused on a single task.
- Use multi-line scripts for better readability.
---
## Best Practices
- Regularly review and refactor CI/CD configurations.
- Document complex job logic with comments.
- Monitor job performance and optimize as needed.
---
## Security
- Avoid hardcoding sensitive information in the configuration file.
- Use protected variables and environments for sensitive operations.