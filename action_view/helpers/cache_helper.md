---
title: ActionView::Helpers::CacheHelper
---

```
$ ruby -v
ruby 2.1.1p76 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -r action_pack -e 'puts ActionPack::VERSION::STRING'
4.1.0.rc1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.0.rc1/actionview/lib/action_view/helpers/cache_helper.rb)

Controller の キャッシュ機能を利用してビューのキャッシュをやりとりするためのヘルパーが定義されてる。
controller の write_fragment、read_fragment というメソッドでやりとりしている。

rdoc に例がいろいろのっているので一度ぐらい見たほうが良いかも。

ActionView::Helpers::CacheHelper
--------------------------------------------------------------------------------

### cache

* cache(name = {}, options = nil, &block)

第一引数の name を keyにキャッシュを作成する。
name だけでなく オブジェクトでも可能。
オブジェクトが変化している場合はキャッシュを破棄をするといったこともできるっぽい。

### cache_if

* cache_if(condition, name = {}, options = nil, &block)

condition 引数が追加された。condition が true であれば cashe へ処理を渡す。
無条件でキャッシュを使わない場合に使う感じがする。

### cache_unless

* cache_unless(condition, name = {}, options = nil, &block)

condition が false であれば cache へ処理を渡す。
