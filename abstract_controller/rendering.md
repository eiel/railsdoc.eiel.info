---
title: AbstractController::Rendering
---

```
$ ruby -v
ruby 2.1.0dev (2013-09-22 trunk 43011) [x86_64-darwin12.5.0]
```

```
bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.0
```

* [ソースコード](https://github.com/rails/rails/blob/4-0-stable/actionpack/lib/abstract_controller/rendering)

[AbstractController::ViewPaths](/abstract_controller/view_paths) をミックスインしている。
レンダリングするものを見つけられないと困るからだろう。

ActionView を単体で使う場合に参考になる部分でもある。

AbstractController::DoubleRenderError
--------------------------------------------------------------------------------

render を二度呼び出した場合に発生する例外


AbstractController::I18nProxy
--------------------------------------------------------------------------------

コントローラが使う locel を保持しておいて、設定済みの[ActionView::LookupContext](/action_view/lookup_context) を保持していたり、初期値を保持しておくクラス

AbstractController::Rendering
--------------------------------------------------------------------------------

コントローラにincludeして使う。renderメソッドを提供します。また、viewでの self になるオブジェクトである view_context を生成する役目も持ちます。view_context のクラスである view_context_class もここで生成します。
このクラスは View::Base を継承したクラスで、routes が生成した helpe や登録されている helper を追加します。
view_context へのインスタンス変数の設定は view_assigns によって生成され、view_context 作成する際に渡して設定します。
渡したくないインスタンス変数がある場合は、 protected_instance_variables へ設定することで追加できないようにできます。
