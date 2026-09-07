# データ取得

## Server State

API から取得したデータのキャッシュ・再検証・ローディング / エラー状態。

## Server Stateのライブラリの候補

- TanStack Query: 機能が最も豊富。ページング・無限スクロール・楽観的更新。
- SWR: Vercel 製で軽量。Next.js と相性が良いが機能は絞られる。
- Server Component + `fetch`: ライブラリなしで RSC 側で取得。App Router 本来の形。
