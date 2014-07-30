---
title: Thor::Shell
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-80 revision 45877) [x86_64-darwin13.0]
```

```
$ bundle exec  ruby -r thor/version -e 'puts Thor::VERSION'
0.19.1
```

* [ソースコード](https://github.com/erikhuda/thor/blob/master/lib/thor/shell/basic.rb)

[Thor::Shell](/thor/shell) が提供するもっとも単純なシェル環境を提供しつつ。いろいろ操作するためのメソッドを提供する。
Rails Generator や Rails Template で使うファイルの中でも使える。

Thor::Shell:Base
---

### mute

ブロックに渡された処理を一時的に `@mute` を false にする。
`#quiet` メソッドの道斎に影響を与える。

### ask

* ask(statement, *args)

ユーザに質問することができる。

`:limited_to` オプションを使うと入力できる項目を制限できる。

`:echo` オプションを指定するとパスワードなど入力する

### say

* say(message = "", color = nil, force_new_line = (message.to_s !~ /( |\t)\Z/))

画面に出力する。色など指定も可能。

### say_status

* say_status(status, message, log_status = true)

status と メッセージを表示する。
rails g をつかったときに表示される create などの部分に使われているメソッド。

```ruby
require 'thor'

Thor::Shell::Basic.new.say_status("success", "hoge")
```

```
     success  hoge
```

### yes?

ask のラッパーで yes/no を問うことができる。y か yes の場合は true を返す。

### no?

ask のラッパーで yeS? のときと違うのは no だった場合に true を返す。

### print_in_columns

* print_in_columns(array)

列に綺麗に表示するメソッド

```ruby
require 'thor'

Thor::Shell::Basic.new.print_in_columns(Array(9..12))
```

```
9   10  11  12
```

### print_table

* print_table(array, options = {})

array はリストのリストを渡して使う。

```ruby
require 'thor'

arrays = (1..3).map { |n|
  (9..12).map { |m| n*m }
}

Thor::Shell::Basic.new.print_table(arrays)
```

```
 9  10  11  12
18  20  22  24
27  30  33  36
```

### print_wrapped

端末の幅にあわせて折り返しをする

### file_collision

ファイルがすでにある場合のユーティリティを提供する。

### terminal_width

端末の幅を返す。

### error

標準エラー出力にメッセージを出力する

### set_color

色をセットした文字列を返す。
Thor::Shell::Basicの場合は何もしない。
