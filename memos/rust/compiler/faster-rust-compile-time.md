# Rustのコンパイル時間を高速化する

## Profiling

<!-- TODO -->

## 高速化する

### Rust Compilerとtoolchainを最新に保つ

```sh
rustup update
```

### コンパイルチェックにはcargo buildではなく、cargo checkを使う

### remove unused dependencies

```sh
cargo install cargo-machete
cargo machete
```

### Update Dependencies

1. Run `cargo update`
2. `cargo outdated`で、アップデート可能なcrateを表示する

## References

- <https://corrode.dev/blog/tips-for-faster-rust-compile-times/>
