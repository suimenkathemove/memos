# nslookup, dig

## nslookup

DNSサーバに対して名前解決リクエストを送信する。

```sh
nslookup <hostname or ip address>
```

`Non-authoritative answer`は、権威DNSサーバではなくキャッシュDNSサーバからの応答であることを示す。

権威DNSサーバとは、そのネットワーク(ドメイン)の情報を保持しているDNSサーバのこと。

## dig

digコマンドはより詳細な情報を取得できる。

```sh
dig <hostname or ip address>
```

以下の情報を取得できる。

- ホストのIPアドレス
- 権威DNSサーバ、キャッシュDNSサーバ
- クエリにかかった時間やタイムスタンプ
