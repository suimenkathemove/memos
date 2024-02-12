# package.json

## required fields

name, version
[https://docs.npmjs.com/creating-a-package-json-file#required-name-and-version-fields](https://docs.npmjs.com/creating-a-package-json-file#required-name-and-version-fields)

## recommended fields

### license

## optional fields

### files

そのパッケージに含めるファイルを指定する。
通常はdistを指定する。

### main

単一のエントリーポイントを指定する。

### exports

複数のエントリーポイントを指定する。
これとmainの両方を指定した場合はexportsが優先される。

### scripts

### 依存の指定

#### 値の指定方法

##### バージョンの指定

##### タグの指定

##### ローカルファイルシステム上のパッケージへのパスを指定

```json
{
  "package": "file:./path/to/package"
}
```

##### GitリポジトリのURLの指定

#### dependencies

#### devDependencies

#### peerDependencies
