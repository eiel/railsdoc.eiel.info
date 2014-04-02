---
title: ActionView::Helpers::AssertUrlHelper
---

```
$ ruby -v
ruby 2.1.1p76 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -r action_pack -e 'puts ActionPack::VERSION::STRING'
4.1.0.rc1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.0.rc1/actionview/lib/action_view/helpers/asset_url_helper.rb)

asset_path を提供する。
assert_path のラッパである

* asset_url
* javascript_path
* javascript_url
* stylesheet_path
* stylesheet_url
* image_path
* image_url
* audio_path
* audio_url
* font_path
* font_url
* video_path
* video_url
* font_path
* font_url

などが実装されている。
`path_to_asset` や `url_to_asset` といった別名を用意されてる。

`config.action_controller.asset_host` にホストを設定することで配信先を調整できる。

`ActionController::Base.asset_host` に call できるオブジェクトを渡すとさらに細かい制御ができる。


ActionView::Helpers::AssertUrlHelper
--------------------------------------------------------------------------------

### asset_path

* asset_path(source, options = {})

source を調整して、拡張子を決めて、relative_url があれば頭に付加して、ホストを設定する必要があれば設定するという流れ。

* protocol オプション :request, :relative, プロトコル名が指定できる
* extname オプション 拡張子に利用される
* type オプション 拡張子を補完する情報源とサブディレクトリを決定する。

### asset_url

* asset_url(source, options = {})

options に `:protocol => :request` を付加して asset_path を呼ぶ。

### compute_asset_extname

* compute_asset_extname(source, options = {})

補完する拡張子をもとめる。
extname と type オプションを指定できる。
typeは javascript と stylesheet しか対応してない。

### compute_asset_path

* compute_asset_path(source, options = {})

ディレクトリを決める。
typeオプションの情報を使う。

### compute_asset_host

config.asset_hostが設定されている場合はこれを利用し、されていない場合に `:protocol => :request` が設定されてると request オブジェクトから host を生成する。

protocol には 他には  relative が指定できる。それ意外の場合はURLのプロトコルに使用される。

### javascript_path

options に `type: :javascript` を加えて path_to_asset を呼ぶだけ。

### javascript_url

options に `type: :javascript` を加えて url_to_asset を呼ぶだけ。
