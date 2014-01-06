---
title: ActionDispatch::Routing::Mapping
---

```
$ ruby -v
ruby 2.1.0p0 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.2
```

* [ソースコード](https://github.com/rails/rails/blob/4-0-stable/actionpack/lib/action_dispatch/routing/route_set.rb)

[ActionDispatch::Routing::Mapping](action_dispatch/routing/mapping)が提供するDSLによって生成される。
`Rails.application.routes` で返すのがこのクラスのインスタンスになる。
必要な機能の多くは別のクラスに委譲しており実際ルータの役目は Journey によて行われていたりする。

ActionDispatch::Routing::RouteSet::Dispatcher
--------------------------------------------------------------------------------

parameter の処理が終了していて、パスパラメータにあるコントローラとアクションの情報をつかって `ActionController::Metal.action` を呼び出しアクションを実行する責務をもっている模様。

Rack アプリケーションになっており、`env[action_dispatch.request.path_parameters]`に保存されている情報ををもとに呼び出すアクションが決定される。

コンストラクタに渡せるオプションは defaults と glob です。
defoults[:controller] に値が値が設定されていて、Contorller がみつからない場合に例外が発生する。
glob は glob が含まれている パラメータを指定することができる模様。

action はデフォルトで index になっていて、指定しなくても動作する。
