---
title: ActionView::LookupContext
---

```
$ ruby -v
ruby 2.1.0dev (2013-09-22 trunk 43011) [x86_64-darwin12.5.0]
```

```
bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.1
```

* [ソースコード](https://github.com/rails/rails/blob/4-0-stable/actionpack/lib/action_view/lookup_context.rb)

Action::LookupContext はテンプレートを探すのに必要なすべての情報を保持しておくためのオブジェクトのようです。
[ActienView::PathSet](/action_view/path_set) ヘのラッパもやっているし、キャッシュ機能も備えている。


ActionView::LookupContext
--------------------------------------------------------------------------------

### .register_detail

* register_detail(name, options = {}, &block)

[Resolver](/action_view/template/resolver) へ渡す情報を登録するメソッド。
`hoge.html.ja.erb` の `html` や `ja` や `erb` を登録する

### #initialize

* initialize(view_paths, details, prefixes)

引数`view_paths` は利用する view の配置しているリストを渡します。
自動的に ActionView::PathSet オブジェクトに変換されます。

引数 `details` は hash でその他の情報を入れておくようです。(なかなかカオスってよくわからない)
