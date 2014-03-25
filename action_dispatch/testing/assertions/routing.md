---
title: ActionDispatch::Assertions::RoutingAssiotns
---

```
$ ruby -v
ruby 2.1.1p76 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -r action_pack -e 'puts ActionPack::VERSION::STRING'
4.1.0.rc1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.0.rc1/actionpack/lib/action_dispatch/testing/assertions/routing.rb)



### assert_recognizes

* assert_recognizes(expected_options, path, extras={}, msg=nil)

`@route` の情報をつかい expected_options に指定したものが path になるか確認する。

### assert_generates

* assert_generates(expected_path, options, defaults={}, extras = {}, message=nil)

assert_recognize とは逆向きで expected_path が options に指定した controller や action とマッチするか確認する。

### assert_routing

* assert_routing(path, options, defaults={}, extras={}, message=nil)

allert_recognize と asset_generates の両方を確認する。

### with_routing

その場で route を構築して動作確認ができる。
