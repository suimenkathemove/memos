# linux commands

## mkdir

| option        | description                        |
| ------------- | ---------------------------------- |
| -p, --parents | 親ディレクトリが無ければそれも作成 |

## link

### create

```shell
ln [OPTIONS] TARGET LINK_NAME
```

#### options

| option               | description                                                                   |
| -------------------- | ----------------------------------------------------------------------------- |
| -s, --symbolic       | symlink                                                                       |
| -f, --force          | force                                                                         |
| -n, --no-dereference | LINK_NAMEがディレクトリへのシンボリックリンクの場合、通常のファイルとして扱う |
|                      | ディレクトリへのシンボリックリンクを上書きしたい場合に-fと組み合わせて使う    |
| -v, --verbose        | verbose                                                                       |

## alias

### list

```shell
alias
```

### create

```shell
alias NAME=VALUE
```

有効なのはログアウトするまでだから.zshrcに書く

### Use alias in shell script

```shell
shopt -s expand_aliases
```

## print current dir

```shell
basename $(pwd)
```

`CURRENT_DIR="$(basename "$(pwd)")"`

## [create my commands](https://github.com/emgniddikur/dotfiles/blob/main/.commands/README.md)
