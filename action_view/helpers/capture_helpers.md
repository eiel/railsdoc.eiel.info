---
title: ActionView::Helpers::CaptureHelper
---

```
$ ruby -v
ruby 2.1.1p76 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -r action_pack -e 'puts ActionPack::VERSION::STRING'
4.1.0.rc1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.0.rc1/actionview/lib/action_view/helpers/tag_helper.rb)

Actionview::Helper::CaptureHelper
--------------------------------------------------------------------------------

### capture

* capture(*args)

ブロックにつづく HTML を返す。
テンプレートエンジンの中で変数へ代入したい時に便利。

引数はブロックへ渡される

```
<% @greeting = capture do %>
  Welcome to my shiny new web page!  The date and time is
  <%= Time.now %>
<% end %>
```

### content_for

* content_for(name, content = nil, options = {}, &block)

conttent または block に指定された view や文字列を yield name で再利用できるようにする。

```
<% content_for :hoge do %>
  hoge hoge
<% end %>

<% yield :hoge %>
<% yield :hoge %>
```

```
hoge hoge
hoge hoge
```

値は `@view_flow` に保存されてる。

options に flush: true を指定をしておくと値が追記されていく。

### provide

* provide(name, content = nil, &block)

content_for と基本的には同じ。
しさき、値は上書きせずに必ず追記する。

### content_for?

* content_for?(name)

name が content_for されてるか確認する。

### with_output_buffer

*  with_output_buffer(buf = nil)

buf にブロックの文字列を追加する。
nilの場合は新規作成する。

output_buffer を一時的にさしかえる機能もあるみたい。

### flush_output_buffer

* flush_output_buffer

output_buffer をクリアする。
