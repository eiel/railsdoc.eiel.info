---
title: ActionController::ImplicitRender
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-08 revision 45877) [x86_64-darwin13.0]
```

```
bundle exec ruby -r action_pack -e 'puts ActionPack::VERSION::STRING'
4.1.2.rc1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.2.rc1/actionpack/lib/action_controller/metal/implicit_render.rb)

なにもレンダリングをしていない場合は default_render へと処理を回す。
`method_for_action` が nil の場合にviewがみつかる場合は `default_render` を返すようになる。
