# Elm Tooling Compiler

:warning: This tool is yet unreleased, but discussion is welcome on [Incremental Elm's #elm-tooling-compiler](https://incrementalelm.com/chat/) channel.

### Purpose

Elm Tooling Compiler is a backwards-compatible fork of the Elm compiler extended to assist Elm tooling authors.

### Goals

- A one-shot command to get the Haskell development environment running easily and a REPL at your fingertips
- A brief guide to getting quickly productive in the Elm compiler's "Elm-flavoured Haskell" codebase without any prior Haskell knowledge
- Useful Elm Utility functions
  - Elm syntax parsing
  - Elm AST querying/manipulation
- Easy scaffolding example for adding additional tooling commands
- Alternate compilation modes
  - Daemonised in-memory compile mode (WIP)

### Non-goals

- Elm language changes
- Refactoring, bugfixing or improving the Elm compiler codebase (those issues should be raised [here](https://github.com/elm/compiler/issues)).

### Support

This project is made possible with the support of [Lamdera](https://lamdera.com), [Blissfully](https://www.blissfully.com/) and [these wonderful sponsors](https://github.com/sponsors/supermario).
