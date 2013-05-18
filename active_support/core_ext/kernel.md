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
