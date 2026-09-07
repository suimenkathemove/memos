# Claude Code セッション

## セッション一覧の表示・再開

- 対話中: `/resume` で一覧を表示し、選んで再開する。
- 起動時: `claude --resume`（`-r`）で一覧を表示 → 選択して再開。
- 直前のセッションをすぐ再開: `claude --continue`（`-c`）。

セッションの実体は、`~/.claude/projects/<パスをエンコードしたディレクトリ>/*.jsonl` に保存される。
