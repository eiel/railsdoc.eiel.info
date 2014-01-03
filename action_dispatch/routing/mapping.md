---
title: ActionDispatch::Routing::Mapping
---

```
$ ruby -v
ruby 2.1.0p0 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.2
```

* [ソースコード](https://github.com/rails/rails/blob/4-0-stable/actionpack/lib/action_dispatch/routing/mapper.rb)

Routing の中で一番重要なファイルになりそうな気がする。

ACtionDispatch::Routing::Mapper::Costraints
--------------------------------------------------------------------------------

self.new がオーバライドされてる珍しい例だと思う。
制約が指定されていない場合は第1引数をそのまま返す。
そうでない場合はインスタンスを返すようです。

call メソッドがあり Rackオブジェクト。

constraints でチェックを行い、チェックを通れば app を実行できるというもの。

### matches?

* mathes?(env)

env で反応するべきルーティングがあるのかチェックする。
コンストラクタの第2引数で渡された constraionts に対しチェックを行う。
ものによっては実際に call してチェックする。

### call

matches? を満す場合のにコンストラクタの第1引数である app を実行する。
失敗した場合は 404 を返す。
