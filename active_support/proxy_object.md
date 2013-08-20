---
title: ActiveSupport::ProxyObject
---

試した環境

```
$ ruby -v
ruby 2.0.0p247 (2013-06-27 revision 41674) [x86_64-darwin12.4.0]
```

```
$ bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.0
```

* [ソースコード](https://github.com/rails/rails/blob/master/activesupport/lib/active_support/proxy_object.rb)

BaseObject から `==` と `equal?`が削られてる。継承した先で `undef_method` できるのは知らんかった。
その代わり raise メソッドが追加されている。`Object.raise` に丸投げ。
