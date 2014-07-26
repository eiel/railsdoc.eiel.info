---
title: Thor::Arguments
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-80 revision 45877) [x86_64-darwin13.0]
```

```
$ bundle exec  ruby -r thor/version -e 'puts Thor::VERSION'
0.19.1
```

* [ソースコード](https://github.com/erikhuda/thor/blob/master/lib/thor/parser/arguments.rb)

[Thor::Options](/thor/parser/options/)

Thor::Options
---

### .split

配列と引数とスイッチにわける。`-` ではじまる要素をみつけるとそこで分割します。

### .parse

new して parse するヘルパメソッド

第1引数を `#parse`へ、残りを new へ渡す。

.split した結果を渡すようにつくってある気がする。

### initialize

引数を `@switches` に代入。
`@assigns` にはデフォルト値があるものを設定。
必須のものは `@non_assigned_required` へと登録する。

### parse

引数を調整して `@assign` に代入する。
`@non_assigned_required` などをみながら必須の引数があるかどうか確認したりする。

### remaining

あまった引数を返す。
