---
title: ActiveModel::Validations::Validations
---

```
$ ruby -v
ruby 2.1.4p265 (2014-10-27 revision 48166) [x86_64-darwin14.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0/activemodel/lib/active_model/validations/validates.rb)

すべてのバリデータにアクセスできる`validates`メソッドを提供する。
第2引数にハッシュを渡すがキーになっている値をバリデータとして使う。
バリューがバリデータに渡す属性となる。

例外が飛ぶようになる`validates!`メソッドもある。
