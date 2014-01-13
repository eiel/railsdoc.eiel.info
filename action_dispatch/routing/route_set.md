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

ActionDispatch::Routeing::RouteSet
-------------------------------------------------------------------------------
ルーティングの中心。ファサードになるのかなぁ。

属性メモ

* formatter - Journey::Formatter
* set - Journey::Routes
* routes - set のエイリアス
* named_routes - NamedRouteCollection
* default_scope - 外部から代入？ たぶん Hash 現在のデフォルト値みたいなもの
* router - Journey::Router
* disable_clear_and_finalize - Bool
* resources_path_names - Hash
* default_url_options - Hash
* request_class - Class - デフオルトは ActionDispatch::Request。コンストラクタからうけとる

### draw

* draw(&block)

`config/routes.rb` で呼ばれるメソッド
disable_clear_and_finalize を true に設定しておけば clear! と finalized! が呼ばれない。
ルーティングを評価する部分。評価する時のコンテキストは Mapper になる模様。

必ず nil を返す。

### append

* append(&block)

draw で定義したものの後ろに実行したいブロックを追加する。

追加したブロックは`finalaized!`で利用される。

### prepend

* prepend(&block)

draw で定義するより前に実行したいブロックを追加する。
追加するブロックは `clear!` で利用される。

### eval_block

* eval_block(block)

ブロックを評価する。


### finalize!

すでに finalized されてる場合はなにもしない。
append によって追加されたブロックの実行と `@filnalized` を true に設定する。

### clear!

初期状態にもどす。
named_routes と set と formatter を clear する。

preppend によって追加されたブロックの実行をする。

### mounted_helpers

マウントしているすぺてのヘルパーと自分自身のヘルパーにアクセスできるらしい。

### define_mounted_helper

* define_mounted_helper(name)

RouteProxyを経由して `"_#{name}"` という名前のメソッドを作成しroutesへ処理を回すような形式のような気がする。
``"#{name}"` で `"_#{name}"` の結果を保持しているようなメソッドも定義される。

### url_helpers

url_heperが定義されたモジュールを作成するメソッド。
url_for と optimize_routes_generation? を routes に委譲するのと、named_routes.module を取り込みをする。
routes にアクセスするための _routes も用意される。

### empty?

ルーティングが空っぽか確認する

### add_route

* add_route(app, conditions = {}, requirements = {}, defaults = {}, name = nil, anchor = true)

引数を整理して path を作成、あとは @setに丸投げ。
結果を named_routesに保存しておくという方法。戻り値は`@set.add_route` の結果を返す。

Journey がかなり絡んでいる。

ActionDispatch::Routeing::RouteSet::Generator
------------------------------------------------------------------------------
ActionDispatch::Routeing::RouteSet#generate の処理を担う。
このクラスを new して generate メソッドを呼び出すようになってる。

主に formatter に渡すパラメータづくりをする。
recall は以前読んだコントローラで使用されたオプションなどが入るんじゃないかと推測している。

### PARAMETERIZE

procオブジェクトが代入されている。
第一引数が :controllerの時 value をそのまま返す。
そうでなく、value が配列の場合は to_param したものを '/' でjoinしたものを返す。
それ以外は value を to_param したものを返す。

### recall

コンストラクタの第二引数に渡される Hash

### contoroller

@options の :controller の値を返す。

### current_controller

@recaall の :controller の値を返す。

### use_recall_for

* use_recall_for(key)

@options の値でなく recall の値を使うためのヘルパーのよう。
