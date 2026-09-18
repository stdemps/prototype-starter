"use client"

import * as React from "react"

const MOBILE_BREAKPOINT = 640
const COMPACT_BREAKPOINT = 1024

// useSyncExternalStore is React's built-in way to read from something outside
// React - here, the browser's media query. It avoids setting state inside an
// effect, which causes an extra render on every mount.
function subscribe(breakpoint: number) {
  return (onChange: () => void) => {
    const mql = window.matchMedia(`(max-width: ${breakpoint - 1}px)`)
    mql.addEventListener("change", onChange)
    return () => mql.removeEventListener("change", onChange)
  }
}

function useBreakpoint(breakpoint: number) {
  const getSnapshot = React.useCallback(
    () => window.matchMedia(`(max-width: ${breakpoint - 1}px)`).matches,
    [breakpoint]
  )

  // On the server there is no window, so report "not below the breakpoint".
  // The first client render corrects it.
  const getServerSnapshot = React.useCallback(() => false, [])

  return React.useSyncExternalStore(
    React.useMemo(() => subscribe(breakpoint), [breakpoint]),
    getSnapshot,
    getServerSnapshot
  )
}

/** Below 640px — phone-sized viewports */
export function useIsMobile() {
  return useBreakpoint(MOBILE_BREAKPOINT)
}

/** Below 1024px — tablet and below */
export function useIsCompact() {
  return useBreakpoint(COMPACT_BREAKPOINT)
}
