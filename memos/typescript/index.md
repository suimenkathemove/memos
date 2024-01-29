# TypeScript

## Troubleshooting

### `FATAL ERROR: Reached heap limit Allocation failed - JavaScript heap out of memory`

このエラーはJavaScriptエンジンに割り当てられたヒープメモリを使い果たしてメモリリークを起こしたときに発生する。

解決策

1. メモリリークの調査
2. ヒープメモリのサイズを増加させる
   1. `--max-old-space-size`オプションを使用する
