# markdown

- [markdown](#markdown)
  - [lint, format](#lint-format)
    - [markdownlint](#markdownlint)
      - [VSCode extension](#vscode-extension)
      - [npm library](#npm-library)
    - [Markdown All in One](#markdown-all-in-one)
  - [preview](#preview)
  - [mind map](#mind-map)

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

## preview

[Markdown Preview Enhanced](https://marketplace.visualstudio.com/items?itemName=shd101wyy.markdown-preview-enhanced)

## mind map

[Markmap](https://marketplace.visualstudio.com/items?itemName=gera2ld.markmap-vscode)
