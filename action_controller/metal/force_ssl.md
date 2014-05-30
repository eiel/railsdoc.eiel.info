---
title: ActionController::ForceSSL
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-08 revision 45877) [x86_64-darwin13.0]
```

```
bundle exec ruby -r action_pack -e 'puts ActionPack::VERSION::STRING'
4.1.2.rc1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.2.rc1/actionpack/lib/action_controller/metal/force_ssl.rb)

SSLを利用していない場合、強制的にSSLを通信するようにリダイレクトする。

コントローラのクラスメソッドとして force_ssl メソッドが追加される。

ActionController::ForceSSL
--------------------------------------------------------------------------------

### .force_ssl

before_action を使い force_ssl_redirect メソッドをよぶ。

force_ssl_redirect をよぶ前に action としてのオプションと redirectに使うオプションとの分離をして before_action に登録するだけ。

### #force_ssl_redirect

リクエストが SSL ではない場合は転送先URLを作成して転送するだけ。
