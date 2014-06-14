---
title: ActionController::Renderers
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-08 revision 45877) [x86_64-darwin13.0]
```

```
$ bundle exec ruby -r action_pack -e 'puts ActionPack.version'
4.1.1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.2.rc1/actionpack/lib/action_controller/metal/renderers.rb)

rails の返すことができるファイル形式の種類を保存しておける機能で、この中では js json xml が追加されており、ドキュメントには csv への対応例が記載されてる。

`ActionController::Renderers.add` メソッドで追加することができる。

_renders_option_js みたいなメソッドを定義して処理を分岐させてる。
