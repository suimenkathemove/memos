# AWSのヒント

「構成の把握」と「状態の把握」が重要である。

## ネットワークの構成を把握する

- ネットワークトポロジ(構成図)
- CIDRブロック、IPアドレス、ポートの管理
- サブネットの設定
  - ルートテーブルの設定
- セキュリティグループ、ネットワークACLの設定

## ネットワークの状態を把握する

以下のコマンドを使う

- ping
- traceroute
- telnet
- nslookup, dig

## Troubleshooting

### サーバに接続できないとき

1. クライアント側のネットワーク環境に問題がないことを確認する
   1. そのサーバ以外には接続できることを確認する
2. ホスト名が解決できることを確認する
   1. nslookupやdigを使って、ホスト名が解決できるかを調べる。解決できない場合は、DNSの設定やDNSサービス自体に問題がある。
3. pingでネットワークの疎通を確認する
4. telnetでポート80番に接続する
