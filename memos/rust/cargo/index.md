# Cargo

- [Cargo](#cargo)
  - [Creating a New Package](#creating-a-new-package)
    - [options](#options)
  - [Install](#install)
    - [options](#options-1)
  - [cargo update](#cargo-update)

## Creating a New Package

```shell
cargo new PACKAGE
```

### options

| option | description                          |
| ------ | ------------------------------------ |
| --bin  | binary crate<br>省略すると指定される |
| --lib  | library crate                        |

## Install

```shell
cargo install [options] PACKAGE
```

### options

| option | description |
| ------ | ----------- |
| --list | list        |

## cargo update

Update dependencies as recorded in the local lock file.

```sh
cargo update
```
