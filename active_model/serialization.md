---
title: ActiveModel::Serialization
---

```
$ ruby -v
ruby 2.2.0p0 (2014-12-25 revision 49005) [x86_64-darwin14]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0/activemodel/lib/active_model/serialization.rb)

シリアライズするためのhashを作るserializable_hashを提供するモジュール。
基本的にはattributesをhashにする。

:onlyオプションや:exceptオプションでキーを限定することも可能。

:methodsオプションでメソッドの実行結果を加えることもできる。

:includeでひもづくモデルを加えることができる。

attributeをシリアライズする際に調整したい場合は read_attribute_for_serialization(key) が呼ばれるのでオーバーライドすればよい。デファルトでは単にsendが呼ばれる。
