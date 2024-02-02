# Design

- [Design](#design)

## Presentational and Container Components

`pages`層は、Presentational ComponentとContainer Componentに分ける。
関心を分けることによってわかりやすくなる。
テスタビリティが向上する。

### Presentational Component

責務はUIである。

### Container Component

責務はロジックである。
APIのfetchやグローバルな状態はここに置く。

### 参考

- <https://medium.com/@dan_abramov/smart-and-dumb-components-7ca2f9a7c7d0>
