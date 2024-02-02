# volta

- [volta](#volta)
  - [command not found](#command-not-found)
  - [Install and use particular version](#install-and-use-particular-version)
  - [Delete package](#delete-package)
  - [Pin](#pin)

## command not found

```shell
volta setup
```

## Install and use particular version

```sh
volta install <tool[@version]>
```

## Delete package

```sh
rm -rf /path/to/.volta/tools/image/[package]/[version]
```

## Pin

package.jsonにnodeやpnpmのバージョンを固定したい場合に使う。

```sh
volta pin <tool[@version]>
```

```sh
# 例えば
volta pin node@20.11.0
```
