# tsconfig.json

- [tsconfig.json](#tsconfigjson)
  - [References](#references)
  - [Init](#init)
  - [Options](#options)
    - [target](#target)
    - [lib](#lib)
    - [module](#module)
      - [for Node.js](#for-nodejs)
      - [for frontend](#for-frontend)
    - [moduleResolution](#moduleresolution)
  - [Use absolute path](#use-absolute-path)

## References

<https://github.com/suimenkathemove/typescript-modules/blob/main/modules/tsconfig/tsconfig.json>

## Init

```shell
tsc --init
```

## Options

### target

どのバージョンのJavaScriptに出力するかを設定する

### lib

実行環境で使用できるライブラリの宣言ファイルを指定する

### module

Specify module system.

#### for Node.js

`CommonJS`

#### for frontend

`ESNext`

### moduleResolution

`resolveJsonModule` cannot be specified without 'node' moduleResolution.

## Use absolute path

`tsconfig.json`

```json
{
  "compilerOptions": {
    "baseUrl": "src",
    "paths": {
      "@/*": ["*"]
    }
  }
}
```
