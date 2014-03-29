---
title: ActionDispatch::Assertions::SelectorAssertions
---

```
$ ruby -v
ruby 2.1.1p76 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -r action_pack -e 'puts ActionPack::VERSION::STRING'
4.1.0.rc1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.0.rc1/actionpack/lib/action_dispatch/testing/assertions/selector.rb)

テストコードをかくためのアサーションが実装されている。
このファイルはセレクタに関するものが実装されている。

assert_select assert_encoded asseart_email などが定義されています。


ActionDispatch::Assertions::SelectorAssertions
--------------------------------------------------------------------------------

### css_select

* css_select(*args)

selector を渡すとマッチする HTML::Node を返す。

引数を複数を与えると第1引数を root にして 第2引数を selector としてマッチする HTML::Node を返す。

### assert_select

* assert_select(*args, &block)

論ずるより例をみたほうがわかりやすい。

```
# form があるかどうか
assert_select "form"

# form の中に input が 4つあるかどうか
assert_select "form input", 4

# title の innter text が "title"
assert_select "title", "Welcome"

# title タグがひとつで innerText が "Welcome"
assert_select "title", {count: 1, text: "Welcome"},

# form がない
assert_select "form", false, "This page must contain no forms"

assert_select "body div.header ul.menu"

assert_select "ol>li#?", /item-\d+/

assert_select "form input" do
  assert_select "[name=?]", /.+/  # Not empty
end
```

maximum や minimum というオプションも使える

### count_description

* count_description(min, max, count)

mix max count の組み合わせに併せて説明文字列を作成する。

### assert_select_encoded

* assert_select_encoded(element = nil, &block)

エンコードされてるHTMLを展開して assert_selectする。
RSNなどのXMLに対して使うものっぽい。

### assert_select_email

*  assert_select_email(&block)

送信したメールに対して assert_equal を使えるよういするブロックを提供する。
