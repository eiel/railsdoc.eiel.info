---
title: ActionDispatch::Middleware::RemoteIP
---

```
$ ruby -v
ruby 2.1.1p76 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -r action_pack -e 'puts ActionPack::VERSION::STRING'
4.1.0.rc1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.0.rc1/actionpack/lib/action_dispatch/middleware/remote_ip.rb)

REMOTE_ADDRヘッダや HTTP_CLIENT_IP、HTTP_X_FORWARDED_FOR から通信相手のIPアドレスをみつけて`env["action_dispatch.remote_ip"]`に格納します。
格納されるのは `ActionDispatch::RemoteIp::GetIp` のインスタンスになります。
