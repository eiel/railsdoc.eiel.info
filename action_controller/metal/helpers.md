---
title: ActionController::Helpers
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-08 revision 45877) [x86_64-darwin13.0]
```

```
bundle exec ruby -r action_pack -e 'puts ActionPack::VERSION::STRING'
4.1.2.rc1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.2.rc1/actionpack/lib/action_controller/metal/helpers.rb)

[AbstractController::Helpers](/abstract_controller/helpers)を少し拡張したもの。
helpers_path に含まれる helper をすべて読み込みするためのメソッドや、コントローラの属性とやりとりできるヘルパーを定義する helper_attr メソッドを提供している。

また `config.action_controller.include_all_helpers` を true にしておくと rails がすべての Helper を読み込みするようになる。デフォルトで true なので変えたい場合は false にする。
