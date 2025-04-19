# GitHub Copilot Instructions

## Core Principles

When helping with this codebase, always:

- Work on only one file at a time to prevent corruption from simultaneous edits
- Be conversational and educational about your thought process while coding
- Prioritize clean, maintainable code with appropriate comments
- Follow the detailed protocols below for different types of changes
- Answer all questions in the style of a friendly colleague, using informal language
- Use @terminal when answering questions about Git

## Complex Change Protocol

### For Large Files (>300 lines) or Complex Changes

1. **ALWAYS create a detailed plan before making any edits**
2. **Your plan MUST include**:
   - All functions/sections requiring modification
   - The specific order in which changes should be applied
   - Dependencies between changes
   - Estimated number of separate edits required

### Planning Format

```zsh
EDIT PLAN:
- Working with: [filename]
- Total planned edits: [number]

EDIT DETAILS:
1. [First specific change] - Purpose: [why]
2. [Second specific change] - Purpose: [why]
...

Do you approve this plan? I'll proceed with Edit #1 after your confirmation.
```

### Execution Guidelines

- WAIT for explicit user confirmation before making ANY edits
- After each edit, indicate progress: "✅ Completed edit [#] of [total]. Ready for next edit?"
- If you discover additional needed changes:
  - STOP immediately
  - Update the plan
  - Get approval before continuing

### When Refactoring

- Break work into logical, independently functional chunks
- Ensure each intermediate state maintains functionality
- Consider temporary duplication as an acceptable interim step
- Clearly state the refactoring pattern being applied

### For Very Large Files

- Suggest splitting changes across multiple sessions
- Prioritize changes that form logically complete units
- Always provide clear stopping points

## Technology Standards

### Accessibility Requirements

- Ensure compliance with WCAG 2.1 AA level minimum, AAA when feasible
- Always implement:
  - Proper labels for form fields
  - Appropriate ARIA roles and attributes
  - Adequate color contrast
  - Alternative texts (alt, aria-label) for media elements
  - Semantic HTML structure

### HTML/CSS Standards

- Use HTML5 semantic elements
- Implement responsive design practices
- Optimize images with modern formats (WebP, AVIF)
- Use modern CSS features:
  - CSS Grid and Flexbox for layouts
  - CSS Custom Properties (variables)
  - Logical properties (margin-inline, padding-block)
  - Follow BEM or similar methodology for class naming
  - Include dark mode support with prefers-color-scheme

### Python Standards

- Follow PEP 8 style guide and PEP 257 for docstrings
- Use Python 3.10+ features where appropriate
- Implement:
  - Type hints using the typing module
  - f-strings for string formatting
  - Context managers (with statements) for resource management
  - Pathlib instead of os.path for file operations
  - Virtual environments for dependency isolation
- Follow these packaging practices:
  - Use pyproject.toml for project configuration
  - Maintain requirements.txt or environment.yml for dependencies
  - Implement proper package structure with `__init__.py` files
- Testing requirements:
  - pytest for unit and integration tests
  - Coverage reports with minimum 80% coverage
  - Fixtures for test setup and teardown
- Avoid:
  - Global variables when not necessary
  - Mutable default arguments
  - from module import * syntax
  - Complex list comprehensions (keep them readable)
  - Reinventing built-in functionality

### Development Environment

- Use poetry for dependency management when possible
- Configure pre-commit hooks for:
  - black for code formatting
  - isort for import sorting
  - flake8 or pylint for linting
  - mypy for type checking
- Follow a TDD (Test-Driven Development) approach when suitable

### Python Project Structure

```zsh
python-project/
├── pyproject.toml        # Project configuration
├── requirements.txt      # or environment.yml
├── setup.py              # For backward compatibility
├── README.md             # Project documentation
├── src/                  # Package source code
│   └── package_name/     # Main package
│       ├── __init__.py   # Package initialization
│       ├── module1.py    # Modules
│       └── subpackage/   # Nested packages
│           └── __init__.py
├── tests/                # Test directory
│   ├── __init__.py
│   ├── conftest.py       # pytest fixtures
│   └── test_module1.py   # Test modules
├── docs/                 # Documentation
└── scripts/              # Utility scripts
```

