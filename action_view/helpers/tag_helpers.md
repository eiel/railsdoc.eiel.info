---
title: ActionView::Helpers::TagHelper
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

Actionview::Helper::TagHelper
--------------------------------------------------------------------------------

### tag

* tag(name, options = nil, open = false, escape = true)

タグを構築するヘルパー。nameタグを作成する。
開きタグもしくは空要素タグを作成し、要素をもつようなものは content_tag ヘルパーを利用する。
options に渡した Hash は属性になる。
open を true にすると `<br />` のようなXML用の空要素タグになる。

escape 引数は options の value をエスケープするかどうかになります。

### content_tag

* content_tag(name, content_or_options_with_block = nil, options = nil, escape = true, &block)

ブロックがあるかないかで、第2引数の役目が変化する。
ブロックがない場合は第2引数が内容になり、ある場合はブロックが内容になる。
ブロックがある場合、第3引数は第2引数がHashの場合は上書きされる。

textarea タグの最初には改行が入るようになってる。

### cdata_section

* cdata_section(content)

### escape_once

* escape_once(html)

HTMLのエスケープをしすぎないようによしなりにしてくれる。
ERB::Util.html_escape_onceに丸投げ。
