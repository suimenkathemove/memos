# HTTP(Hyper Text Transfer Protocol)

ハイパーテキスト(ハイパーリンク同士で結び付けられたテキスト)を伝送するための通信規格。
WebブラウザとWebサーバ間は、HTTPというプロトコルを使って通信している。

HTTPはクライアント・サーバ型のアーキテクチャである。
2者間でリクエストとレスポンスをやりとりする方式を定めている。

## リクエストとレスポンス

### リクエスト(Request)

#### リクエストライン(Request Line)

HTTPメソッドとHTTPのバージョン。

`GET / HTTP/1.1`

##### HTTPメソッド, HTTP Methods

リソースに対するコマンド。

| method  | description                                    |
| ------- | ---------------------------------------------- |
| GET     | リソースを取得する                             |
| POST    | リソースをボディ部に入れて送信する             |
| HEAD    | リソースのヘッダー情報だけ取得する             |
| PUT     | リソースを更新する                             |
| PATCH   |                                                |
| DELETE  | リソースを削除する                             |
| OPTIONS | サーバがサポートしているHTTPメソッドを取得する |
| TRACE   |                                                |
| CONNECT |                                                |

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

HTTPのバージョンとHTTPステータスコード。

`HTTP/1.1 200 OK`

##### HTTPステータスコード, HTTP Status Code

リクエストの成否を表す。

| status                    | description                                                        |
| ------------------------- | ------------------------------------------------------------------ |
| 1xx                       | 処理中                                                             |
| 2xx                       | 成功                                                               |
| 200 OK                    | 成功                                                               |
| 3xx                       | リダイレクト                                                       |
| 4xx                       | クライアントエラー                                                 |
| 401 Unauthorized          | 認証が必要                                                         |
| 403 Forbidden             | アクセス禁止                                                       |
| 404 Not Found             | リソースが見つからない                                             |
| 5xx                       | サーバエラー                                                       |
| 500 Internal Server Error | サーバ側で何かしらのエラーが発生                                   |
| 503 Service Unavailable   | 一時的に接続できない、サーバが受け入れ可能な接続数を超えたときなど |

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
