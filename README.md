# NVIM config

- You must have nvim 0.12 for the plugins to work

# Install for debug adapter

sudo pacman -S lldb

# Install rust-analyzer 

```
rustup component add rust-analyzer
```

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

# Rust support

```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```
