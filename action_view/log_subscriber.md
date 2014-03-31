---
title: ActionView::LogSubscriber
---

```
$ ruby -v
ruby 2.1.1p76 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -r action_pack -e 'puts ActionPack::VERSION::STRING'
4.1.0.rc1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.0.rc1/actionview/lib/action_view/log_subscriber.rb)

ActionView で利用される [LogSubscriber](/active_support/log_subscriber/) が定義されており、テンプレートがレンダリングされた際の`render_template.action_view` というイベントに反応しログを出力します。

レンダリングしたテンプレート名は Rails.root の部分を削除するぐらい機能がある程度です。
