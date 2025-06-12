---
title: "QA Automation Engineer Task Template"
description: "Comprehensive prompt template for QA automation engineering tasks with specific context and requirements"
tool: "Cursor/Any IDE"
use_case: "Test Development"
complexity: "Intermediate"
tags:
  - qa-automation
  - testing
  - framework
  - pytest-bdd
  - selenium
date: 2024-03-22
prompt: |
  As a QA Automation Engineer, I need you to:
  
  CONTEXT:
  - Project: [Framework type - pytest-bdd, Selenium, etc.]
  - Technology stack: [Python, specific libraries]
  - Authentication method: [API keys, user credentials, etc.]
  - Existing patterns: [Brief description of current test structure]
  
  TASK:
  - Feature: [Specific feature name]
  - Scope: [API tests, UI tests, or both]
  - Coverage needed: [Smoke, regression, edge cases, negative]
  
  REQUIREMENTS:
  - Follow existing code patterns in [specific directories]
  - Use dynamic data generation (Faker/Mimesis)
  - Implement proper error handling
  - Validate against real API responses (not mocked)
  
  CONSTRAINTS:
  - Time budget: [Expected timeline]
  - Complexity level: [Simple CRUD vs complex workflows]
  - Existing dependencies: [What's already available]
  
  DELIVERABLES:
  1. Feature files with scenarios
  2. Step definitions
  3. API adapters (if needed)
  4. Domain layer enhancements
  5. Working tests with validation
  
  VERIFICATION:
  - All tests must pass on first full run
  - Follow project's custom instructions
  - Include proper documentation
example_input: |
  CONTEXT:
  - Project: pytest-bdd with Selenium WebDriver
  - Technology stack: Python 3.9, pytest, requests, selenium
  - Authentication method: OAuth2 tokens
  - Existing patterns: Page Object Model with BDD scenarios
  
  TASK:
  - Feature: User Registration System
  - Scope: Both API and UI tests
  - Coverage needed: Smoke, regression, negative cases
  
  REQUIREMENTS:
  - Follow patterns in /tests/pages/ and /tests/api/
  - Use Faker for test data generation
  - Implement proper error handling for network failures
  - Validate against staging API responses
  
  CONSTRAINTS:
  - Time budget: 2 days
  - Complexity level: Standard CRUD operations
  - Existing dependencies: pytest-bdd, selenium-webdriver, requests
example_output: |
  Generated files:
  - features/user_registration.feature
  - step_definitions/user_registration_steps.py
  - pages/registration_page.py
  - api/user_api.py
  - domain/user_domain.py
  - conftest.py (updated)
  - README_user_registration.md
tips:
  - "Be specific about the framework and technology stack"
  - "Include authentication details to avoid setup issues"
  - "Specify existing patterns to maintain consistency"
  - "Define clear success criteria for verification"
  - "Include time constraints to manage scope appropriately"
variations:
  - name: "API-Only Focus"
    prompt: |
      As a QA Automation Engineer, I need you to focus specifically on API testing:
      
      CONTEXT: [Same structure but emphasize API testing tools]
      TASK: [Focus only on API endpoints and data validation]
      REQUIREMENTS: [Include API-specific requirements like schema validation]
      DELIVERABLES: [API adapters, domain models, API test scenarios]
    description: "Specialized for API testing scenarios only"
  - name: "Mobile Testing Variant"
    prompt: |
      As a QA Automation Engineer, I need you to adapt this for mobile testing:
      
      CONTEXT: [Include mobile testing framework - Appium, etc.]
      TASK: [Mobile-specific features and gestures]
      REQUIREMENTS: [Device compatibility, mobile-specific patterns]
      DELIVERABLES: [Mobile page objects, device configurations, mobile test scenarios]
    description: "Adapted for mobile application testing"
---

This template provides a structured approach to QA automation engineering tasks, ensuring comprehensive coverage of context, requirements, and deliverables. It's designed to work with various testing frameworks and can be adapted for different types of testing scenarios.

## Key Components

- **Context Setting**: Establishes the technical environment and existing patterns
- **Task Definition**: Clearly defines what needs to be tested and the scope
- **Requirements**: Specifies technical and quality requirements
- **Constraints**: Sets realistic boundaries for the work
- **Deliverables**: Lists expected outputs and artifacts
- **Verification**: Defines success criteria

## Usage Guidelines

1. **Fill in all bracketed placeholders** with specific project details
2. **Be specific about technology stack** to get relevant code patterns
3. **Include authentication details** to avoid integration issues
4. **Reference existing patterns** to maintain code consistency
5. **Set realistic time budgets** to manage scope appropriately

## Best Practices

- Always specify the exact framework and version being used
- Include examples of existing code patterns when possible
- Be clear about data generation requirements (static vs dynamic)
- Specify whether mocking is acceptable or real API calls are required
- Include documentation requirements in deliverables 