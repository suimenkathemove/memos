# Testing Library

- [Testing Library](#testing-library)
  - [実行フェーズ](#実行フェーズ)
    - [要素の取得方法](#要素の取得方法)
      - [Priority](#priority)
    - [fireEvent vs userEvent](#fireevent-vs-userevent)
  - [検証フェーズ](#検証フェーズ)
    - [テキストが表示されたことを検証する](#テキストが表示されたことを検証する)

## 実行フェーズ

### 要素の取得方法

get/find/query

#### Priority

<https://testing-library.com/docs/queries/about/#priority>

### fireEvent vs userEvent

基本的には、fireEventよりuserEventを使うべきである。

> user-event allows you to describe a user interaction instead of a concrete event. It adds visibility and interactability checks along the way and manipulates the DOM just like a user interaction in the browser would. It factors in that the browser e.g. wouldn't let a user click a hidden element or type in a disabled text box.
This is why you should use user-event to test interaction with your components.

<https://testing-library.com/docs/user-event/intro/#differences-from-fireevent>

## 検証フェーズ

### テキストが表示されたことを検証する

```ts
await expect(canvas.getByText('TEXT')).toBeInTheDocument();
```
