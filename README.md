# Browserific

`browserific` htmlizes the current buffer's content and displays it in the
default browser.

Usage:

    M-x browserific

or

    M-x browserific-use-htmlfontify

or

    M-x browserific-use-htmlize

`M-x browserific` uses `htmlize` by default and falls back to
`htmlfontify` if it is not available.
