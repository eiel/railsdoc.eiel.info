---
title: ActionDispatch::Utils
---

```
$ ruby -v
ruby 2.1.1p76 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -r action_pack -e 'puts ActionPack::VERSION::STRING'
4.1.0.rc1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.0.rc1/actionpack/lib/action_dispatch/request/utils.rb)

`.deep_merge` メソッドが実装されている。
param の nil を取り除いくと記述されている。空の配列などがあれば空の配列であれば nil になるような仕組みがはいっている。

空の配列があった場合は `deep_munge.action_controller` という通知が発生する。
どこまでネストしているのかは keys に保存されている。

`ActionDispatch::Request::Utils.perform_deep_munge` を `false` に設定すると無効化できる。
