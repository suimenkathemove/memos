# find

```sh
find [検索開始ディレクトリ] [オプション] [検索ファイル名]
```

## find + sed

sedと合わせて使うことができる。

```sh
export LC_CTYPE=C

find "$STARTING_POINT" -type f -exec sed -i '' "s/$SEARCH_STRING/$REPLACE_STRING/g" {} +
```
