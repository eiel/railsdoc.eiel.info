---
title: ActionView::Digestor
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-08 revision 45877) [x86_64-darwin13.0]
```

```
bundle exec ruby -e 'require "action_view"; puts ActionView.version'
4.1.1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.0/actionview/lib/action_view/digestor.rb)

ActionView::Digestor
--------------------------------------------------------------------------------

Digestor.digest でダイジェストを作成する。

### .digest

* digest(options)

options には name, finder, dependencies, partial を渡せる。
これらの値からキャシュキーをつくり、結果をキャッシュする。

finder によってテンプレートを探したりする。
ほとんどの処理はインスタンスメソッド側にある。


ActionView::PartialDigestor
--------------------------------------------------------------------------------

Digestor を継承して partial?メソッド が true を返す違いがあるだけ。
型レベルで区別がつくようにしてるだけみたい。
