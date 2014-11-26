---
title: Rails::Engine
---

```
$ ruby -v
ruby 2.1.4p265 (2014-10-27 revision 48166) [x86_64-darwin14.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0.beta4
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0.beta4/railties/lib/rails/engine.rb)

### .inherited

継承時に呼ばれる。
主にコールスタックを表示するための called_from をつくるのが主な仕事

### .endpoint

@endpoint を設定するだけ。

### .isolate_namesapce

engine_name を設定して、default_scope を追加して独立して動作する namespaceを加える。
table名には自動的にprefixがついたりする。

### .find

* find(path)

引数 path で示される Rails::Engineを探す。

### #load_console

rails c のためのRailtieに登録されているフックを読み込みする

### #load_runner

rails runner のためのRailtieに登録されているフックを読み込みする。

### #load_tasks

rake のためのRailtieに登録されているフックを読み込みする。

### #load_generators

rails g のためのRailtieに登録されているフックを読み込みする。
最後に Rails::Generators.configure! を読み出す。

### #eager_load!

eager_load_pathsに登録されているpathの内側にある.rbファイルをすべて読み込みする。

### #railties

Railtiesのインスタンスを返す。

### #helpers

helperをすべてincludeしたモジュールを返す。

### #helpers_paths

登録されているhelperのパスの一覧を返す。

### #app

end_point を中心にミドルウェアスタックをつめこんでrackアプリケーションを構築する。

### #endpoint

デフォルトはroutes を返す。
`.endpoint` に設定されたRackアプリケーションがあればそれが利用される。

### #call

SCRIPT_NAMEが指定されるとROUTE_xxxx_SCRIPT_NAMEに保持する。

### #env_config

action_dispatch.routes を routes を設定する。

### #routes

ActionDispatch::Routing::RouteSet.new を返す。
ブロックを渡せばせっていをする。

### #config

configure オブジョケツを生成する。

### #load_seed

db/seeds.rb を読み込みする。
