---
title: ActionView::Helpers::FormOptionsHelper
---

```
$ ruby -v
ruby 2.1.1p76 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -e 'require "action_view"; puts ActionView.version'
4.1.0
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.0/actionview/lib/action_view/helpers/form_options_helper.rb)

ActionView::Helpers::FormOptionsHelper
--------------------------------------------------------------------------------

### select

* select(object, method, choices = nil, options = {}, html_options = {}, &block)

select タグ作成するヘルパー。
blockの中で option を生成することもできるし choices に指定することもできる。

### collection_select

* collection_select(object, method, collection, value_method, text_method, options = {}, html_options = {})

コレクションから select タグと opition タグを作る。optionの value と text は value_method text_method に指定したメソッドから生成する。

### grouped_collection_select

* grouped_collection_select(object, method, collection, group_method, group_label_method, option_key_method, option_value_method, options = {}, html_options = {})

group_method に指定したメソッドの値ごとに区分けできる collection_select。

### time_zone_select

* time_zone_select(object, method, priority_zones = nil, options = {}, html_options = {})

time_zone を選択させる セレクトボックスが作れる模様。

### options_for_select

* options_for_select(container, selected = nil)

option タグを生成するヘルパー selected に指定した値を選択した状態できる。
key value な配列の配列でも1次元の配列でも利用できる。
Hashも利用可能。

### options_from_collection_for_select

* options_from_collection_for_select(collection, value_method, text_method, selected = nil)

options_for_select のコレクションに対し利用しやすくしたもの。
collection_select を使えない場面で。


### option_groups_from_collection_for_select

* option_groups_from_collection_for_select(collection, group_method, group_label_method, option_key_method, option_value_method, selected_key = nil)

グループわけしたい場合に。

### grouped_options_for_select

option_groups_from_collection_for_select のオプション部分だけ抜き出したもの？

### time_zone_options_for_select

timezone 用のオプションを作る

### collection_radio_buttons

コレクションからラジオボタンを生成する。
Tags::CollectionRadioButtons に処理がまわされていてあまりよくわからない。

### collection_check_boxes

collection_radio_buttons と同様。
