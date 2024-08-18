# ESLint

- [ESLint](#eslint)
  - [Overview](#overview)
  - [Setup](#setup)
  - [Configuring](#configuring)
    - [ignoring](#ignoring)
      - [default ignoring](#default-ignoring)
  - [migrate to flat config](#migrate-to-flat-config)
    - [手順](#手順)

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

## migrate to flat config

<https://eslint.org/docs/latest/use/configure/migration-guide>

### 手順

既存のファイルを変換する

<https://eslint.org/docs/latest/use/configure/migration-guide#migrate-your-config-file>

typescript-eslintを使う場合は`tseslint.config`を使う

<https://typescript-eslint.io/getting-started>
