---
title: ActionController::HideActions
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-08 revision 45877) [x86_64-darwin13.0]
```

```
bundle exec ruby -r action_pack -e 'puts ActionPack::VERSION::STRING'
4.1.2.rc1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.2.rc1/actionpack/lib/action_controller/metal/hide_actions.rb)

コントローラからアクションを隠すことができる。
クラス属性 hidden_actions に隠していうアクションを保存している。

`.hide_action` メソッドで隠せる。
`.visible_action?` などで隠れてるか確認したりできる。

`.action_methods` メソッドは上書きされて、機能が反映される。
