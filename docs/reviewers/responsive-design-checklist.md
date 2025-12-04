# Responsive Design Checklist

**Purpose:** Ensure all features are designed and implemented mobile-first with proper responsive considerations from the start.

## Why This Exists

During the initial implementation of the Musician Tax Assistant, we encountered issues where:
- Features were built desktop-first, requiring extensive retrofit work for mobile
- Mobile layouts weren't considered until after desktop implementation was complete
- Responsive spacing, typography, and component sizing were added reactively rather than proactively

This checklist ensures responsive design is considered **upfront** in PRDs and **enforced** during implementation.

---

## PRD Requirements - Responsive Design Section

**Every PRD MUST include a dedicated "Responsive Design" section that specifies:**

### 1. Mobile-First Design Approach
- [ ] Explicitly state whether this is a mobile-first or desktop-first feature
- [ ] Justify the approach based on user behavior and analytics
- [ ] Default to mobile-first unless there's a compelling reason otherwise

### 2. Breakpoint Strategy
- [ ] Define specific breakpoints using Tailwind CSS conventions:
  - `default` (mobile): 0px+
  - `sm`: 640px+
  - `md`: 768px+
  - `lg`: 1024px+
  - `xl`: 1280px+
  - `2xl`: 1536px+
- [ ] Specify which breakpoints are critical for this feature
- [ ] Document any custom breakpoints needed

### 3. Layout Adaptations by Breakpoint
- [ ] **Mobile (default):** Describe the mobile layout explicitly
- [ ] **Tablet (md):** Describe how the layout changes at tablet sizes
- [ ] **Desktop (lg+):** Describe the desktop layout
- [ ] Document any layout pattern changes:
  - Stack to side-by-side
  - Single column to multi-column
  - Full width to contained
  - Tabs to split panels (or vice versa)

### 4. Component-Level Responsive Behavior

For each major component, specify:
- [ ] **Spacing:** How padding/margins scale across breakpoints
  - Example: `p-4 md:p-5 lg:p-6`
- [ ] **Typography:** How text sizes scale
  - Example: `text-xs md:text-sm lg:text-base`
- [ ] **Element sizing:** How component dimensions change
  - Example: `h-12 md:h-14 lg:h-16`
- [ ] **Visibility:** What shows/hides at different sizes
  - Example: `hidden md:block` or `md:hidden`
- [ ] **Touch targets:** Ensure minimum 44x44px touch targets on mobile

### 5. Navigation & Interaction Patterns
- [ ] **Mobile navigation:** Hamburger menu, bottom nav, tabs, or other?
- [ ] **Desktop navigation:** Top bar, sidebar, or other?
- [ ] **Touch vs mouse:** Document touch-specific interactions
- [ ] **Gestures:** Swipe, pinch-to-zoom, long-press (if applicable)

### 6. Content Priority
- [ ] What content is most important on mobile?
- [ ] What content can be hidden/deferred on small screens?
- [ ] How do users access secondary content on mobile?

### 7. Performance Considerations
- [ ] Image sizing and srcset requirements
- [ ] Lazy loading strategy for mobile
- [ ] Bundle size concerns for mobile networks

---

## Design Review Checklist

When reviewing designs (Figma, mockups, prototypes), verify:

- [ ] Designs exist for mobile, tablet, and desktop sizes
- [ ] Spacing scales logically across breakpoints
- [ ] Typography is readable at all sizes
- [ ] Touch targets are appropriate (min 44x44px on mobile)
- [ ] Navigation patterns are mobile-friendly
- [ ] Complex layouts adapt gracefully (e.g., split panels → tabs)
- [ ] Forms and inputs are mobile-optimized
- [ ] Images and media are responsive
- [ ] Accessibility considerations at all breakpoints

---

## Implementation Review Checklist

When reviewing code, verify:

### Tailwind Responsive Classes
- [ ] All components use Tailwind breakpoint prefixes (`md:`, `lg:`, etc.)
- [ ] Mobile styles are default (no prefix)
- [ ] Responsive classes follow mobile-first progression
- [ ] No fixed widths/heights without responsive alternatives

