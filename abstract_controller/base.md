---
title: ActiveSupport::OrderedHash
---

```
$ ruby -v
ruby 2.1.0dev (2013-09-22 trunk 43011) [x86_64-darwin12.5.0]
```

```
bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.0
```

* [ソースコード](https://github.com/rails/rails/blob/4-0-stable/actionpack/lib/abstract_controller/base.rb))

ActionController と ActionMailer の共通部分をまとめたクラス。Controllerとして機能するための機能が実装されている。
低レベルAPIが実装されていて、このクラスを直接使うべきではない。
継承して render メソッドを提供して使うことになる。

あらかじめ erubis が require されているあたりから Controller が View と結びつくものとわかる。

AbstractController::ActionNotFound
--------------------------------------------------------------------------------
Controller は process メソッドにアクション名を渡して利用することになる。
この際にアクション名に一致するアクションがない場合に発生する例外。

