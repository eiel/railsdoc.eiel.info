---
title: ActiveModel::Model
---

```
$ ruby -v
ruby 2.2.0p0 (2014-12-25 revision 49005) [x86_64-darwin14]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0/activemodel/lib/active_model/model.rb)

ActiveModelの機能をまとめて設定するためのモジュール。

ActiveModelを使いたいと思えばこのモジュールを読み込みする。

初期化時に渡されたハッシュを属性に代入してくれる機能がついている。

また、永続化されているか確認する`persisted?`メソッドは常に`false`を返す。
