# Neovim の Git 連携プラグイン

- Neogit : status・ステージング・コミット・rebase・stash の統合 UI
  - 左右分割の差分画面は持たない。左右分割は外部ビューアに委譲する設計になっている。
- Diffview : 左右分割の差分とファイルツリーのパネル
  - ファイルパネルが git status 相当
  - 行単位のステージは持たない。右のウィンドウは実ファイルなので gitsigns に任せる
- gitsigns : gutter の sign と行単位・hunk 単位のステージ
  - git statusの画面は持たない
- vim-fugitive : status・ステージング・コミット・左右分割の差分・任意の git コマンド実行を単体で持つ Git ラッパー
  - Diffview のようなファイルツリーのパネルはない
- lazygit : status・ステージング・コミット・rebase・stash を持つ独立した TUI
  - 差分は unified 固定で、左右分割は持たない
  - 行単位のステージはできる。差分ペインで `v` で行を選択して `<Space>`
  - Neovim の外のプロセスなので、バッファやキーマップとは連携しない
