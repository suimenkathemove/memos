# App Routerのルーティング

`app/`ディレクトリの構成がそのままURLになる。
ページの実体はファイル名ではなく、予約ファイル名で決まる。

- `page.tsx`: そのURLのページ。これが無いとルートとして公開されない。
- `layout.tsx`: 配下を包む共通レイアウト。
- `loading.tsx`: 同階層をSuspenseで包む。
- `error.tsx`: 同階層をError Boundaryで包む。
- `not-found.tsx`: `notFound()`が呼ばれたときの表示。
- `route.ts`: Route Handler。ページではなくAPIエンドポイントになる。

## layout.tsx

URL階層とレイアウト階層が一致する。
ネストした場合は外側から順に入れ子になる。

ページ遷移してもlayoutは再マウントされず、stateやスクロール位置が保持される。
遷移のたびにリセットしたい場合は`template.tsx`を使う。

## loading.tsxとerror.tsx

自分で境界コンポーネントを書いてツリーに差し込む代わりに、ファイルを置く場所で境界の範囲が決まる。

- `loading.tsx`: 同階層の`page.tsx`をSuspenseで包み、その中身をfallbackにする。
  Server Componentの`await`が終わるまで表示され、準備できた部分からストリーミングで流れる。
- `error.tsx`: 同階層をError Boundaryで包む。Client Componentである必要がある。
  `reset`関数を受け取り、再レンダリングを試せる。
  - 同階層の`layout.tsx`のエラーは捕捉できない。1つ上の階層の`error.tsx`が受ける。
  - ルートレイアウトのエラーは`global-error.tsx`で受ける。

境界がURL階層と一致するため、`/dashboard/settings`で失敗しても`/dashboard`のレイアウトは残る、といった挙動になる。

## Route Groups

`(folder)`のように括弧で囲むと、URLに含まれないディレクトリになる。

```text
app/
  (marketing)/
    layout.tsx      → /about と /pricing に適用される
    about/page.tsx  → /about
    pricing/page.tsx→ /pricing
  (app)/
    layout.tsx      → /dashboard に適用される
    dashboard/page.tsx
```

URL階層を変えずにレイアウトを分けたいときに使う。
ログイン前後でレイアウトを変える、といったケース。

## Dynamic Segments

- `[id]`: 1つのセグメントにマッチ。
- `[...slug]`: 残り全てにマッチ（catch-all）。
- `[[...slug]]`: セグメントが無い場合にもマッチ（optional catch-all）。

Server Componentでは`params`がpropsで渡る。

```tsx
export default async function Page({ params }) {
  const { slug } = await params;
}
```

Client Componentでは`useParams`を使う。

```tsx
const params = useParams();
```

## Parallel Routes

`@`を付けたディレクトリがスロットになり、1つのレイアウトに複数のページを同時に描画する。

```text
app/
  layout.tsx
  page.tsx
  @team/page.tsx
  @analytics/page.tsx
```

スロットは`layout.tsx`にpropsとして渡る。

```tsx
export default function Layout({ children, team, analytics }) {
  return <>{children}{team}{analytics}</>;
}
```

各スロットが独立していて、それぞれが自分の`loading.tsx`, `error.tsx`を持てる。
片方の取得が遅くても、もう片方は先に表示できる。片方が失敗してもそこだけエラー表示になる。

直接URLアクセスやリロードのときにスロットがURLと一致しないと404になるため、`default.tsx`を置いて回避する。

## Intercepting Routes

アプリ内から遷移したときだけ、そのルートを現在のレイアウトの中に差し込む。
ディレクトリ名に記法を使い、`(.)`が同階層、`(..)`が1つ上、`(...)`がルートから。

同じURLでも到達経路によって見え方が変わる。

- 一覧からクリックして遷移: モーダルで表示。背景の一覧は残る。URLは`/photo/1`になる。
- そのURLを直接開く、リロードする: 通常のページとして全画面表示。

## モーダルの実装

URLを共有できるモーダルが実現できる。
X（旧Twitter）がこの挙動。
タイムラインで画像をクリックすると、背景にタイムラインを残したままモーダルで開き、URLは`/user/status/123/photo/1`に変わる。
そのURLを共有して直接開くと、全画面のページになる。

```text
app/
  @modal/(.)photo/[id]/page.tsx   → アプリ内遷移時。モーダル
  photo/[id]/page.tsx             → 直接アクセス時。全画面
```

Parallel Routesでモーダル用のスロットを作り、Intercepting Routesでそこに差し込む。
Pages Routerでは、モーダルの状態を自前で管理してURLと同期させる必要があった。

## 参考

<https://nextjs.org/docs/app/building-your-application/routing>
