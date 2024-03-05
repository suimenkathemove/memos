# Storybook

- [Storybook](#storybook)
  - [Commands](#commands)
    - [Upgrade](#upgrade)
    - [Automigrate](#automigrate)
  - [Deploy](#deploy)
    - [Deploy to GitHub Pages](#deploy-to-github-pages)
      - [GitHub Pages側の設定](#github-pages側の設定)
      - [GitHub Actions](#github-actions)

## Commands

### Upgrade

```sh
npx sb@latest upgrade
```

### Automigrate

```sh
npx sb@latest automigrate
```

## Deploy

### Deploy to GitHub Pages

#### GitHub Pages側の設定

`Settings` > `Pages` > `Build and deployment` > `Source`を`GitHub Actions`にする。

#### GitHub Actions

- <https://github.com/suimenkathemove/react-notion-sortable-tree/blob/main/.github/workflows/deploy-storybook.yml>
