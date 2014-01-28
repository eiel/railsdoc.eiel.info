---
title: ActionDispatch::Journey::Router::Strexp
---

```
$ ruby -v
ruby 2.1.0p0 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -r action_pack -e 'puts ActionPack::VERSION::STRING'
4.0.2
```

* [ソースコード](https://github.com/rails/rails/blob/4-0-stable/actionpack/lib/action_dispatch/journey/router/strexp.rb)

path を構築する際の最小単位の模様。
基本的には値を保持するためのクラス。

[ActionDispach::Routing::RouteSet](action_patch/routing/route_set) の add_route する際に build_path した時に返す path を生成する際に内部で生成される。

path requirements separators anchor で構成される。
ActionDispachで使う場合は SEPARATOR は固定値で `/` `.` `?` が設定される。

names メソッドは `:` のついた、パラメータになる部分の名前を抜きだす。

new には compile というエイリアスがついてる。

anchor はデフォルトで true で anchor オプションが設定されている場合、値が設定される。

path や requiment とは [ActionDispach::Routing::Mapping](action_dispach/routing/mapper) によって正規化された値が渡される
