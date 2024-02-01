# npm

- [npm](#npm)
  - [Login](#login)
  - [Publishing scoped public packages](#publishing-scoped-public-packages)
  - [README](#readme)
  - [Update all packages](#update-all-packages)
    - [Installation](#installation)
    - [Usage](#usage)

## Login

```shell
npm login
```

## Publishing scoped public packages

```shell
cd /path/to/package
npm publish --access public
```

<https://docs.npmjs.com/creating-and-publishing-scoped-public-packages#publishing-scoped-public-packages>

## README

```shell
npm version patch
npm publish
```

<https://docs.npmjs.com/about-package-readme-files#updating-an-existing-package-readme-file>

## Update all packages

npm-check-updates

### Installation

```shell
npm install -g npm-check-updates
```

### Usage

```shell
ncu -u
```
