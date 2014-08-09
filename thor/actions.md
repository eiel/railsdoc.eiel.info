---
title: Thor::Actions
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-80 revision 45877) [x86_64-darwin13.0]
```

```
$ bundle exec  ruby -r thor/version -e 'puts Thor::VERSION'
0.19.1
```

* [ソースコード](https://github.com/erikhuda/thor/blob/master/lib/thor/actions.rb)

RailsTemplate などで使えるアクションが定義されている

* [Thor::Actions::EmptyDirectory](/thor/actions/empty_directory)
* [Thor::Actions::CreateDirectory](/thor/actions/create_directory)

Thor::Actions
---

### action

* action(instance)

instance の invoke! メソッドを呼ぶ。behavior が :revoke なら revoke! メソッドがよばれる。
