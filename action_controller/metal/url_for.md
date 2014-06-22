---
title: ActionController::UrlFor
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-08 revision 45877) [x86_64-darwin13.0]
```

```
$ bundle exec ruby -r action_pack -e 'puts ActionPack.version'
4.1.2.rc2
```

url_for メソッドに自動的に渡されるオプションの設定がされている。

host, port, protocol, _recall オプションは request オブジェクトから自動で決定できる。original_script_name または script name も情報があれば設定される。
