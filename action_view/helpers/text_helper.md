---
title: ActionView::Helpers::TextHelper
---

```
$ ruby -v
ruby 2.1.1p76 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -e 'require "action_view"; puts ActionView.version'
4.1.0
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.0/actionview/lib/action_view/helpers/text_helper.rb)

小さい機能がいっぱいあって面白い

ActiovView::Helpers::TextHelper
--------------------------------------------------------------------------------

### concat

* concat(string)

引数 string を出力する。
副作用で出力できるのでコード上でなんとかしたい場合に使えそう。


### safe_concat

* safe_concat(string)

concat をする時に safe_concatを使うようになる。

### truncate

* truncate(text, options = {}, &block)

text を途中で削除し `...` におきかえる。
デフォルトは30文字。 String#truncate をつかって実装されてる

### highlight

* highlight(text, phrases, options = {})

text に含まれた phrases がある場合 option の highligeter を利用して強調する。
デフォルトでは `<mark></mark>`

### excerpt

* excerpt(text, phrase, options = {})

引数 text に含まれる phrase の周辺の文字列をとりだす。

radius オプションで周辺どのくらいを残すか指定でき、
separator オプションで区切りをしていできたりする。


### pluralize

* pluralize(count, singular, plural = nil)

引数count に単位をつける際に、引数 singlura を複数系へ変更してくれる。

### word_wrap

* word_wrap(text, options = {})

引数 text を80列に収まるように行に改行を入れる。
line_width オプションで調整可能。
正規表現で対処してるのが印象にのこった。

```
line.gsub(/(.{1,#{line_width}})(\s+|$)/, "\\1\n").strip
```

### simple_format

* simple_format(text, html_options = {}, options = {})

引数テキストをざっくりとHTMLに変換してくれるみたい。

### cycle

* cycle(first_value, *values)

いろいろな値を繰り返しつかう場合に使えるヘルパー。
ストライプなテーブルを作成するのに `odd`、 `even`をくりかえしたりです。

name オプションをつけることによって違うインスタンスを参照できるようになってる

### current_cycle

* current_cycle(name = "default")

cycleの値を途中で取り出せる。
どのcycleを参照するかは引数 name で調整します。

### reset_cycle

* reset_cycle(name = "default")

cycle を初期状態に戻せます。
