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

ソースコード中に登場する route は [ActionDispatch::Journey::Route](action_dispatch/journey/route) のインスタンスの模様。
このオブジェクトが要求されるメソッドは`required_parts`, `optimized_path`, `requirements` `segment_keys` `defaults` `url_for` だった。

ActionDispatch::Routing::RouteSet::Dispatcher
--------------------------------------------------------------------------------

parameter の処理が終了していて、パスパラメータにあるコントローラとアクションの情報をつかって `ActionController::Metal.action` を呼び出しアクションを実行する責務をもっている模様。

Rack アプリケーションになっており、`env[action_dispatch.request.path_parameters]`に保存されている情報ををもとに呼び出すアクションが決定される。

コンストラクタに渡せるオプションは defaults と glob です。
defoults[:controller] に値が値が設定されていて、Contorller がみつからない場合に例外が発生する。
glob は glob が含まれている パラメータを指定することができる模様。

action はデフォルトで index になっていて、指定しなくても動作する。

ActionDispatch::Routeing::RouteSet::NamedRouteCollection
--------------------------------------------------------------------------------

viewで使用するhelperが定義されているモジュールを作成したり、その元になる名前を保持しているクラス。

`Rails.app.routes.named_routes` でアクセスできる。
モジュールには `Rails.app.routes.named_routes.module` でアクセスできる。

Enumerable なオブジェクトである。
コレクションとしての値は `@routes` に Hash で格納されている。

helper は define_named_route_methods メソッドによって作成するが実際には URLHelper や OptimizedUrlHelper などが担当している。

`[]=` した時点でメソッドが作成される。`add`メソッドのエイリアスになっている。

ActionDispatch::Routeing::RouteSet::NamedRouteCollection::UrlHelper
--------------------------------------------------------------------------------

### .create

* create(route, options)

route が optimize_helper かどうか確認して、OptimizedUrlHelper か UrlHelper を作成する。
必須項目が :controller と :action 以外のものがなけれぼ optimize_helper の模様。


### .optimize_helper?

* optimize_helper?(route)

route が optimize_helper なのか確認する。

### #call

* call(t, args)

t.url_for を使用してurlを作成するが、自身がもっている情報を利用する。
t は route オブジェクト


ActionDispatch::Routeing::RouteSet::NamedRouteCollection::OptimizedUrlHelper
--------------------------------------------------------------------------------

UrlHelper を継承してる。
こちらは オプションだけでURLが作成できるものになる感じの実装になっている。
条件を満さない場合は UrlHelper と同じ挙動に。
