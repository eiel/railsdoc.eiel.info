---
title: AbstractController::Callbacks
---

```
$ ruby -v
ruby 2.1.0dev (2013-09-22 trunk 43011) [x86_64-darwin12.5.0]
```

```
bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.0
```

* [ソースコード](https://github.com/rails/rails/blob/4-0-stable/actionpack/lib/abstract_controller/helpers.rb)

view 内で利用可能なメソッドであるHelperを定義したり、外部から読み込みしたりする機能を提供します。

クラス変数として _helpers と _helpers_method が用意されていて、_helpers は Modle クラスのインスタンスで _helpers_method は Array です。
`.helper` を使いモジュールを読み込みしたり、メソッドを追加できますが、モジュールであれば _helpers にイクルードしていき、ブロックを渡しているのであれば、module_eval していきます。
なので、_helpers を取り出して include なり extend をすることで機能を取り込めます。

```ruby
require 'abstract_controller'

module MoguHelper
  def mogu
    "mogu"
  end
end

class Hoge
  include AbstractController::Helpers

  helper MoguHelper
end

extend Hoge._helpers
mogu # => 'mogu'
```

_helper_methods には Controller に定義されているメソッドをhelperにする機能がありますが、helper として登録した名前を記録しています。
メソッド自体は _helpers のモジュールメソッドとして定義されます。

また、このモジュールを include しているクラスが継承された時にデフォルトのHelperを読み込みする機能があります。
クラス名のControler という文字を削除した上でアンダースコア化して helper メソッドを使用して読み込みします。


AbstractController::Helpers
--------------------------------------------------------------------------------

Helper を読み込みをするための機能を提供します。View へ機能割り当てまでは対応してないようです。

### helper_method

* helper_method(*meths)

コントローラに定義されてるメソッドをヘルパーメソッドとして登録します。
名前を渡すだけです。
実際には、Controllerに処理を委譲するメソッドを定義します。
そのためコントローラのインスタンス変数にアクセスしたりがこの場合はできそうです。

### helper

* helper(*args, &block)

文字列やシンボルを渡してファイルを読み込みした上で読み込みしたり、モジュールを渡したり、ブロックでヘルパーを定義したりできます。

文字列を渡す場合は `hoge` であれば `hoge_helper.rb` を探索して `HogeHelper` が定義されていることを期待します。

### clear_helpers

定義されている _helpers を設定しなおします。

### modules_for_helpers

* modules_for_helpers(args)

helper の内部でも使われている文字列から対応するモジュールを取り出すためのメソッドです。モジュールを渡せばそのままモジュールを返します。
_helpers への取り込みほ行われません。
