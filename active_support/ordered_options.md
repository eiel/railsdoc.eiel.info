---
title: ActiveSupport::OrderedOptions
---

試した環境

```
$ ruby -v
ruby 2.0.0p247 (2013-06-27 revision 41674) [x86_64-darwin12.4.0]
```

```
$ bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.0
```

* [ソースコード](https://github.com/rails/rails/blob/master/activesupport/lib/active_support/ordered_options.rb)

Hash を継承したJavaScriptのオブジェクトのようにアクセスできる連想配列です。
Rails3以前は ruby 1.8 であっても key の順を保証する機能をもっていましたが、1.8 がサポートされなくなったため、そのような機能を気にする必要がなくなりました。(1.9では保証されている)
また、key は シンボルでも文字列でも同じ値にアクセスします。
これをさらに継承したデフォルト値をもった InheritableOptions も定義されています。

```ruby
option = ActiveSupport::OrderedOptions.new
option[:hoge] = 'goro'
option['hoge'] # => 'goro'
option.hoge    # => 'goro'

option = ActiveSupport::InheritableOptions.new(hoge: 'goro')
option[:hoge]  # => 'goro'
option['hoge'] # => 'goro'
option.hoge    # => 'goro'
option,mogu    # => nil
```

Rails.configuration のサブツリーのデータ構造として利用されています。

```ruby
Rails.configuration.i18n.class  # => ActiveSupport::OrderedOptions
```