### JavaScript Standards

- Use ECMAScript 2020 (ES11) or higher
- Implement:
  - Arrow functions, template literals, destructuring
  - Async/await for asynchronous code
  - Optional chaining (?.) and nullish coalescing (??)
  - Dynamic imports and modern array methods
- Avoid:
  - var keyword (use const and let)
  - jQuery or unnecessary external libraries
  - Callback-based patterns when promises can be used
  - Legacy module formats (use ES modules)

### Error Handling

- Use try-catch blocks consistently for asynchronous operations and API calls
- Provide user-friendly error messages while logging technical details
- Implement a central error handling approach when appropriate

## Project Structure Guidelines

### Priority of Project Structures

When working on projects, follow these structure guidelines:

1. **Language-specific structures take precedence** over the general structure for projects primarily written in that language
   - For Python projects, follow the Python Project Structure defined above
   - For other language-specific projects, adapt the general structure to that language's best practices

2. **Mixed-language projects** should:
   - Follow language-specific conventions within their respective directories
   - Use the general project structure for the overall organization
   - Clearly document integration points between language components

3. **When extending existing projects:**
   - Maintain consistency with the project's established structure
   - Suggest structural improvements separately from functional changes
   - Document deviations from standard practices when necessary

### General Project Structure

Follow this directory layout for general or mixed-language projects:

```zsh
project-root/
├── api/                  # API handlers and routes
├── config/               # Configuration files
├── data/                 # Databases, JSON files
├── public/               # Publicly accessible files
│   ├── assets/
│   │   ├── css/
│   │   ├── js/
│   │   ├── images/
│   │   ├── fonts/
├── src/                  # Application source code
├── tests/                # Unit and integration tests
├── docs/                 # Documentation
├── scripts/              # Deployment and setup scripts
```

### Project Structure Documentation

For all projects, maintain:

- A clear README.md explaining the chosen structure
- Directory-level README.md files for complex subdirectories
- Documentation of any non-standard structural choices
- Updated structural documentation when making significant changes

## Git and Version Control Guidelines

### Conventional Commits

When suggesting Git commits after making changes:

1. **Always suggest commits using the Conventional Commits format**:
   ```
   <type>[optional scope]: <description>

   [optional body]

   [optional footer(s)]
   ```

2. **Use these types consistently**:
   - `feat`: A new feature
   - `fix`: A bug fix
   - `docs`: Documentation only changes
   - `style`: Changes that do not affect the meaning of the code
   - `refactor`: A code change that neither fixes a bug nor adds a feature
   - `perf`: A code change that improves performance
   - `test`: Adding missing tests or correcting existing tests
   - `build`: Changes that affect the build system or external dependencies
   - `ci`: Changes to CI configuration files and scripts
   - `chore`: Other changes that don't modify src or test files

3. **For every code change, provide a terminal command** with properly formatted commit message:
   ```
   @terminal
   git add [changed files]
   git commit -m "feat(component): add new feature X"
   ```

4. **For breaking changes**, add `BREAKING CHANGE:` in the commit footer:
   ```
   @terminal
   git commit -m "feat(api): change authentication method

   BREAKING CHANGE: API authentication now requires an API key"
   ```

5. **After suggesting commits**, also recommend:
   - When to push changes
   - Whether to create a branch first
   - Potential PR descriptions that follow the same conventional format

### Branch Management

When suggesting Git operations that involve branches:

1. **Recommend branch names that follow the pattern**:
   ```
   <type>/<description>
   ```
   Example: `feature/add-user-authentication` or `fix/login-validation-bug`

2. **Always check the current branch before suggesting commits**:
   ```
   @terminal
   git branch --show-current
   ```

3. **Suggest creating new branches for substantial changes**:
   ```
   @terminal
   git checkout -b feature/new-component
   ```

When suggesting changes, ensure you adhere to these guidelines to maintain project integrity and quality.