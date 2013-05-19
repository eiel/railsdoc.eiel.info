---
title: Core Ext Kernel
---

試した環境

```
$ ruby -v
ruby 2.0.0p195 (2013-05-14 revision 40734) [x86_64-darwin12.3.0]
```

```
$ bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.0.rc1
```

機能を追加する方法

```ruby
require 'active_support/core_ext/kernel
```

Agnostics
--------------------------------------------------------------------------------

`` によるコマンド実行の機能を上書きしている。


この機能だけ読み込みする方法

```ruby
require 'active_support/core_ext/kernel/agnostics'
```
* [ソースコード](https://github.com/rails/rails/blob/v4.0.0.rc1/activesupport/lib/active_support/core_ext/integer/inflections.rb)


### #`

`` によるコマンド実行時に Errno::ENOENT 例外が発生した場合、レスキューして標準エラー出力に出力する。

Debugger
--------------------------------------------------------------------------------

debugger が定義されている場合、debugger の動作を拡張します。

### #debugger

debugger が定義されている場合、debugger が起動した際に追加のメッセージが表示されます。
また、breakpoint というエイリアスを作成します。

ruby 2.0.0 以降では debugger を使用するには [debugger2](http://rubygems.org/gems/debugger2) gem を使用します。
それ以前は [debugger](http://rubygems.org/gems/debugger) gem を使用します。

Reporting
--------------------------------------------------------------------------------

標準出力や標準出力などに書き込みする際に影響を与えるメソッドが定義されている。
この機能だけ読み込みする方法

```ruby
require 'active_support/core_ext/kernel/reporting'
```
* [ソースコード](https://github.com/rails/rails/blob/v4.0.0.rc1/activesupport/lib/active_support/core_ext/kernel/reporting.rb)

### #silence_warning

一時的に $VERVOSE を無効にできる。ブロックを処理している間だけ、$VERVOSE が nil の状態で動作します。

### #enable_warning

`silence_warning` とは逆に、 一時的に$VERVOSE を有効にできる。ブロックを処理している間だけ、 $VERVOSE が true の状態で動作します。

### #with_warings

* with_warings(flag)

一時的に $VERVOSE の状態を変更できる。引数 flag に与えた値がブロックを処理している間だけ、$VERVOSE の値になります。

### #silence_stream

* silence_stream(stream)

引数stream を /devu/null に流して、捨てることができます。

### #suppress

* suppress(*exception_classes)

引数 excption_classes に指定した例外が発生した場合に無視するようにできます。

### #capture

* capture(stream)

ブロック内での、引数 stream への書き込みを取得できます。
silence というエイリアスがあります。

### #quietly

ブロック内での、標準出力、標準エラー出力への書き込みを捨てることができます。
