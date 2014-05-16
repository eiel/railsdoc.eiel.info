---
title: ActionView::Railtie
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-08 revision 45877) [x86_64-darwin13.0]
```

```
bundle exec ruby -e 'require "action_view"; puts ActionView.version'
4.1.1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.0/actionview/lib/action_view/railtie.rb)

Rails の一部として使う場合の ActionView の設定がかかれている。

ActionView::Railtie
--------------------------------------------------------------------------------

### initializer "action_view.embed_authenticity_token_in_remote_forms"

date-remote で利用する場合は authenticity_token の値が false になる。

ActionView::Helpers::FormTagHelper.embed_authenticity_token_in_remote_forms を false に設定する。


### initializer "action_view.logger"

logger を Rails.logger として利用しているものと同じにする。


###  initializer "action_view.set_configs"

app.config.action_view に残っている値を key を元にセットする。


### initializer "action_view.caching"

app.config.action_view.cache_template_loading の値が nil の場合、 ActionView::Resolver.caching にクラスキャッシュの情報を渡す。
キャッシュしなくなり、初回にすべて読み込みしていしまうように見える。

### initializer "action_view.setup_action_pack"

ActionPack を読み込みした場合、ActionPack で用意されている UrlFor と連携できるようにする。

### 追加 rake task

* cache_digests
* dependencies

タスクを追加する。

* [action_view/tasks/dependencies](/action_view/tasks/dependencies])
