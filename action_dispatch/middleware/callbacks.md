---
title: ActionDispatch::Callback
---

```
$ ruby -v
ruby 2.1.0p0 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -r action_pack -e 'puts ActionPack::VERSION::STRING'
4.1.0.rc1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.0.rc1/actionpack/lib/action_dispatch/middleware/callbacks.rb)

@app.call を呼ぶ前と後にコールばっくヲ設定できる。`.before` と `.after` というcallback を登録するためのメソッドが用意されてる。@app はイニシャライザでうけとる。

これは継承して使うもののようだ。
