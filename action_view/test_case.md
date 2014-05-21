---
title: ActionView::Template
---

```
$ ruby -v
ruby 2.1.0dev (2013-09-22 trunk 43011) [x86_64-darwin12.5.0]
```

```
bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.0
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.0/actionview/lib/action_view/test_case.rb)

テストコードをかくための基底クラスになる ActionView::TestCase が定義されている。
その中で利用する ActionView::TestCase::TestController も定義されている。

ActionView::TestCase
--------------------------------------------------------------------------------

[ActiveSupport::TestCase](active_support/test_case) を継承している。

実質 Behavior モジュールをミックスインしているだけなので、そこのメソッドをみればよい。

クラスメソッドは helper_class を決定するためのメソッドがある。
デフォルトでは名前から決定される。`.tests` メソッドに渡すことで設定を変えられる。

### #setup_with_controller

`@controller`, `@request`, `@output_buffer`, `@rendered` の初期化をして、不要なメソッドをプライベートにしたりする。

### #config

@controller に config 情報があれば取り出す。

### #render

* render(options = {}, local_assigns = {}, &block)

レンダリングをする。結果は @rendered に格納される。

### #rendered_views

レンダリングした view の情報を格納するための RenderedViewsCollection のインスタンスを返す。

ActionView::TestCase::TestController
--------------------------------------------------------------------------------

ActionController::Base を継承した、 ActiovView::TestCase でコントローラの役目を担うクラス。
controller_path を設定する仕組みが追加されている。
