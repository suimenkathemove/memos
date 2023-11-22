# cargo-make

## Features

- 他のMakefile.tomlの継承ができる

## 注意点

- github actionsのrust-cargo-make actionでは`makers`コマンドが使えないため、Makefile.toml内では`cargo make`コマンドを使う。
