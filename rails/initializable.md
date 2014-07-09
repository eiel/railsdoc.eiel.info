---
title: Rails::Application::Initializable
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-80 revision 45877) [x86_64-darwin13.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.1.4
```

* [ソースコード](https://github.com/rails/rails/blob/e20dd73df42d63b206d221e2258cc6dc7b1e6068/railties/lib/rails/initializable.rb)


クラスに初期化するための情報を集めた initializer を登録できるモジュール。

`クラス名.initializers.run_initializers` で実行ができる。

グループわけもすることができて柔軟な初期化ができる。

Rails::Initializable
---

モジュール。include して使う。

Rails::Initializable::ClassMethods
---

### #initializers

登録された初期化処理である Rails::Initializer::Collection を返す。

### #initializers_chain

継承しているクラスの initializers も呼ぶ initializer を作る。

### #initializers_for

* initializers_for(binding)

登録されている初期化処理をコンテキストをきりかえて binding にも登録した Collection を作成する。
あとで、コンテキストをまとめてbindingするのに使う？

### #initializer

* initializer(name, opts = {}, &blk)

初期化処理を追加する。
Initializer.new のラッパー。
blk は必須で、name は初期化処理の名前。opts には before, after, group を指定できる。
なにも指定しない場合は after が自動生成する。

Rails::Initializable::Initializer
---

コンストラクタの引数は name, context, options, &block。
context は block を実行する時のコンテキスト。name は before や after で利用する。
ユニークのほうがいい気がするんだけどどうなんだろう。

### run

登録されてる処理を実行する。

Rails::Initializable::Collection
---

Initializer のリスト。 Tsort モジュールがインクルードされてる。
