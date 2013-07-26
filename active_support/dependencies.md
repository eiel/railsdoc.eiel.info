---
title: ActiveSupport::Dependencies
---


試した環境

```
$ ruby -v
ruby 2.0.0p0 (2013-02-24 revision 39474) [x86_64-darwin12.2.1]
```

```
$ bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.0.rc1
```

`active_support` で Autoload されています。

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0/activesupport/lib/active_support/dependencies.rb)

ファイル内で追加定義されてるクラス/モジュール

* ActiveSupport::Dependencies::WatchStack
* ActiveSupport::Dependencies::ModuleConstMissing
* ActiveSupport::Dependencies::Loadable
* ActiveSupport::Dependencies::ClassCache

このファイルの読み込みの最後に`ActiveSupport::Dependencies.hook!`が実行されている。

ActiveSupport::Dependencies
--------------------------------------------------------------------------------

TODO

ActiveSupport::Dependencies::WatchStack
--------------------------------------------------------------------------------

ActiveSupport::Dependencies が constant_watch_stack を保持するのに利用するクラス。

名前空間を監視して、新しく追加された定数を発見できる。
`watch_namespaces` を使って監視する名前空間を指定できます。
監視中に `new_contants` を呼び出すと監視が終了し、新しく発見した定数を返します。

```ruby
require 'active_support/dependencies'

watch_stack = ActiveSupport::Dependencies::WatchStack.new

watch_stack.watch_namespaces ["Object"]

module Goro1
  module Hoge1
  end
end

watch_stack.new_constants # => [Goro1]

watch_stack.watch_namespaces ["Object", "Goro2"]

module Goro2
  module Hoge2
  end
end

watch_stack.new_constants # => ["Goro2", "Goro2::Hoge2"]
```

### #each

watch_namespaces を呼ぶたびに監視する名前空間をスタックします。これを each できます。

### #watching?

監視しているものがあるかどうかを問合せます。

### new_constants

最後に watch_namespaces したものを監視を終了して、新しく見つけた定数のリストを返します。

### watch_namespaces

* watch_namespaces(namespaces)

引数 namespaces を監視します。定数の名前のリストを渡します。
定数のリストを渡しても動きますが、未作成の定数の場合はエラーが起きるので文字列を使うほうが良さそうです。

ActiveSupport::Dependencies::ModuleConstMissing
--------------------------------------------------------------------------------

TODO

ActiveSupport::Dependencies::Loadable
--------------------------------------------------------------------------------

TODO

ActiveSupport::Dependencies::ClassCache
--------------------------------------------------------------------------------

TODO
