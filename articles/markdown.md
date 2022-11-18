# markdown

## lint, format

### markdownlint

#### [VSCode extension](https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint)

`.vscode/settings.json`

```json
{
  "[markdown]": {
    "editor.codeActionsOnSave": {
      "source.fixAll.markdownlint": true
    }
  }
}
```

#### [npm library](https://www.npmjs.com/package/markdownlint)

### [Markdown All in One](https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one)

- tableのformat
- linkのautocomplete

`.vscode/settings.json`

```json
{
  "[markdown]": {
    "editor.defaultFormatter": "yzhang.markdown-all-in-one"
  }
}
```

## mind map

[Markmap](https://marketplace.visualstudio.com/items?itemName=gera2ld.markmap-vscode)
