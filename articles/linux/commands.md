# linux commands

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

### create

```shell
alias NAME=VALUE
```

有効なのはログアウトするまでだから.zshrcに書く
