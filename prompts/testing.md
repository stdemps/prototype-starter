# Testing Prompts

Prompts for creating tests, improving test coverage, and debugging test failures.

---

## Create Component Tests

**Category:** Testing

**When to use:** When you need to write tests for a React component

**Context needed:** Component file and testing requirements

---

## Prompt

```
Create comprehensive tests for [ComponentName] in [file-path] using React Testing Library.

**Test requirements:**
- Test component rendering
- Test user interactions (clicks, form submissions, etc.)
- Test accessibility (keyboard navigation, ARIA attributes)
- Test edge cases (empty states, error states, loading states)
- Test props variations
- Follow workspace testing standards
- Use descriptive test names
- Ensure tests are maintainable

**Component details:**
[Describe component functionality, props, and key interactions]

Component code:
[Reference the component file]
```

## Example Usage

**Input:**
```
Create comprehensive tests for TaskCard component in components/task-card.tsx.

**Test requirements:**
- Test rendering with task data
- Test checkbox interaction (marking task as complete)
- Test delete button functionality
- Test keyboard accessibility
- Test with different task states (pending, completed)
- Test with missing optional props

**Component details:**
- Accepts task prop with title, description, status
- Has onComplete and onDelete callbacks
- Shows checkbox and delete button
- Uses Card component from shadcn/ui

Component code:
```1:30:components/task-card.tsx
[component code]
```
```

**Expected Output:**
Complete test suite with all required test cases

---

## Create Hook Tests

**Category:** Testing

**When to use:** When you need to test a custom React hook

**Context needed:** Hook file and hook functionality

---

## Prompt

```
Create tests for the [hookName] hook in [file-path] using React Testing Library and @testing-library/react-hooks.

**Test requirements:**
- Test hook return values
- Test hook behavior with different inputs
- Test side effects (if any)
- Test cleanup (if applicable)
- Test error cases
- Test edge cases
- Follow workspace testing standards

**Hook details:**
[Describe hook functionality, parameters, return values, and side effects]

Hook code:
[Reference the hook file]
```

## Example Usage

**Input:**
```
Create tests for the useDebounce hook in lib/hooks/use-debounce.ts.

**Test requirements:**
- Test debounced value updates after delay
- Test cleanup on unmount
- Test with different delay values
- Test with rapid value changes
- Test TypeScript type preservation

**Hook details:**
- Takes value and delay (milliseconds)
- Returns debounced value
- Cleans up timeout on unmount
- Uses TypeScript generics

Hook code:
```1:15:lib/hooks/use-debounce.ts
[hook code]
```
```

**Expected Output:**
Complete test suite for the hook

---

## Create API Route Tests

**Category:** Testing

**When to use:** When you need to test a Next.js API route

**Context needed:** API route file and route functionality

---

## Prompt

```
Create tests for the API route at [route-path] using Jest and appropriate testing utilities.

**Test requirements:**
- Test all HTTP methods (GET, POST, PUT, DELETE as applicable)
- Test request validation
- Test success responses
- Test error responses (400, 404, 500)
- Test edge cases
- Test authentication/authorization (if applicable)
- Follow workspace testing standards

**Route details:**
[Describe route functionality, request/response formats, and validation rules]

Route code:
[Reference the route file]
```

## Example Usage

**Input:**
```
Create tests for the API route at app/api/tasks/route.ts.

**Test requirements:**
- Test GET requests (return all tasks)
- Test POST requests (create task)
- Test validation (title required, description optional)
- Test 200 success responses
- Test 400 validation errors
- Test 500 server errors

**Route details:**
- GET: Returns array of tasks
- POST: Accepts { title: string, description?: string }, returns created task
- Validates title is required and non-empty

Route code:
```1:40:app/api/tasks/route.ts
[route code]
```
```

**Expected Output:**
Complete test suite for the API route

---

## Debug Test Failures

**Category:** Testing

**When to use:** When tests are failing and you need help fixing them

**Context needed:** Failing test code and error messages

---

## Prompt

