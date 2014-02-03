---
title: ActionDispatch::Journey::Scanner
---

```
$ ruby -v
ruby 2.1.0p0 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -r action_pack -e 'puts ActionPack::VERSION::STRING'
4.0.2
```

* [ソースコード](https://github.com/rails/rails/blob/v4.0.2/actionpack/lib/action_dispatch/journey/scanner.rb)

[StrScanner](http://docs.ruby-lang.org/ja/2.1.0/class/StringScanner.html) のラッパーで、トークンをスキャンするためのクラス。

StringScanner は読み込みする文字列とどこまで読み込みしたかを示すポインタを組み合わせてちょっとずつ文字列を読み込みして消化していくためのものです。

Scanner は StringScanner のインスタンスを作成するのを遅延したり、next_token メソッドで、[トークンの種類,文字列]という形式で値を返します。

トークンの種類には

* SLASH `/`
* STAR `*`
* LPAREN `(`
* RPAREN `)`
* OR `|`
* DOT `.`
* SYMBOL `:\w+`
* LITERAL `[\w%\-~]+`

となるようです。どれでもない場合でも LITERAL になるようですが…。
