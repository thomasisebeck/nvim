# NVIM config

- Support for C, C++, TS, JS, and tailwind
- Added flutter support

# Comments

- TODO
- BUG
- NOTE
- TEST, PASSED, FAILED
- WARN

# Extra keybindings

## Conflict chooser

co - conflict ours
ct - cotflict theirs
cb - conflict both
cn - conflict none
[x - next conflict
]x - prev conflict

# Clangtidy checks

To enable clangtidy globally, add this to ~/.clangd

```
CompileFlags:
  Add: [-std=c++20]

Diagnostics:
  ClangTidy:
    Add:
      - clang-analyzer-*
      - bugprone-*
      - modernize-*
      - performance-*
      - readability-*
      - cppcoreguidelines-*
      - misc-*
```
