# Concurrency 並行処理

goroutine⋯スレッド

go文は関数を新しいgoroutineを立ち上げて、その中で実行する。

## チャネル

チャネルとは、スレッド間でデータをやり取りするためのしくみ。導管。

### チャネルの性質

[チャネルの状態ごとの挙動](https://docs.google.com/presentation/d/1WDVYRovp4eN_ESUNoZSrS_9WzJGz_-zzvaIF4BgzNws/edit#slide=id.gd0f0d38d56_0_1329)

- 送信専用チャネル
- 受信専用チャネル
- 双方向チャネル

nil channelは常にブロックされる。

closedなチャネルはブロックされない。

バッファがないチャネルは送受信の準備が整っていなければブロックされる。
そのため実行同期のためのしくみにもなる。

## goroutineが終わるのを待つためには

- WaitGroupを使う
- バッファなしチャネルを使う

## Troubleshooting

### for文でgo文を実行する場合

### データ競合

- バッファなしチャネルを使う(1番安全)
- sync.Mutexを使う

## 参考

- <https://zenn.dev/hsaki/books/golang-concurrency/viewer/basicusage>
- <https://zenn.dev/hsaki/books/golang-concurrency/viewer/appliedusage>
- <https://zenn.dev/hsaki/books/golang-concurrency/viewer/analysis>
