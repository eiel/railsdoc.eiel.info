---
title: ActiveRecord::Associations::Preloader
---

```
$ ruby -v
ruby 2.2.0p0 (2014-12-25 revision 49005) [x86_64-darwin14]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0/activerecord/lib/active_record/associations/preloader.rb)

複数のクエリが実行される場合、一度実行したクエリのIDは記憶しているらしい。よくわからない。

preloadするにはassociationsを指定する必要がある。
これはHashやシンボルでhas_manyがbelongsで設定した値を渡す。

あんまりやってることがまだよくわからない。他のところを読んでかえってくる。
