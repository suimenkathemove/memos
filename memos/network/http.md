# HTTP(Hyper Text Transfer Protocol)

- [HTTP(Hyper Text Transfer Protocol)](#httphyper-text-transfer-protocol)
  - [リクエストとレスポンス](#リクエストとレスポンス)
    - [リクエスト(Request)](#リクエストrequest)
      - [リクエストライン(Request Line)](#リクエストラインrequest-line)
        - [HTTPメソッド, HTTP Methods](#httpメソッド-http-methods)
        - [HTTP](#http)
      - [ヘッダー(Header)](#ヘッダーheader)
      - [ボディ(Body)](#ボディbody)
    - [レスポンス(Response)](#レスポンスresponse)
      - [ステータスライン(Status Line)](#ステータスラインstatus-line)
        - [HTTPステータスコード, HTTP Status Code](#httpステータスコード-http-status-code)
      - [ヘッダー(Header)](#ヘッダーheader-1)
      - [ボディ(Body)](#ボディbody-1)

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

##### HTTP

`HTTP/1.0`, `HTTP/1.1`, `HTTP/2`がある。

1系は、1つのコンテンツをやりとりする度に接続し直す。
2は、1つの接続で複数のコンテンツを並列してやりとりする方式。

#### ヘッダー(Header)

リクエストの追加情報。

| key        | description               |
| ---------- | ------------------------- |
| Host       | 要求したホスト名          |
| User-Agent | ブラウザの種類            |
| Language   | 対応言語                  |
| Cookie     | Cookieの情報              |
| Referer    | 直前に見ていたページのURL |

HTTP/2における擬似ヘッダーは、HTTP/1.1におけるリクエストラインやステータスラインなどに記述されていた情報で、`:`から始まる。

| 擬似ヘッダー | 対応するHTTP/1.1の仕様            |
| ------------ | --------------------------------- |
| :authority   | Host                              |
| :method      | HTTP Methods                      |
| :path        | リクエストラインのパス名          |
| :scheme      | リクエストのスキーム(http, https) |
| :status      | ステータスライン                  |

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
