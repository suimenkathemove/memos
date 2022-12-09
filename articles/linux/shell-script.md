# shell script

## lint, format

- [ShellCheck](https://marketplace.visualstudio.com/items?itemName=timonwong.shellcheck)
- [shell-format](https://marketplace.visualstudio.com/items?itemName=foxundermoon.shell-format)

## Variables

| what  | description    |
| ----- | -------------- |
| $HOME | home directory |

## arguments

| what      | description                                  |
| --------- | -------------------------------------------- |
| $0        | script name                                  |
| $1        | 1番目の引数                                  |
| $@        | すべての引数                                 |
| ${1:-foo} | 1番目の引数のデフォルト値としてfooを代入する |

## Functions

```shell
function_name() {
  # 処理
}
```

## if statement

### Options

```shell
if [ [options] [file|dir] ]; then
  # code
fi
```

| option | description              |
| ------ | ------------------------ |
| -f     | ファイルが存在するか     |
| -d     | ディレクトリが存在するか |
