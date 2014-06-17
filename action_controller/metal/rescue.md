---
title: ActionController::Rescue
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-08 revision 45877) [x86_64-darwin13.0]
```

```
$ bundle exec ruby -r action_pack -e 'puts ActionPack.version'
4.1.2.rc2
```

コントローラに `.resuce_from` メソッドを追加する。
アクションを実行した際に例外が発生した際の処理を事前に登録しておくことができる。