### Layout Components
- [ ] Flexbox/Grid layouts adapt across breakpoints
- [ ] Gap spacing scales: `gap-3 md:gap-4 lg:gap-6`
- [ ] Container max-widths defined: `max-w-3xl mx-auto`
- [ ] Padding/margin scales: `p-4 md:p-5 lg:p-6`

### Typography
- [ ] Font sizes scale: `text-xs md:text-sm lg:text-base`
- [ ] Line heights adjust with font size
- [ ] Text truncation on mobile: `truncate` or `line-clamp-*`
- [ ] Headings scale appropriately

### Interactive Elements
- [ ] Buttons have appropriate sizes: `h-9 md:h-10 lg:h-11`
- [ ] Touch targets meet minimum size on mobile
- [ ] Hover states only apply on devices with hover capability
- [ ] Focus states visible and accessible

### Visibility & Content
- [ ] Hidden elements documented: `hidden md:block`
- [ ] Text alternatives for hidden labels: `<span className="hidden sm:inline">Text</span>`
- [ ] No important content hidden on mobile without alternative

### Images & Media
- [ ] Images use responsive classes: `w-full h-auto`
- [ ] Appropriate aspect ratios maintained
- [ ] Icons scale: `h-4 w-4 md:h-5 md:w-5`

---

## Common Anti-Patterns to Avoid

### ❌ Don't: Build desktop-first and add mobile as afterthought
```tsx
// Bad: Desktop layout with mobile retrofit
<div className="flex gap-6 lg:flex-col lg:gap-3">
```

### ✅ Do: Build mobile-first and enhance for larger screens
```tsx
// Good: Mobile layout that expands for desktop
<div className="flex flex-col gap-3 lg:flex-row lg:gap-6">
```

---

### ❌ Don't: Use fixed dimensions without responsive alternatives
```tsx
// Bad: Fixed sizes
<div className="w-64 h-48 p-8">
```

### ✅ Do: Use responsive dimensions
```tsx
// Good: Responsive sizing
<div className="w-full md:w-64 h-auto p-4 md:p-6 lg:p-8">
```

---

### ❌ Don't: Forget to test on actual mobile devices
```tsx
// Bad: Only testing in browser DevTools
```

### ✅ Do: Test on real devices and various screen sizes
```tsx
// Good: Test on iPhone, Android, tablet, desktop
```

---

### ❌ Don't: Hide important content on mobile
```tsx
// Bad: Critical info hidden on mobile
<div className="hidden lg:block">Important legal disclaimer</div>
```

### ✅ Do: Make important content accessible on all screens
```tsx
// Good: Content available everywhere, layout adapts
<div className="text-xs md:text-sm">Important legal disclaimer</div>
```

---

## Designer Reviewer Enhancement

Add this section to [designer.md](designer.md) review structure:

### 5.1 Responsive Design Verification (NEW)

Before approving any design or implementation:
- [ ] Confirm mobile-first approach or justified alternative
- [ ] Verify designs exist for key breakpoints (mobile, tablet, desktop)
- [ ] Check that spacing, typography, and sizing scale logically
- [ ] Ensure touch targets meet accessibility standards (44x44px minimum)
- [ ] Validate that complex layouts adapt gracefully (e.g., tabs on mobile, split panels on desktop)
- [ ] Confirm no critical content is hidden on mobile without alternatives
- [ ] Review navigation patterns for mobile usability

---

## Quick Reference: Tailwind Responsive Scale

Use these as starting points for consistent scaling:

### Spacing
```tsx
gap-3 md:gap-4 lg:gap-6        // Small to large gaps
p-4 md:p-5 lg:p-6              // Padding progression
space-y-3 md:space-y-4         // Vertical spacing
```

### Typography
```tsx
text-xs md:text-sm             // Small text
text-sm md:text-base           // Body text
text-base md:text-lg           // Emphasized text
text-lg md:text-xl lg:text-2xl // Headings
```

