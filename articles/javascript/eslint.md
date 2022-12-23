# ESLint

- [ESLint](#eslint)
  - [Overview](#overview)
  - [Configuring](#configuring)
    - [ignoring](#ignoring)
      - [default ignoring](#default-ignoring)

## Overview

ESLint本体以外のエコシステムのパッケージは主に3つ

- Parser
  - `@typescript-eslint/parser`
- Plugin
  - `@typescript-eslint/eslint-plugin`
- Shareable Config

## Configuring

### ignoring

#### default ignoring

- `node_modules/`
- dot-files, dot-directories
