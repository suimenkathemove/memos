# App Router

Next.jsのルーティング方式には、App RouterとPages Routerがある。
（1つのプロジェクトに共存もできる。）

## Pages Router

Next.js 13以前からある方式。`pages/`ディレクトリのファイル構成がそのままURLになる。

- 全てのコンポーネントがクライアント向けにバンドルされる。
- データ取得はページ単位。
  `getStaticProps`（SSG）, `getServerSideProps`（SSR）をページコンポーネントからexportして指定する。
- 共通レイアウトは`_app.tsx`で組む。
  URL階層とは独立しているため、ページごとに出し分けたい場合は`getLayout`パターンなどの工夫が要る。

## App Routerとは

Next.js 13で追加され、14以降の推奨方式。
`app/`ディレクトリを使う。
React Server Componentsを前提に作られている。

RSCをPages Routerに後付けできなかったため、ルーターごと作り直したもの。
Pages Routerはページ単位のデータフローとhydrationが前提で、コンポーネント単位のRSCと噛み合わない。
そのため`app/`という別ディレクトリで共存させる形になった。

Pages Routerとの主な違いは大きく2つ。

- RSC対応
  - デフォルトがServer Component
  - データ取得がページ単位ではなくコンポーネント単位。ページ内でキャッシュ期間を混在できる。
- ルーターの改善
  - ルーティングがファイル名ではなく予約ファイル名で決まる
    （`page.tsx`, `layout.tsx`, `loading.tsx`, `error.tsx`など）。
  - `layout.tsx`によってURL階層とレイアウト階層が一致する。
  - Parallel Routes / Intercepting Routesが使える。

ルーターの改善の詳細は[App Routerのルーティング](./routing.md)を参照。

## App RouterかPages Routerか

新規プロジェクトでは App Router を選ぶ。Pages Router は基本的に既存プロジェクトの保守用途。

App Router が向くケース

- サーバー側でデータを取得してHTMLを返したい（Server Componentで直接`await`できる）。
- URL階層に沿った共通レイアウトを自動で持たせたい。
- SSR/SSG/ISRをデータ取得単位で使い分けたい。

App Router でなくてもよいケース

- 認証後のダッシュボードのように、ほぼ全てがクライアント側の状態で動く画面。
  結局大半がClient Component（`'use client'`）になり、Server Componentの恩恵が薄い。

今から Pages Router を選ぶケースは少ないが、次のような場合はありうる。

- 依存ライブラリがApp Router / RSCに対応していない。
  以前は状態管理やCSS-in-JSで問題になったが、現在はほぼ解消している。

Pages Router自体は非推奨（deprecated）ではなく、今もメンテナンスされている（2026-09、Next.js 16時点）。
ただし新機能はApp Router側に入るため、長期的には移行前提で考える。

そもそもSSRが要らず静的配信するだけなら、Next.jsではなくVite + React Routerを検討する。

## レンダリングの種類

App Routerでも、CSRとSSRの両方がある。
Client Componentは名前に反してCSRではなく、初回はサーバーでもレンダリングされる。

- Server Component
  - サーバーでのみ実行。HTMLを生成し、JSはクライアントに送られない。hydrateもされない。
- Client Component
  - 初回リクエスト時はサーバーでもプリレンダリングされてHTMLになり、その後クライアントでhydrateされる。
    以降のstate更新やイベント処理はクライアント側。
- 完全なCSR
  - 明示的にオプトアウトした場合のみ。`next/dynamic`の`ssr: false`や、`useEffect`内でのfetchなど。

App Routerではデフォルトで全てのコンポーネントがServer Componentになる。

SSR/SSG/ISRの区別はServer Component側の話で、`fetch`のキャッシュ設定やルートセグメント設定で決まる。

### Pages Routerとの対応

概念は全て残っているが、呼び方と指定方法が変わった。
公式ドキュメントはStatic Rendering / Dynamic Rendering / Streamingという語を主に使う。
ISRだけは名前が残っている。

| Pages Router                           | App Router                    |
| -------------------------------------- | ----------------------------- |
| SSG（`getStaticProps`）                | Static Rendering              |
| ISR（`getStaticProps` + `revalidate`） | Static Rendering + revalidate |
| SSR（`getServerSideProps`）            | Dynamic Rendering             |
| CSR（`useEffect`でfetch）              | Client-side fetching          |

`getStaticProps`, `getServerSideProps`はApp Routerでは使えない。代わりに`fetch`のオプションで指定する。

```tsx
const res = await fetch(url)                               // デフォルトはStatic Rendering
const res = await fetch(url, { next: { revalidate: 60 } }) // ISR相当
const res = await fetch(url, { cache: 'no-store' })        // SSR相当
```

ルートセグメント単位でまとめて指定もできる。

```tsx
export const revalidate = 60            // ルート全体をISR
export const dynamic = 'force-dynamic'  // ルート全体をSSR
```

### データ取得単位で決まる

ページ単位ではなくデータ取得単位で決まるのが、Pages Routerとの一番の違い。
1つのページの中に「1時間キャッシュするヘッダー」と「毎回取得する在庫数」を混在させられる。

`cookies()`, `headers()`, `searchParams`を使うと自動的にDynamic Renderingに切り替わる。
「SSGのつもりが全部SSRになっていた」は起きやすいので、`next build`の出力（`○` Static / `ƒ` Dynamic）で確認する。
