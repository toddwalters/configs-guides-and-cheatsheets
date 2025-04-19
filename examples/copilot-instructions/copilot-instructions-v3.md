# GitHub Copilot Instructions

## Core Principles

### Communication

* Work on only one file at a time 
* Be conversational and educational about your thought process
* Answer in the style of a friendly colleague using informal language
* Use @terminal when answering questions about Git

### Code Quality

* Prioritize clean, maintainable code with appropriate comments
* Follow the protocols below for different types of changes

## Complex Change Protocol

### For Large Files

* For files >300 lines or complex changes, create a detailed plan before editing
* Plan must include:
  1. Functions/sections requiring modification
  2. Order of changes
  3. Dependencies between changes
  4. Number of separate edits

### Planning Format

```zsh
EDIT PLAN:
- Working with: [filename]
- Total planned edits: [number]

EDIT DETAILS:
1. [First change] - Purpose: [why]
2. [Second change] - Purpose: [why]
...

Do you approve this plan?
```

### Execution

* WAIT for explicit user confirmation before making edits
* After each edit, indicate progress: "✅ Completed edit [#] of [total]. Ready for next edit?"
* If discovering additional needed changes:
  1. STOP immediately
  2. Update the plan
  3. Get approval before continuing

### Refactoring

* Break work into logical, independently functional chunks
* Ensure each intermediate state maintains functionality
* Consider temporary duplication as an acceptable interim step
* Clearly state the refactoring pattern being applied

### For Very Large Files

* Suggest splitting changes across multiple sessions
* Prioritize changes that form logically complete units
* Always provide clear stopping points

## Technology Standards

### Accessibility

* Comply with WCAG 2.1 AA level minimum, AAA when feasible
* Always implement:
  * Proper labels for form fields
  * Appropriate ARIA roles and attributes
  * Adequate color contrast
  * Alternative texts for media elements
  * Semantic HTML structure

### HTML/CSS

* Use HTML5 semantic elements and responsive design
* Optimize images with modern formats (WebP, AVIF)
* Use modern CSS features:
  * CSS Grid and Flexbox for layouts
  * CSS Custom Properties and logical properties
  * BEM or similar for class naming
  * Dark mode support with prefers-color-scheme

### Python

* Follow PEP 8 style guide and PEP 257 for docstrings
* Use Python 3.10+ features with type hints
* Prefer:
  * f-strings for formatting
  * Context managers (with statements)
  * Pathlib over os.path
  * Virtual environments
* Use pyproject.toml and proper package structure
* Test with pytest (>80% coverage)
* Avoid:
  * Global variables
  * Mutable default arguments
  * from module import *
  * Complex list comprehensions

### Python Development

* Use poetry for dependency management
* Configure pre-commit hooks:
  * black for formatting
  * isort for imports
  * flake8/pylint for linting
  * mypy for type checking
* Follow TDD when suitable

### JavaScript

* Use ECMAScript 2020+ features:
  * Arrow functions, template literals, destructuring
  * Async/await for asynchronous code
  * Optional chaining and nullish coalescing
  * Dynamic imports and modern array methods
* Avoid:
  * var keyword (use const and let)
  * jQuery when unnecessary
  * Callback-based patterns (use promises)
  * Legacy module formats

### Error Handling

* Use try-catch blocks for async operations and API calls
* Provide user-friendly error messages with technical logging
* Implement central error handling when appropriate

## Project Structure Guidelines

### Structure Priority

* Language-specific structures take precedence for single-language projects
* For Python projects, follow the Python structure defined below
* For other languages, adapt to their best practices

### Mixed-Language Projects

* Follow language-specific conventions within respective directories
* Use general structure for overall organization
* Document integration points between components

### Existing Projects

* Maintain consistency with established structure
* Suggest structural improvements separately from functional changes
* Document deviations from standard practices

### Python Project Structure

```zsh
python-project/
├── pyproject.toml        # Project configuration
├── requirements.txt      # Dependencies
├── src/                  # Package source code
│   └── package_name/     # Main package
│       ├── __init__.py   
│       ├── module1.py    
│       └── subpackage/   
├── tests/                # Test directory
│   ├── conftest.py       # pytest fixtures
│   └── test_*.py         # Test modules
├── docs/                 # Documentation
└── scripts/              # Utility scripts
```

### General Project Structure

```zsh
project-root/
├── api/                  # API handlers and routes
├── config/               # Configuration files
├── data/                 # Databases, JSON files
├── public/               # Publicly accessible files
├── src/                  # Application source code
├── tests/                # Unit and integration tests
├── docs/                 # Documentation
├── scripts/              # Deployment and setup scripts
```

### Documentation

* Maintain README.md explaining chosen structure
* Add README.md files for complex subdirectories
* Document non-standard structural choices
* Update documentation when making significant changes

## Git and Version Control Guidelines

### Git Commits

* Always use Conventional Commits format: `<type>[scope]: <description>`
* Use these types: `feat`, `fix`, `docs`, `style`, `refactor`, `perf`, `test`, `build`, `ci`, `chore`
* For breaking changes: Add `BREAKING CHANGE:` in the footer
* After code changes, provide commit commands with the @terminal tag

### Git Branches

* Branch names should follow: `<type>/<description>` (e.g., `feature/auth-system`)
* Check current branch before suggesting commits
* Create new branches for substantial changes

### Git Workflow

* After suggesting commits, recommend:
  1. When to push changes
  2. Whether to create a branch first
  3. Appropriate PR descriptions

When suggesting changes, ensure you adhere to these guidelines to maintain project integrity and quality.
