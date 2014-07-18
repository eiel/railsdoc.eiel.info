---
title: Rails::Application::Finishier
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-80 revision 45877) [x86_64-darwin13.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.1.4
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.2/railties/lib/rails/application/finisher.rb)

初期化処理が登録されています。

Rails::Application::Finishier
---

### initializer :add_generator_templates

generate のテンプレートに lib/template を追加する。
Rails の lib ディレクトリは理由があるものもあったのですね…。


### initializer :ensure_autoload_once_paths_as_subset

autoload_once_paths が autolod_paths に含まれていない場合アボートする

### initializer :add_builtin_route

開発用に追加のルーティングを追加する。

* get '/rails/mailers'         => "rails/mailers#index"
* get '/rails/mailers/*path'   => "rails/mailers#preview"
* get '/rails/info/properties' => "rails/info#properties"
* get '/rails/info/routes'     => "rails/info#routes"
* get '/rails/info'            => "rails/info#index"
* get '/'                      => "rails/welcome#index"

### initializer :build_middleware_stack

build_middleware_stack を実行する。

### initializer :define_main_app_helper

Rails::Engine をまたがってアクセスするために main_app という名前で RouteProxy にアクセスできる

### initializer :add_to_prepare_blocks

to_prepare_bock に登録されているブロックを ActionDispatch::Reloader.to_prepare にも渡す。

### initializer :run_prepare_callbacks

ActionDispatch::Reloader.prepare! を呼ぶ。

### initializer :eager_load!

eager_load がオンなら

* ActiveSupport.run_load_hooks(:before_eager_load, self) を呼ぶ。
* eager_load に登録しているもの eager_load する。

### initializer :finisher_hook

ActiveSupport.run_load_hooks(:after_initialize, self) を呼ぶ

### initializer :set_routes_reloader_hook

after_initialize が終わると routes を routes reloader を reloader に追加して reload されるようにしてるっぽい。

### initializer :set_clear_dependencies_hook, group: :all

自動読み込みのクリア設定をする？
