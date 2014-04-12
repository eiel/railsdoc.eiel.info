---
title: ActionView::Helpers::DebugHelper
---

```
$ ruby -v
ruby 2.1.1p76 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -r action_pack -e 'puts ActionPack::VERSION::STRING'
4.1.0.rc1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.0/actionview/lib/action_view/helpers/debug_helper.rb)

ActiovView::Helper::DebugHelper
--------------------------------------------------------------------------------

### debug

* debug(object)

Marshal.dump をつかってオブジェクトをHTML用に整形して出力してくれるメソッド。
