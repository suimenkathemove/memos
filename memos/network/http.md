# HTTP(Hyper Text Transfer Protocol)

ハイパーテキスト(ハイパーリンク同士で結び付けられたテキスト)を伝送するための通信規格。
WebブラウザとWebサーバ間は、HTTPというプロトコルを使って通信している。

HTTPはクライアント・サーバ型のアーキテクチャである。
2者間でリクエストとレスポンスをやりとりする方式を定めている。

## リクエストとレスポンス

### リクエスト(Request)

#### リクエストライン(Request Line)

`GET / HTTP/1.1`

##### HTTP Methods

| method | description |
| ------ | ----------- |
| GET    |             |
| POST   |             |

#### ヘッダー(Header)

リクエストの追加情報。

| key        | description               |
| ---------- | ------------------------- |
| Host       | 要求したホスト名          |
| User-Agent | ブラウザの種類            |
| Language   | 対応言語                  |
| Cookie     | Cookieの情報              |
| Referer    | 直前に見ていたページのURL |

#### ボディ(Body)

POSTメソッドやPUTメソッドを利用してサーバにデータを送信するときに利用する。
ヘッダーとボディは空行で区切られる。

### レスポンス(Response)

#### ステータスライン(Status Line)

リクエストの成否を表す。

`HTTP/1.1 200 OK`

| status                    | description                      |
| ------------------------- | -------------------------------- |
| 200 OK                    | 成功                             |
| 404 Not Found             | リソースが見つからない           |
| 500 Internal Server Error | サーバ側で何かしらのエラーが発生 |

#### ヘッダー(Header)

レスポンスの追加情報。

| key            | description        |
| -------------- | ------------------ |
| Content-Type   | ボディの種類を示す |
| Content-Length | ボディの長さを示す |

#### ボディ(Body)

リクエストしたデータ。

- HTML text
- 画像
- JSON
- ...

ヘッダーとボディは空行で区切られる。
