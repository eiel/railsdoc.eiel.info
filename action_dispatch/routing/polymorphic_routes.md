---
title: ActionDispatch::Routing::PolymorphicRoutes
---

```
$ ruby -v
ruby 2.1.0p0 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.2
```

* [ソースコード](https://github.com/rails/rails/blob/4-0-stable/actionpack/lib/action_dispatch/routing/polymorphic_routes.rb)

view で使える url_for の特にモデルオブジェクトを渡した場合の処理を担当する部分。
規則そってのメソッド名を作成し、その名前のhelper をよびだす仕組みになっている。
ルーティングが生成するヘルパーの命名規則と合うためうまくよびだしができる。

渡されたオブジェクトやオプションをみて、単数形か複数形を判断して、ヘルパー名を構築していく。

### polymorphic_url

* polymorphic_url(record_or_hash_or_array, options = {})

引数には record や record を含むリストなどなどを渡せる。

### polymorphic_path

* polymorphic_path(record_or_hash_or_array, options = {})

polymorphic_url の path だけを生成するバージョン
