# Neovim の Git 連携プラグイン

- Neogit : status・ステージング・コミット・rebase・stash の統合 UI
  - 左右分割の差分画面は持たない。左右分割は外部ビューアに委譲する設計になっている。
  - popup で操作を発見できる。`c` でコミット、`r` で rebase、`z` で stash のサブコマンドが一覧で出る
- Diffview : 左右分割の差分とファイルツリーのパネル
  - ファイルパネルが git status 相当
  - 行単位のステージは持たない。右のウィンドウは実ファイルなので gitsigns に任せる
  - コミット・rebase・stash は持たない。Neogit か vim-fugitive か lazygit と組み合わせる
- gitsigns : gutter の sign と行単位・hunk 単位のステージ
  - git statusの画面は持たない
- vim-fugitive : status・ステージング・コミット・左右分割の差分・任意の git コマンド実行を単体で持つ Git ラッパー
  - Diffview のようなファイルツリーのパネルはない
  - popup は無く、`:Git <任意のコマンド>` を打つ前提。popup に無い操作も同じ体系で叩ける
  - 依存が無い
- lazygit : status・ステージング・コミット・rebase・stash を持つ独立した TUI
  - 差分は unified 固定で、左右分割は持たない
  - 行単位のステージはできる。差分ペインで `v` で行を選択して `<Space>`
  - Neovim の外のプロセスなので、バッファやキーマップとは連携しない
