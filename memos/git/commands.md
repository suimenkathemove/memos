# Git Commands

- [Git Commands](#git-commands)
  - [checkout](#checkout)
    - [他のブランチのディレクトリで上書きする](#他のブランチのディレクトリで上書きする)
    - [参考](#参考)
  - [diff](#diff)
    - [options](#options)
  - [log](#log)
    - [options](#options-1)
      - [pretty=format](#prettyformat)
  - [delete merged branches on remote(WIP)](#delete-merged-branches-on-remotewip)

## checkout

### 他のブランチのディレクトリで上書きする

```shell
git checkout BRANCH DIR
```

### 参考

<https://t-cr.jp/memo/1a817a9f72658927a>

## diff

```shell
git diff <branch1>..<branch2>
```

### options

| option      | description   |
| ----------- | ------------- |
| --name-only | only filename |

## log

### options

| option   | description      |
| -------- | ---------------- |
| --pretty | フォーマット     |
| --author | コミットの作成者 |
| --       | ファイルの指定   |

```sh
git log --pretty=format:"%s" --author="suimenkathemove" -- src
```

#### pretty=format

| format | description        |
| ------ | ------------------ |
| %s     | コミットメッセージ |

## delete merged branches on remote(WIP)

自分がマージしたPRのブランチをローカルとリモートで削除する。

```sh
# マージ済みのリモートブランチを表示する
git branch --remotes --merged

gh pr list --state closed
```