```
I have failing tests in [test-file-path]:

**Error messages:**
[Paste test failure messages and stack traces]

**Failing tests:**
[Reference or paste the failing test code]

**Component/Hook/Code being tested:**
[Reference the code being tested]

Please:
1. Identify why the tests are failing
2. Fix the tests
3. Ensure tests are still comprehensive
4. Explain what was wrong and how the fix works
```

## Example Usage

**Input:**
```
I have failing tests in components/__tests__/task-card.test.tsx:

**Error messages:**
```
Error: Unable to find an element with the text: "Complete task"
```

**Failing tests:**
```15:20:components/__tests__/task-card.test.tsx
it('should call onComplete when checkbox is clicked', () => {
  render(<TaskCard task={mockTask} onComplete={mockOnComplete} />)
  const checkbox = screen.getByText('Complete task')
  fireEvent.click(checkbox)
  expect(mockOnComplete).toHaveBeenCalled()
})
```

**Component being tested:**
```1:30:components/task-card.tsx
[component code]
```

Please identify and fix the issue.
```

**Expected Output:**
Fixed tests with explanation of the issue and solution

---

## TDD Workflow with Optional UI Verification

**Category:** Testing

**When to use:** When implementing new features with test-driven development approach

**Context needed:** Feature requirements and testing framework preference

---

## Prompt

```
Implement [FEATURE_NAME] using Test-Driven Development (TDD) workflow.

**TDD Steps:**
1. **Write tests first** - Create tests that define expected behavior before writing code
2. **Run tests (expect failures)** - Verify tests fail initially (red phase)
3. **Write minimal code** - Implement just enough code to pass tests (green phase)
4. **Refactor** - Improve code quality while keeping tests green
5. **Repeat** - Continue cycle for each feature increment

**Feature requirements:**
[Describe the feature functionality, expected behavior, and acceptance criteria]

**Testing framework:**
[Specify: React Testing Library, Playwright, Cypress, Jest, Vitest, or "any"]

**Optional - UI Verification (if implementing UI features):**
- Generate screenshots during tests to verify visual correctness
- Review screenshots for: accessibility, responsive design, component styling
- Fix any UI issues and regenerate screenshots until correct

**Workspace standards to follow:**
- Accessibility: WCAG 2.1 AA compliance
- Responsive: Mobile-first design (test at 375px, 768px, 1024px)
- TypeScript: Maintain type safety
- Component library: Use shadcn/ui components if applicable
```

## Example Usage

**Input:**
```
Implement a "Task Card" component with delete functionality using TDD workflow.

**TDD Steps:**
1. Write tests first
2. Run tests (expect failures)
3. Write minimal code
4. Refactor
5. Repeat

**Feature requirements:**
- Display task title, description, and status
- Show delete button that calls onDelete callback
- Use Card component from shadcn/ui
- Accessible with keyboard navigation (Enter/Space to delete)
- Responsive design (mobile-first)

**Testing framework:**
React Testing Library

**Optional - UI Verification:**
- Generate screenshots showing:
  - Default task card appearance
  - Hover state on delete button
  - Mobile view (375px width)
  - Tablet view (768px width)
- Review for accessibility contrast ratios
- Verify button alignment and spacing
```

**Expected Output:**
1. Test file with comprehensive test cases (failing initially)
2. Component implementation that passes all tests
3. Refactored code with improved quality
4. (Optional) Screenshots showing correct UI rendering

## Usage Notes

**Benefits:**
- Ensures feature meets specifications before implementation
- Reduces bugs by defining expected behavior upfront
- Provides documentation through tests
- Encourages simple, focused implementations

**When to skip TDD:**
- Quick prototypes or throwaway code
- Exploratory coding to understand problem space
- Simple UI tweaks with obvious correctness

**Framework-agnostic:**
- This prompt works with any testing framework
- Adapt to your project's testing setup
- No infrastructure required to start - add testing tools when ready

**UI Verification is optional:**
- Include screenshot verification if visual correctness is critical
- Skip for backend/API features or quick prototypes
- Use your judgment based on feature complexity

---
