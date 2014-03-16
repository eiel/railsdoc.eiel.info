---
title: ActionDispatch::Request::Session
---

```
$ ruby -v
ruby 2.1.1p76 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -r action_pack -e 'puts ActionPack::VERSION::STRING'
4.1.0.rc1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.0.rc1/actionpack/lib/action_dispatch/request/session.rb)


`env[ENV_SESSION_KEY]` にセッション情報は保存されている。
オプションがこれとは別に `env[ENV_SESSION_OPTIONS_KEY]` に保存されている。
Hashのようにふるまったり、更新
