---
title: ActiveSupport::Callbacks
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

* [ソースコード](https://github.com/rails/rails/blob/master/activesupport/lib/active_support/callbacks.rb)

callback を登録できるようにします。
利用には `ActiveSupport::Callbacks` をミックスインして `define_callback` を利用してコールバックを登録します。
callback には :before, :after, :around があります。
callback は `run_callback name` に対し挿入されます。

```ruby
require 'active_support/callbacks'

class Base
  include ActiveSupport::Callbacks
  define_callbacks :save

  def save
    puts 'before save'
    run_callbacks :save do
      puts 'save'
    end
    puts 'after save'
  end
end

class Child < Base
  set_callback :save, :before do
    puts 'saving'
  end

  set_callback :save, :after do
    puts 'saved'
  end
end

Child.new.save

# > before save
# > saving
# > save
# > saved
# > after save
```

ActiveSupport::Callbacks
--------------------------------------------------------------------------------

### CALLBACK_FILTER_TYPES

コールバックのフィルターとして利用できる値の一覧 :before, :after, :around

### run_callbacks

* run_callbacks(kind, &block)

実際にコールバックを行う場所で呼び出しをするメソッド。
kind に設定されたコールバックを取得して、ブロックの前や後に処理を行う。

"_#{kind}_callbacks"にCallbackChainのインスタンスを保存しておき、コールバックを実行するためのコンテキストを作成して実行を行う。

### #halted_callback_hook

* halted_callback_hook(filter)

コールバックが停止したときに実行される hook。オーバライドしてデバッグやロギングに使える。


ActiveSupport::Callbacks::Conditionals::Value
--------------------------------------------------------------------------------

ブロックを格納しておく、クラス。 call したときに第1引数を無視するのが特徴。
利用箇所がみつけられない。

ActiveSupport::Callbacks::Conditionals::Filters
--------------------------------------------------------------------------------

Environment, End, Before, After, Around, ENDING という定数が用意されている。

Before, Afetr, Around にはそれぞれに build メソッドが用意しておりコールバックを生成する。
これらは AciveSupport::Callbacks::Callback#apply で使用される。
それぞれの違いは `simple' メソッドを比較するとわかりやすい。

### Environment

構造体。target, halted, value, run_block というメンバを持つ。
call する際に様々なオブジェクトに渡される。
halted には中断されたかどうかが保存される。

### ENDING

End のインスタンス。

ActiveSupport::Callbacks::Conditionals::Filters::End
--------------------------------------------------------------------------------

### #call

* call(env)

`env.halted` が false であれば `env.run_block を起動します。

ActiveSupport::Callbacks::Filters::Before
--------------------------------------------------------------------------------

### .build

* build(next_callback, user_callback, user_conditions, chain_config, filter)

コールバックを構築します。ブロックオブジェクトを返します。

chain_config の :terminator に値がdって、終了状態になっていれば user_callback を呼ばないような処理を作成します。
また、`user_conditions` に指定した条件を見たさない場合にも user_callback を呼ばないように処理されます。

ActiveSupport::Callbacks::Filters::After
--------------------------------------------------------------------------------

### .build

* build(next_callback, user_callback, user_conditions, chain_config, filter)

コールバックを構築します。ブロックオブジェクトを返します。

Before と同様の動作するが user_callback より先に nexc_callback を利用するようにする。

ActiveSupport::Callbacks::Filters::Around
--------------------------------------------------------------------------------

### .build

* build(next_callback, user_callback, user_conditions, chain_config, filter)

コールバックを構築します。ブロックオブジェクトを返します。

Before と同様の動作するが user_callback の 中で next_callback を実行するようにする


ActiveSupport::Callbacks::Callback
--------------------------------------------------------------------------------

登録されたコールバックを保持しておくためのクラス。

### .build

* build(chain, filter, kind, options)

chain から インスタンスを作成します。chain の name と config を使います。

### #filter

filter の object_id を返します。

### #raw_filter

filter の指している、フィルタそのものを返します。

### #merge

* merge(chain, new_options)

chain と new_options に変更した新しい Callback を作成します。

### #matches?

* matches?(_kind, _filter)

フィルターの種類と利用するフィルータが引数のものと等しいか確認する。

### #duplicates?

コピーできるか確認します。

### #apply

* apply(next_callback)

もっている情報からブロックオブジェクトを生成する。

CallbackChain#compile で利用される。
次に呼ぶコールバックが必要になるため、最後に呼ぶコールバックから畳み込みされるように使う。


### #make_lambda

* make_lambda(filter)

プライペートメソッド。

`#apply` で callback として lambda を生成するときに使うメソッド。

### #conditions_lambdas

プライペートメソッド。


`#apply` で利用する。
コールバック利用条件を満すときだけ動作するようにする。
オプションに付加された :if や :unless の処理をするためのメソッド。
