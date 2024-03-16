# package install

| distribution                  | command  |
| ----------------------------- | -------- |
| Red Hat系(CentOS, Fedoraなど) | yum, dnf |
| Debian系(Ubuntuなど)          | apt-get  |

## yum

```sh
# パッケージの更新
# -yはyes
yum update -y
# パッケージのインストール
yum install -y xxx
```

## dnf

yumコマンドの後継。

```sh
dnf update -y
dnf install -y xxx
```

## apt-get

```sh
# パッケージリストの更新
apt-get update
# パッケージの更新
apt-get upgrade -y
# パッケージのインストール
apt-get install -y xxx
```
