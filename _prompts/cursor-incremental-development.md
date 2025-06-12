---
title: "Cursor Incremental Development Approach"
description: "A structured approach to incremental development using Cursor with phase-based implementation"
tool: "Cursor"
use_case: "Development Process"
complexity: "Beginner"
tags:
  - cursor
  - development
  - incremental
  - methodology
  - best-practices
date: 2025-06-12
prompt: |
  Follow this incremental development approach for efficient coding with Cursor:
  
  # Phase 1: Basic Structure (5-10 min)
  - Create minimal feature file with 1-2 scenarios
  - Add basic step definitions (no implementation)
  - Create test runner file
  - Verify pytest collection works
  
  # Phase 2: API Integration (10-15 min)
  - Enhance/create adapter with required endpoints
  - Test 1 endpoint manually to verify auth/connectivity
  - Implement basic domain methods
  - Run 1 simple test to validate flow
  
  # Phase 3: Full Implementation (15-20 min)
  - Complete all step definitions
  - Add data generation and validation
  - Run all tests and fix issues
  - Document and finalize
  
  Apply these rules throughout:
  - Test each component incrementally (adapter → domain → steps)
  - Validate API responses before writing assertions
  - Use project's existing validation patterns
  - Check real API behavior vs assumptions
  - Run tests after each major component completion
  - Fix issues immediately when found
  - Update expectations based on actual API behavior
  - Document any deviations from initial assumptions
example_input: |
  Task: Implement user authentication testing
  Framework: pytest-bdd with requests
  Timeline: 30-40 minutes total
example_output: |
  Phase 1 (10 min):
  - auth.feature with basic login scenario
  - auth_steps.py with empty step functions
  - test_runner.py configured
  - pytest --collect-only passes
  
  Phase 2 (15 min):
  - auth_api.py with login endpoint
  - Manual test: POST /auth/login successful
  - user_domain.py with basic user model
  - One login test passes
  
  Phase 3 (15 min):
  - All step definitions implemented
  - Faker integration for test data
  - Full test suite passes
  - Documentation updated
tips:
  - "Start with the smallest possible working version"
  - "Test connectivity early to avoid late-stage issues"
  - "Don't skip the manual API testing step"
  - "Fix issues immediately rather than accumulating technical debt"
  - "Document assumptions and deviations as you go"
variations:
  - name: "Frontend Development"
    prompt: |
      Adapt for frontend development:
      
      # Phase 1: Component Structure (5-10 min)
      - Create basic component with minimal props
      - Add basic styling and layout
      - Verify component renders without errors
      
      # Phase 2: Functionality (10-15 min)
      - Implement core component logic
      - Add event handlers and state management
      - Test basic user interactions
      
      # Phase 3: Polish & Integration (15-20 min)
      - Add error handling and edge cases
      - Implement responsive design
      - Add tests and documentation
    description: "Adapted for frontend component development"
  - name: "API Development"
    prompt: |
      Adapt for API development:
      
      # Phase 1: Endpoint Structure (5-10 min)
      - Create basic endpoint with minimal response
      - Set up routing and basic validation
      - Verify endpoint is accessible
      
      # Phase 2: Business Logic (10-15 min)
      - Implement core business logic
      - Add database integration
      - Test with sample data
      
      # Phase 3: Production Ready (15-20 min)
      - Add comprehensive error handling
      - Implement authentication/authorization
      - Add logging and monitoring
    description: "Adapted for API endpoint development"
---

This incremental development approach helps maintain momentum and catch issues early in the development process. By breaking work into small, testable phases, you can ensure each component works before building on top of it.

## Key Principles

- **Start Small**: Begin with the minimal viable implementation
- **Test Early**: Validate each component before moving to the next
- **Fix Immediately**: Address issues as soon as they're discovered
- **Document Changes**: Keep track of deviations from initial plans

## Benefits

- **Reduced Risk**: Issues are caught early when they're easier to fix
- **Better Feedback**: Quick validation cycles provide immediate feedback
- **Maintained Momentum**: Regular progress prevents getting stuck
- **Quality Focus**: Each phase ensures quality before moving forward

## Time Management

The suggested time allocations are guidelines:
- **Phase 1**: Focus on structure and basic setup
- **Phase 2**: Implement core functionality with validation
- **Phase 3**: Add polish, error handling, and documentation

Adjust timing based on complexity and familiarity with the technology stack. 