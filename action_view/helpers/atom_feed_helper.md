---
title: ActionView::Helpers::AtomFeedHelper
---

```
$ ruby -v
ruby 2.1.1p76 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -r action_pack -e 'puts ActionPack::VERSION::STRING'
4.1.0.rc1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.0.rc1/actionview/lib/action_view/helpers/atom_feed_helper.rb)

名前のとおり Atom Feed を作成するためのヘルパーが定義されてる。

例をみたほうが速い。

```ruby
atom_feed({'xmlns:app' => 'http://www.w3.org/2007/app',
    'xmlns:openSearch' => 'http://a9.com/-/spec/opensearch/1.1/'}) do |feed|
  feed.title("My great blog!")
  feed.updated((@posts.first.created_at))
  feed.tag!('openSearch:totalResults', 10)

  @posts.each do |post|
    feed.entry(post) do |entry|
      entry.title(post.title)
      entry.content(post.body, type: 'html')
      entry.tag!('app:edited', Time.now)

      entry.author do |author|
        author.name("DHH")
      end
    end
  end
end
```

atom_feed を基点に ブロック内には AtomBuilder のインスタンスが渡される。
これをつかってフィードを構築できる。
