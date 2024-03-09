# cargo-make

## References

- <https://github.com/suimenkathemove/monorepo-sandbox/blob/main/backend/Makefile.toml>

## Features

- 他のMakefile.tomlの継承ができる

## 注意点

- github actionsのrust-cargo-make actionでは`makers`コマンドが使えないため、Makefile.toml内では`cargo make`コマンドを使う。

## API

### コマンドの定義方法

- commandとargsを使う方法
- scriptを使う方法

引数を受け取りたい場合は`${@}`を使う。

### profile

defaultはdevelopment
