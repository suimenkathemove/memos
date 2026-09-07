# React Server Components

RSCは個々のコンポーネントではなくアーキテクチャ全体の名前。
コンポーネントにはServer ComponentとClient Componentの2種類がある。

サーバーはコンポーネントツリーをRSC Payloadという形式で表現する。
RSC Payloadに載るのはServer Componentのレンダリング結果と、Client Componentの参照（どのモジュールを読むか）とそのprops。
Server Component自体のコードは載らないため、クライアントに送られない。
Server ComponentからClient Componentへ渡すpropsがシリアライズ可能でなければならないのは、この形式に載せる必要があるため。

## Server Component

Server Componentとは、サーバー側でのみ実行されるコンポーネント。
RSC対応のフレームワークでは、デフォルトで全てのコンポーネントがServer Componentになる。
クライアント側で動かしたい場合は、ファイルの先頭に`'use client'`を書いてClient Componentにする。

Server Componentの特徴

- コンポーネント内で直接`await`できる。
- ブラウザAPI, `useState`, `useEffect`, `onClick`などは使えない。

## 使い分け

### Client Componentにする条件

- `useState`, `useEffect`などのhookを使う。
- `onClick`, `onChange`などのイベントハンドラを付ける。
- `window`, `localStorage`などのブラウザAPIを触る。
- Contextを使う。
- クライアント専用ライブラリを使う。

### 境界の設計

`'use client'`はそのファイルからimportするツリー全体をクライアント化するため、
ページ全体ではなくインタラクティブな部分だけを小さいコンポーネントに切り出す。

Client Componentの`children`としてなら、Server Componentを渡してもServerのまま維持される。
Provider系をルートに置いても全てがクライアントにならないのはこのため。

境界を決めるのはimportグラフであって、レンダリングツリーの親子関係ではない。
importしたものは`'use client'`を書かなくてもClient Componentになり、
propsで渡したものはレンダリングツリー上で配下にあってもServer Componentのまま。

渡した時点でサーバーでのレンダリングは終わっている。
Client Component側で`{isOpen && children}`のように条件付きで表示していても、
サーバーでは実行済みでデータ取得も走っている。「開いたときに取得」にはならない。
Client Componentのstateが変わってもServer Componentは再実行されない。
再実行にはルーターのリフレッシュやServer Actionsが要る。

### Server Componentのメリット

セキュリティ

- APIキーやDBの接続情報をコンポーネント内で直接扱える。バンドルに含まれないため漏れない。
- 認可チェックをサーバー側で完結できる。権限がなければデータもUIも生成されない。

パフォーマンス

- JSバンドルサイズ。Server Componentのコードとそこでしか使わない依存はクライアントに送られない。
  markdownパーサ、シンタックスハイライタ、日付/i18nライブラリなどで効果が大きい。
- データ取得のウォーターフォール解消。
  クライアントでの「HTML受信 → JS DL → hydrate → fetch → 描画」という直列の待ちが減る。
  Server Componentでは「サーバーでfetch → データを含むHTMLを送信 → 表示」になる。
  サーバーとDBの距離が近いため、1段あたりも短い。
- hydrationコスト。Client Componentが多いほど初回のJS実行時間が増える。
  `'use client'`を葉に押し下げるのは、hydrate対象を減らす意味もある。
- FCPの改善。準備できた部分からストリーミングで段階的に届けられる。

データ取得の書きやすさ

- `async`コンポーネントで直接`await`できるので、`useEffect` + loading/error stateが不要になる。

SEO・初期表示は理由にならない。Client Componentも初回はサーバーでプリレンダリングされるため。

### Server Componentのデメリット

できないこと

- state, イベントハンドラ, ブラウザAPI, Contextが使えない。
  少しでもインタラクションが要るなら結局Client Componentに切り出すことになる。
- Client Componentへ渡すpropsはシリアライズ可能でなければならない。
  関数を渡せないため、コールバックを渡す設計は使えない。Server Actionsで代替する。

運用面

- リクエストごとにレンダリングする場合、そのたびにサーバーで実行される。
  負荷とコストがトラフィックに比例する。
  実行環境が要るため、ファイルを置くだけの静的ホスティングでは配信できない。
- 更新のたびにサーバーへ往復するため、細かいUIの即時反映には向かない。

開発面

- 境界をどこに引くかの判断が常に付きまとう。設計の認知コストが増える。
- 多くのnpmライブラリが`'use client'`前提で書かれており、そのままでは使えないことがある。
- サーバーで実行されるためブラウザのDevToolsで追えない。ログはサーバー側に出る。
- `async`コンポーネントはReact Testing Libraryで素直にテストできず、E2Eに寄せることになる。

## Server Actions

`'use server'`を付けた関数はサーバーでのみ実行され、クライアントから呼び出せる。
関数本体はクライアントに送られず、参照だけがPayloadに載る。
呼び出すとその参照に対するPOSTになる。

Client ComponentにコールバックをpropsとしてServer Componentから渡せない制約は、これで回避する。
渡るのは関数ではなく参照なのでシリアライズできる。

定義は2通り。

```tsx
// ファイル全体をServer Actionsにする
'use server';

export async function createPost(formData: FormData) {
  await db.post.create({ data: { title: formData.get('title') } });
}
```

```tsx
// Server Component内で関数単位に付ける
export default function Page() {
  async function createPost(formData: FormData) {
    'use server';
    await db.post.create({ data: { title: formData.get('title') } });
  }

  return <form action={createPost}>...</form>;
}
```

呼び出し方

- `<form action={fn}>`。JSが読み込まれる前でも動く。
- `useActionState`で戻り値とpending状態を受け取る。
- `useOptimistic`で楽観的更新を行う。
- Client Componentから直接`await fn()`することもできる。

### Server Actionsの注意

- 引数と戻り値はシリアライズ可能である必要がある。
- **公開エンドポイントになる。**
  URLを知られれば認証なしのリクエストも届くため、関数の中で認可チェックを行う。UIで出し分けていても防御にならない。
- 実行してもServer Componentは自動では再描画されない。
  Next.jsなら`revalidatePath`, `revalidateTag`でキャッシュを無効化する。
- 順次実行される。複数を同時に呼んでも直列になる。
