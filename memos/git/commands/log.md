# log

## options

| option   | description      |
| -------- | ---------------- |
| --pretty | フォーマット     |
| --author | コミットの作成者 |
| --       | ファイルの指定   |

```sh
git log --pretty=format:"%s" --author="suimenkathemove" -- src
```

### pretty=format

| format | description        |
| ------ | ------------------ |
| %s     | コミットメッセージ |
