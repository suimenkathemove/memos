# GitHub Actions

## Workflow

### using

`using: composite`は、単一のアクション内で複数のコマンドやステップを実行できるようにする。

### paths

CIを任意のpathが変更された場合のみ走らせたい場合は、pathsを指定する。
例えばbackendとfrontendのmonorepoがあった場合に、backendのCIはbackendのディレクトリが変更された場合にのみ走らせたい場合は以下のようにする。

<https://github.com/suimenkathemove/notion-clone/pull/31/commits/64a8392756e4138b0b5c8c3352912c016a0973b4>
