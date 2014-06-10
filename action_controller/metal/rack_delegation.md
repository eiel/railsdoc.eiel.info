---
title: ActionController::RackDelegation
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-08 revision 45877) [x86_64-darwin13.0]
```

```
$ bundle exec ruby -r action_pack -e 'puts ActionPack.version'
4.1.1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.2.rc1/actionpack/lib/action_controller/metal/rack_delegation.rb)

Rack の response オブジェクトを  actionDispatch::Response のインスタンスへ渡しておいて、request へ保持しておく。
response_body への設定などもひっそりやってた。
