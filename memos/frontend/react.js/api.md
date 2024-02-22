# React API

## Hooks

### useSyncExternalStore

外部のデータストアから値を取得するために使う。

subscribeの第1引数のonSubscribeはuseStateのset関数のようなもので、実行するとそのコンポーネントをre-renderする。

#### 参考

- <https://react.dev/reference/react/useSyncExternalStore>

## Refs

### 要素のリストの数だけrefを用意したい場合

```tsx
const refs = useRef<React.RefObject<HTMLDivElement>[]>([]);
useLayoutEffect(() => {
  refs.current = items.map(() => createRef());
}, [items]);
```
