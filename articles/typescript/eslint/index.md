# ESLint

- [ESLint](#eslint)
  - [Overview](#overview)
  - [Setup](#setup)
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

## Setup

1. Install packages
2. ESLint configuration file
   1. .eslintrc.js
   2. .eslintignore
3. Prettier configuration file
   1. .prettierrc.js
   2. .prettierignore
4. .vscode/settings.json
5. npm scripts
6. CI

## Configuring

### ignoring

#### default ignoring

- `node_modules/`
- dot-files, dot-directories
