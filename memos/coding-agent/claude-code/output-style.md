# Output Style

システムプロンプト自体を差し替える機能。
役割・口調・出力形式を毎ターン変えたいときに使う。

## CLAUDE.md との違い

挿入される場所が違う。Output Style のほうが上流に効くので、文体の支配力は強い。

|              | 仕組み                                                 |
| ------------ | ------------------------------------------------------ |
| Output Style | システムプロンプトを書き換える                         |
| CLAUDE.md    | システムプロンプトの後ろにユーザーメッセージとして入る |

プロジェクトの規約やコードベースの文脈は CLAUDE.md に書く。
Output Style は役割・トーン・出力形式を変える用途に限る。

## 組み込みスタイル

- Default: 通常のソフトウェアエンジニアリング用
- Proactive: 確認を挟まず即実行する。auto モードより強い自律実行の指示
- Concise: 結論から述べ、前置きと実況を省く（v2.1.237 以降）
- Explanatory: 作業の合間に解説を挟む
- Learning: Claude がコードに `TODO(human)` を置き、その箇所は人間が書く

## 切り替え方

`/config` の Output style から選ぶ。
選択はプロジェクトの `.claude/settings.local.json` に保存されるので、そのプロジェクトだけに効く。

反映はセッション開始時の1回のみ。`/clear` か新しいセッションで効く。

## 自作する

Markdown ファイルを置く。ファイル名がスタイル名になる。

- ユーザー: `~/.claude/output-styles/`
- プロジェクト: `.claude/output-styles/`

```md
---
name: Diagrams first
description: 説明は必ず図から始める
keep-coding-instructions: true
---

コードやアーキテクチャを説明するときは、図を先に出してから文章で説明する。
```

`keep-coding-instructions` を `true` にしないと、Claude Code 標準の
ソフトウェアエンジニアリング指示（変更範囲の決め方・コメントの書き方・検証の仕方）が
まるごと外れる。文体だけ変えたいなら必ず `true` にする。

## 適用範囲

メインの会話にのみ効く。サブエージェントは自前のシステムプロンプトで動くので影響を受けない。
fork だけは例外で、親のシステムプロンプトをそのまま引き継ぐ。

## 参考

- <https://code.claude.com/docs/en/output-styles>
