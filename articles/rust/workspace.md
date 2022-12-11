# Workspace

## Overview

ルートディレクトリに以下の内容のCargo.tomlを作成する

`Cargo.toml`

```toml
[workspace]
members = ["backend", "models"]
resolver = "2"
```

<https://github.com/suimenkathemove/slack-clone/blob/main/Cargo.toml>

`Cargo.toml`

```toml
[workspace]
members = ["*"]
exclude = [".git", ".vscode", "target"]
resolver = "2"
```

<https://github.com/suimenkathemove/rust_sandbox/blob/main/Cargo.toml>

## 他のcrateを使用する

`Cargo.toml`

```toml
CRATE = { path = "../CRATE" }
```
