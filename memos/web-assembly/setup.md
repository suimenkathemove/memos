# WebAssembly Setup

- [WebAssembly Setup](#webassembly-setup)
  - [Setup](#setup)
  - [References](#references)

## Setup

```shell
rustup target add wasm32-unknown-unknown
rustup target add wasm32-wasi
```

[Install wasm-pack](https://rustwasm.github.io/wasm-pack/installer/)

`Cargo.toml`

```toml
[lib]
crate-type = ["cdylib"]

[dependencies]
wasm-bindgen = ""
```

```shell
wasm-pack build --release --target web
```

`package.json`

```json
{
  "dependencies": {
    "wasm": "file:wasm/pkg"
  }
}
```

## References

- <https://github.com/suimenkathemove/notion-clone/commit/11d8fac9f0480eb7fdda9a0824a08ca57723eb41>
