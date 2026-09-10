# Neovim の設定

## ディレクトリ構成

```text
nvim/
├── init.lua              -- エントリポイント。leader と lazy.nvim の bootstrap
├── lazy-lock.json        -- プラグインのロックファイル
└── lua/
    ├── options.lua       -- vim.opt
    ├── keymaps.lua       -- vim.keymap.set
    └── plugins/          -- 1 ファイル 1 プラグイン
```

`lua/plugins/` は lazy.nvim の `import = "plugins"` で一括読み込みしている。

## VS Code との共存

VS Code の Neovim 拡張からも同じ設定を読む。
`vim.g.vscode` で分岐し、UI 系プラグインは `cond = not vim.g.vscode` で無効化する。

- `lua/options.lua` / `lua/keymaps.lua` : 共通部分と、`if not vim.g.vscode then` で
  囲んだ Neovim 専用部分に分けている
- `lua/plugins/vscode.lua` : VS Code のときだけ Git 操作を VS Code 側のコマンドに委譲する

## プラグイン

### 基盤

- `folke/lazy.nvim` : プラグインマネージャ
- `folke/snacks.nvim` : 起動画面（dashboard）
- `nvim-treesitter/nvim-treesitter` : ハイライト・インデント

### ファイラ

- `stevearc/oil.nvim` : ファイラ（バッファ編集型）
  - `refractalize/oil-git-status.nvim` : oil に git の状態を表示
- `folke/snacks.nvim` : ファイラ（ドロワー型の explorer）

### Fuzzy Search

- `folke/snacks.nvim` : ピッカー（picker）

### LSP

- `neovim/nvim-lspconfig` : LSP のクライアント設定
- `williamboman/mason.nvim` : LSP サーバのインストーラ

### Git

- `tpope/vim-fugitive`
  - git status
  - 左右分割の差分画面

### テーマ・アイコン

- `Mofiqul/dracula.nvim` : カラースキーム
- `DaikyXendo/nvim-material-icon` : ファイルタイプ別アイコン（Material Design Icons。nvim-web-devicons 互換）

## プラグインのキーマップ

- `<leader>e` : oil をカレントウィンドウで開閉
- `-` : 親ディレクトリを oil で開く
- `<C-n>` : oil をフロートで開閉
- `<leader>E` : snacks explorer（ドロワー）を開閉
- `<leader>ff` / `fg` / `fb` / `fh` : snacks picker でファイル / grep / バッファ / ヘルプ

## 参考

- skanehira <https://github.com/skanehira>
  - [skanehira/dotfiles](https://github.com/skanehira/dotfiles) の `vim/`（ブランチは `master`）
  - `lua/` を `settings/`・`plugins/`・`modules/` に分ける。`modules/` は自作の機能
  - Git は gin.vim + diffview + gitsigns。status バッファのキーマップを自分で組んでいる
- ryoppippi <https://github.com/ryoppippi>
  - [ryoppippi/dotfiles](https://github.com/ryoppippi/dotfiles) の `nvim/`（ブランチは `main`）
  - `lua/plugin/` に 1 プラグイン 1 ファイルで並べる
  - Git 用の統合 UI は持たず、gitsigns と octo.nvim
- mozumasu <https://github.com/mozumasu>
  - [mozumasu/dotfiles](https://github.com/mozumasu/dotfiles) の `.config/nvim/`（ブランチは `main`）
  - LazyVim ベース。`lua/plugins/` を `base/`・`editor/`・`lsp/`・`ui/` に分ける
  - Git は diffview + gitsigns + octo.nvim。Neogit のような統合 UI は持たない
