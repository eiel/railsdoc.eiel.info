---
title: ActionView::Helpers::AssetTagHelper
---

```
$ ruby -v
ruby 2.1.1p76 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -r action_pack -e 'puts ActionPack::VERSION::STRING'
4.1.0.rc1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.0.rc1/actionview/lib/action_view/helpers/asset_tag_helper.rb)

[AssetUrlHelper](/action_view/helpers/asset_url_helper/)を使った便利ヘルパーを定義している。
AssetUrlHelper は主にURLを生成しますが、こちらはHTMLタグを生成するものが定義されてる。

ActionView::Helpers::AssetTagHelper
--------------------------------------------------------------------------------

### javascript_include_tag

* javascript_include_tag(*sources)

複数のファイルを並べてかける。拡張子は省くこともできる。

### stylesheet_link_tag

* stylesheet_link_tag(*sources)

javascript と同様。

### auto_discovery_link_tag

* auto_discovery_link_tag(type = :rss, url_options = {}, tag_options = {})

RSSのようなブラウザが検知するようなタグを作成するヘルパー。

type には :rss か :atom を指定。

### favicon_link_tag

* favicon_link_tag(source='favicon.ico', options={})

asset に配置している favicon へのリンクタグを生成する。

### image_tag

*  image_tag(source, options={})

sizeオプションで "10x20" といった指定で width、 heightが指定できる機能がある。

### image_alt

* image_alt(src)

ファイル名から alt 用の文字列を生成する。

### video_tag

* video_tag(*sources)

image_tag と同様に size による指定ができる。

### audio_tag

* audio_tag(*sources)

video_tag との共通部分は multiple_sources_tag でまとめられてる。
