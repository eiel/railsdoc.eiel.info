title: ActionView::Helpers::FormTagHelper
---

```
$ ruby -v
ruby 2.1.1p76 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -r action_pack -e 'puts ActionPack::VERSION::STRING'
4.1.0
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.0/actionview/lib/action_view/helpers/form_tag_helper.rb)


ActionView::Helpres::FormTagHelper
--------------------------------------------------------------------------------


### embed_authenticity_token_in_remote_forms

モジュール変数 で false に設定すると date-remote を利用する際に authenticity_token の値が false になる。

### form_tag

form タグを生成する。

使えるオプションは

* multipart
* method
* authenticity_token
* remote
* enforce_utf8

### select_tag

* select_tag(name, option_tags = nil, options = {})

第2引数の options_tags は文字列を渡す。
ここに渡すオプションタグを作るのに使える helper は別にある。
options_from_collection_for_select など。

利用できるオプションは

* multiple - true にすると複数選択できる - name が変化する。
* disabled
* include_blank
* prompt - 空の時になんとための選択ボックスなのか示される

### text_field_tag

* text_field_tag(name, value = nil, options = {})

引数name から name 属性やid属性の値をつくる。id は sanitize_to_id によって行われる。

### label_tag

* label_tag(name = nil, content_or_options = nil, options = nil, &block)

name から for 属性が設定される。 未設定の場合は options[:for] から取得


### hidden_field_tag

text_field_tag のラッパー

### file_field_tag

text_field_tag のラッパー

### password_field_tag

text_field_tag のラッパー

### text_area_tag

text_area タグを作成する。 size オプションで '10x20' のような指定で rows cols が指定できる。

### check_box_tag

* check_box_tag(name, value = "1", checked = false, options = {})

checked オプションがあり、チェックした状態か設定できる。

### radio_button_tag

* radio_button_tag(name, value, checked = false, options = {})

id は name と value から生成される。

### submit_tag

* submit_tag(value = "Save changes", options = {})

value で表示名を調整できる。

### button_tag

*  button_tag(content_or_options = nil, options = nil, &block)

contot を指定しない場合は 'button' となる。

### image_submit_tag

* image_submit_tag(source, options = {})

alt は source から生成される。

### field_set_tag

HTML5 の field_set_tag なタグを作成するヘルパー

### utf8_enforcer_tag

フォームのエンコードを UTF-8 としてエンコードできるようにマークをいれるタグを生成する
