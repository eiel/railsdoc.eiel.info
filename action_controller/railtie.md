---
title: ActionController::Railtie
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-08 revision 45877) [x86_64-darwin13.0]
```

```
$ bundle exec ruby -r action_pack -e 'puts ActionPack.version'
4.1.2
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.2/actionpack/lib/action_controller/railtie.rb)

ActionController の Railtie。

app.config.action_controller.assets_dir が設定されてない場合は public 直下に設定。
app.config.paths["public"] の最初の値

ActionController::Helpers.helpers_path を app.helpers から取得

ActionController::Parameters.permit_all_parameters と ActionController::Parameters.action_on_unpermitted_parameters の設定。
app.config.action_controller の permit_all_parameters と action_on_unpermitted_parameters から引き継ぐ。

action_on_unpermitted_parameters は 開発モードだと :log になる。

logger の設定、chache の設定、 javascript_dir、stylesheet_dir、asset_host、relative_url_root の引き継ぎを行い、routing からのヘルパーを設定、そのヘルパー設定をする。

compile_methods! はなにするのか…
