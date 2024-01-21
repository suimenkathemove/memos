# Git Submodules

リポジトリ内に他のリポジトリの参照を置くことができる

## add

```shell
// 追加先のディレクトリ内で以下を実行する
git submodule add REPOSITORY_URL PATH
```

.gitmodulesファイルが作成される

コミットする

## clone

```shell
git clone --recursive REPOSITORY_URL
```

以下も同様

1. `git submodule init`
2. `git submodule update`
