---
title: ActiveSupport::Deprecation
---
ActiveSupport::Deprecation
================================================================================

試した環境

```
$ ruby -v
ruby 2.0.0p0 (2013-02-24 revision 39474) [x86_64-darwin12.2.1]
```

```
$ bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.0.rc1
```

ActiveSupport::Deprecation を利用する方法

```ruby
require 'active_support/deprecation'
```

Behaviors
--------------------------------------------------------------------------------

廃止予定であることを伝えための方法に関するメソッドが定義されています。

### #behavior

現在の 廃止予定を通知するためのProcオブジェクトのリストを返します。
デフォルトでは、標準エラー出力へ出力するための Procオブジェクトを含むリストを返します。

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0.rc1/activesupport/lib/active_support/deprecation/behaviors.rb#L33-L36)

### #behavior=

* behavior=(behavior)

廃止予定の場合の動作を設定します。設定できる項目は

* raise
* log
* strerr
* ontify
* silence

で、リストをわたすことで同時に複数設定することもできます。

### debug

true に設定することで debug のための出力を追加できます。

Reporting
--------------------------------------------------------------------------------

廃止予定あることを伝えるためのメソッドが定義されています。

[ソースコードはこちら](https://github.com/rails/rails/blob/v4.0.0.rc1/activesupport/lib/active_support/deprecation/reporting.rb)

### #warn

* #warn(message = nil, callstack = nil)

廃止予定であることを伝える警告メッセージを出力します。
出力内容は `[ActiveSupport::Deprecation.behavior](#behavior)`を使って設定できます。

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0.rc1/activesupport/lib/active_support/deprecation/reporting.rb#L9-L21)

MethodWrapper
--------------------------------------------------------------------------------
### deprecate_methods

* deprecate_methods(target_module, *method_names)

モジュール名とメソッド名を指定するだけでメソッドを deprecate メッセージを吐くようになります。
引数 `method_names` は Hash で渡し `key` にメソッド名、`value` にメッセージを指定します。

DeprecatedObjectProxy
--------------------------------------------------------------------------------
Objectを deprecated なオブジェクトとしてマークできる。warn というメソッドが追加されメソッドを呼ぶ際に毎度呼ばれる。
これが deprecated なメッセージを出力する。

```ruby
require 'active_support/deprecation'

a = Activesupport::Deprecation::DeprecatedObjectProxy.new 10, 'this object is deprecate!'

a.to_s # => "10"
#-> DEPRECATION WARNING: this object is deprecate!. (called from irb_binding at (irb):7)
a + 10 # => 20
DEPRECATION WARNING: this object is deprecate!. (called from irb_binding at (irb):8)
=> 20
```

DeprecatedInstanceVariableProxy
--------------------------------------------------------------------------------
deprecated なインスタンス変数を設定できる。

DeprecatedConstantProxy
--------------------------------------------------------------------------------

deprecated な定数を設定できる。
