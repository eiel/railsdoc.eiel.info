---
title: ActiveSupport::Configuration
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

* [ソースコード](https://github.com/rails/rails/blob/master/activesupport/lib/active_support/configurable.rb)

クラスに `config` を提供するモジュール。ミックスインして使います。
Rails 内では AbstractController::Base ぐらいにしか使われていない模様。
`ActiveSupport::InheritableOptions`を継承しているので、基本的に好きな値を登録できます。

config_accessor を利用するとクラスから直接アクセスできます。


ActiveSupport::Configuration
--------------------------------------------------------------------------------

### #compile_methods!

Hash に存在する key から key と同名のメソッドがない場合にメソッドを生成します.

### .compile_methods!

* compile_methods!(keys)

`#complie_methods の実際にメソッドを実装している委譲先。

### .config

クラスオジェクトから設定項目へアクセスするためのメソッド。
スーパークラスが設定を保持している場合は、その値を継承する。

### .configure

設定へのアクセスをブロックの第1引数から行えます。

```ruby
Hoge.configure do |config|
  # config をつかって設定したりよみこんだり
end
```

### .config_accessor

* config_accessor(*names)

names の config を インスタンスからもアクセスできるようにします。

### #config

インスタンスからすべての設定情報にアクセスしたい場合に使えるメソッド。
