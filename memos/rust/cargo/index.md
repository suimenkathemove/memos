# Cargo

## Creating a New Package

```sh
cargo new PACKAGE
```

| option | description                          |
| ------ | ------------------------------------ |
| --bin  | binary crate<br>省略すると指定される |
| --lib  | library crate                        |

## Install

```sh
cargo install [options] PACKAGE
```

| option | description |
| ------ | ----------- |
| --list | list        |

## cargo update

Update dependencies as recorded in the local lock file.

```sh
cargo update
```

## cargo自体のupgrade

```sh
rustup update
```
