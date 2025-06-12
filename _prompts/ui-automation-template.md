---
title: "UI Maintenance Automation Template"
description: "A comprehensive template for automating UI testing with Playwright MCP Server integration"
tool: "Cursor/Playwright"
use_case: "Test Automation"
complexity: "Advanced"
tags:
  - automation
  - testing
  - playwright
  - ui-testing
  - cursor
date: 2024-03-22
prompt: |
  Okay, Cursor, I need you to perform a two-stage task:
  
  Phase 1: Automated Script Generation
  1. **Connect and Navigate:** Use the Playwright MCP Server to navigate to the website `[Specified URL]`. Ensure that the MCP Server is actively handling the browser automation to validate its integration. Do not simulate the tests statically or bypass the MCP Server. All interactions must be routed through MCP.
  
  2. Authenticate: Log in to the application using the provided [User Credentials] or you can use an existing user storage file [Specified storage file].
  
  3. Execute Core Scenario: Perform the actions for the [Name of User Scenario, e.g., "Create a New User" or "Submit a Form"].
     - [High-level action 1, e.g., Navigate to the primary feature area]
     - [High-level action 2, e.g., Interact with UI elements to prepare for the main task]
     - [High-level action 3, e.g., Perform the core function of the scenario]
     - [High-level action 4, e.g., Navigate away or to a results page]
     - [High-level action 5, e.g., Perform a final verification step to confirm the outcome]
  
  4. Capture Output: Save the complete execution trace, including all generated code and action logs, to a designated [Output Directory].
  
  Phase 2: Code Refactoring and Framework Integration
  1. Analyze and Adapt: Review the raw script from the [Output Directory]. Your primary task is to refactor and integrate this code into the project's established test automation framework.
  
  2. Apply Architectural Patterns: Deconstruct the linear script and reorganize it according to the project's design principles. This includes:
     - Separation of Concerns: Abstract UI interactions into page objects, component models, or domain-specific modules.
     - Reusable Logic: Create reusable functions for common actions (e.g., login, search, navigation) and step definitions.
     - BDD Implementation (if applicable): If the framework uses a Behavior-Driven Development (BDD) approach, translate the user scenario into the Gherkin Given/When/Then syntax and implement the corresponding step definition methods.
     - Configuration and Data Management: Replace hardcoded data (like URLs or search terms) with variables managed through configuration files or data-driven methods.
example_input: |
  URL: https://example-app.com/login
  User Credentials: admin/password123
  Scenario: Create New User Account
  Output Directory: ./test-outputs/
example_output: |
  Generated files:
  - raw_script.py (initial automation script)
  - page_objects/login_page.py
  - page_objects/user_management_page.py
  - step_definitions/user_steps.py
  - features/create_user.feature
  - config/test_data.yml
tips:
  - "Replace placeholder values with actual URLs and credentials"
  - "Ensure MCP Server is properly configured before running"
  - "Review generated code for security best practices"
  - "Customize architectural patterns based on your project structure"
variations:
  - name: "API Testing Variant"
    prompt: |
      Modify the template to focus on API testing instead of UI testing:
      - Replace Playwright MCP with API testing tools
      - Focus on endpoint validation and response verification
      - Include authentication token management
    description: "Adapted for API automation testing scenarios"
---

This template provides a structured approach to UI test automation using Cursor and Playwright MCP Server. It follows a two-phase approach: first generating automated scripts, then refactoring them into maintainable, framework-integrated code.

## Key Features

- **MCP Server Integration**: Ensures proper browser automation through MCP
- **Two-Phase Approach**: Separates script generation from code organization
- **Framework Integration**: Adapts to existing project architectures
- **BDD Support**: Includes Gherkin scenario translation when applicable

## Usage Instructions

1. Replace all placeholder values in square brackets with actual values
2. Ensure your Playwright MCP Server is properly configured
3. Specify the target URL and authentication method
4. Define your user scenario with clear, high-level actions
5. Set up the output directory for generated files

## Best Practices

- Always validate MCP Server connectivity before starting
- Use descriptive names for scenarios and actions
- Implement proper error handling in generated code
- Follow your project's existing architectural patterns
- Regularly review and refactor generated code for maintainability 