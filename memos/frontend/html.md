# HTML

## contenteditable

`change` eventは発火しないが、`input` eventは発火する。

入力している値を取得するには`event.currentTarget.textContent`を使う。

枠線を削除するには、

```css
[contenteditable]:focus {
  outline: none;
}
```

入力値にpropsやstateを使うと、再レンダリングする度にキャレットの位置が飛んでしまう。
入力値を設定するには、Uncontrolled Componentにしてrefを使って設定する。<https://github.com/suimenkathemove/notion-clone/blob/main/frontend/src/components/notion/domains/page-content/index.tsx>

Reactで以下のエラーが出る場合は、

```text
Warning: A component is `contentEditable` and contains `children` managed by React. It is now your responsibility to guarantee that none of those nodes are unexpectedly modified or duplicated. This is probably not intentional.
```

`suppressContentEditableWarning`を使う。
