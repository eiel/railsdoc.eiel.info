---
title: ActiveSupport::Rescuable
---

試した環境


```
$ ruby -v
ruby 2.1.0dev (2013-09-22 trunk 43011) [x86_64-darwin12.5.0]
```

```
$ bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.0
```

* [ソースコード](https://github.com/rails/rails/blob/4-0-stable/activesupport/lib/active_support/rescuable.rb)

ActiveSupport::Rescuable 例外を簡単に処理するためのモジュールです。

主に Controller の action で発生する例外に使われています。
ActionController::Rescue で include されて、これが ActionController::Baseで includeされています。
他には、ActionController::StrongParameters に include されています。
これも ActionController::Base で include されています。
こちらは StrongParameters を使う際に必要だからではないかと推測しています。

クラスメソッド rescue_from が追加されます。
設定した例外が発生した時に指定したブロックまたはメソッドを実行するように登録することができます。

例

```ruby
require 'active_support/rescuable'

class AnythingError < StandardError; end
class NoRescueError < StandardError; end

class Hoge
  include ActiveSupport::Rescuable

  rescue_from AnythingError do
    puts 'raise AnythingError'
  end

  def hoge
    raise AnythingError
  end

  def mogu
    raise NoRescueError
  end

  def call(method_name)
    send(method_name)
  rescue Exception => e
    unless rescue_with_handler(e)
      raise
    end
  end
end

hoge = Hoge.new
hoge.call(:hoge)
# > raise AnythingError
hoge.call(:mogu)
# ! rasie NoRescueError
```

ActionControler::Baseの子クラスであれば call のようなメソッドは実装されているので特に何かする必要はありません。
例外が発生した場合に recue_with_hander を呼ぶことになりますが、登録されている処理があれば、true を返し、処理されなかった場合はnilを返しますので、nil だった場合は再度例外を伝搬するようにしてみました。


ActiveSupport::Rescue
--------------------------------------------------------------------------------

### .rescue_from

* rescue_from(*klasses, &block)

引数 klasses には例外のクラスを指定します。複数指定可能です。
block または `:with` オプションのどちらかが必須になります。
:with を使用した場合はメソッド名を渡します。klasses の例外が発生した際に呼ばれるメソッドです。
blcokの場合は発生した際に行う処理を登録することができます。

例外発生時の処理には第一引数に例外を渡すこともできます。

### #resuce_with_handler

* rescue_with_handler(exception)

例外が起きた際にrescue_fromで登録された処理を実際に呼び出す仕事をします。呼び出しに成功すれば `true` を返し、なにもしなかった場合は nil を返します。

### #handler_for_rescue

* handler_for_rescue(exception)

`recue_with_handler` メソッドで例外に対応した処理を探しだす機能を担うメソッドです。
返す処理はひとつのみです。
ある例外に対し複数の rescue_from は登録できません。
