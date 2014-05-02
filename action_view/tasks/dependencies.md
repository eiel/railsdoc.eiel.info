---
title: ActionView::Tasks::Dependecies
---

```
$ ruby -v
ruby 2.1.1p76 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -e 'require "action_view"; puts ActionView.version'
4.1.0
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.0/actionview/lib/action_view/tasks/dependencies.rake)

[ActionView::Digestor](/action_view/digester) を使いviewファイルの依存性を確認できる rake タスクが定義されている。

* cache_digests:nested_dependencies
* cache_digests:dependencies

の二つのタスクが定義されている

TEMPLATE引数が必須。
