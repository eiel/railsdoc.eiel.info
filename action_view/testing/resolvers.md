---
title: ActionView::Testing::Resolvers
---

```
$ ruby -v
ruby 2.1.1p76 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -e 'require "action_view"; puts ActionView.version'
4.1.0
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.0/actionview/lib/action_view/testing/resolvers.rb)

ファイルシステムにファイルがあるかどうかをシミュレートするためのクラス ActionView::FixtureResolver が定義されている。
[ActionView::PathResolver](action_view/template/resolver) を継承して作成されている。


ActionView::PathResolver
--------------------------------------------------------------------------------

コンストラクタの第2引数は PathResolver の第1引数へ、第1引数はシミュレートするための情報源となる。

第1引数には Hash を渡し、キーが path として扱われる。
バリューは配列で、一つ目がソース, 二つ目が更新日。
ソースはテンプレートの内容。

第2引数の pattern はPathResolver のための pattern。

```ruby
require 'action_view'
require 'action_view/testing/resolvers'

r = ActionView::FixtureResolver.new({"hoge.html.erb" => ["hogehoge",Time.now]}
r.find_all('hoge','',false, {locale: [], variants: [], handlers:["erb"], formats:["html"]})   # => [hoge.html.erb]
```