### Sizing
```tsx
h-9 md:h-10 lg:h-11           // Button heights
h-4 w-4 md:h-5 md:w-5         // Icon sizes
w-12 h-12 md:w-16 md:h-16     // Avatar/badge sizes
```

### Layout
```tsx
flex-col lg:flex-row          // Stack mobile, row desktop
grid-cols-1 md:grid-cols-2 lg:grid-cols-3  // Responsive grid
max-w-md md:max-w-2xl lg:max-w-4xl        // Container widths
```

### Visibility
```tsx
hidden md:block               // Hide on mobile
md:hidden                     // Hide on desktop
<span className="hidden sm:inline">Full Text</span>
<span className="sm:hidden">Short</span>
```

---

## Testing Strategy

### 1. Browser DevTools Testing
- [ ] Test at common breakpoints: 375px (mobile), 768px (tablet), 1024px (desktop), 1440px (large desktop)
- [ ] Use "Responsive" mode to drag between sizes
- [ ] Test in both portrait and landscape orientations

### 2. Real Device Testing
- [ ] Test on at least one iOS device (iPhone)
- [ ] Test on at least one Android device
- [ ] Test on a tablet (iPad or Android tablet)
- [ ] Test on various desktop screen sizes

### 3. Accessibility Testing
- [ ] Use keyboard navigation at all breakpoints
- [ ] Test with screen reader (VoiceOver on iOS/Mac, TalkBack on Android)
- [ ] Verify color contrast at all text sizes
- [ ] Check touch target sizes (use browser devtools or physical device)

---

## Success Metrics

A feature meets responsive design standards when:

1. ✅ All breakpoints defined in PRD are implemented
2. ✅ Component spacing, typography, and sizing scale consistently
3. ✅ Layout adaptations work as specified (tabs ↔ split panels, etc.)
4. ✅ No content is hidden on mobile without alternative access
5. ✅ Touch targets meet 44x44px minimum on mobile
6. ✅ Feature is usable and aesthetic on devices from 320px to 2560px wide
7. ✅ No horizontal scrolling on any standard device size
8. ✅ Performance is acceptable on mobile networks (< 3s initial load)

---

## Template: PRD Responsive Design Section

Copy this into new PRDs:

```markdown
## Responsive Design

### Approach
- **Strategy:** Mobile-first design
- **Justification:** [Why mobile-first? User analytics, target audience, etc.]

### Breakpoints
- **Mobile (default):** 0px+ - Primary experience
- **Tablet (md):** 768px+ - Enhanced layout
- **Desktop (lg):** 1024px+ - Full feature set

### Layout Adaptations

#### Mobile (default - 0px+)
- [Describe mobile layout]
- Navigation: [tabs | bottom nav | hamburger]
- Content priority: [most important content first]

#### Tablet (md - 768px+)
- [Describe tablet layout]
- Changes from mobile: [what changes?]

#### Desktop (lg - 1024px+)
- [Describe desktop layout]
- Changes from tablet: [what changes?]

### Component Responsive Behavior

| Component | Mobile | Tablet | Desktop |
|-----------|--------|--------|---------|
| Header | Full width, compact | Same | Full width, expanded |
| Navigation | Tabs | Same | Split panel |
| Cards | Single column | 2 columns | 3 columns |
| Typography | text-xs | text-sm | text-base |
| Spacing | p-4 gap-3 | p-5 gap-4 | p-6 gap-6 |

### Touch Targets
- All interactive elements: minimum 44x44px on mobile
- Buttons: `h-11` (44px) minimum on mobile
- Icons: `h-6 w-6` (24px) minimum in touch areas

### Content Strategy
- **Always visible:** [Critical content that appears on all screen sizes]
- **Progressive disclosure:** [Content shown on larger screens only]
- **Mobile alternatives:** [How mobile users access hidden content]

### Performance
- Target: < 3s initial load on 3G
- Images: Use next/image with appropriate sizes
- Lazy loading: [Specify what should lazy load on mobile]
```

---

**Remember:** Responsive design isn't a feature to add later—it's a fundamental requirement from day one.

