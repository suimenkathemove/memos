# sed

- [sed](#sed)
  - [sed: RE error: illegal byte sequence](#sed-re-error-illegal-byte-sequence)
  - [Links](#links)

文字列の編集を行う

| option | description                                                                                          |
| ------ | ---------------------------------------------------------------------------------------------------- |
| -i     | in-place editing. ファイルのバックアップを作成せず直接編集する。MacOSの場合は`-i ''`とする必要がある |

## sed: RE error: illegal byte sequence

このエラーが起きたら

```sh
# 文字エンコーディングの設定
export LC_CTYPE=C
```

## Links

- <https://github.com/suimenkathemove/dotfiles_private/blob/main/fraim/lawgue/aws/Makefile>
