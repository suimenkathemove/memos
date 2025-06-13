# rustup

## toolchain

A single installation of the Rust compiler.

Manage with rustup.

## target

```shell
rustup target add <target>
```

## Show installed toolchains

```sh
rustup show
```

## component

Rustの標準toolchainに含まれるツールをインストールする際は、`rustup component add`を使ってインストールする。
clippy, rustfmtなど

削除は`rustup component remove`

## rustup update

cargoなどをupgradeする

```sh
rustup update
```
