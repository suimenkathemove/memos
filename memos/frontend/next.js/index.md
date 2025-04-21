# Next.js

## API

### URL系

Dynamic Segmentを取得したい場合は`useParams`を使う。

例えば、`/blog/[slug]`というURLのパスから`[slug]`を取得したい場合は、

```tsx
const params = useParams();
console.log(params.slug);
```

で取得できる。
