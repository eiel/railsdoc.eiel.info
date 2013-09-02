---
title: ActiveSupport::Autoload
---

autoload と eager load を便利にするモジュール ActiveSupport::Autoload
================================================================================

試した環境

```
$ ruby -v
ruby 2.0.0p247 (2013-06-27 revision 41674) [x86_64-darwin12.4.0]
```

```
$ bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.0
```

* [ソースコード](https://github.com/rails/rails/blob/v4.0.0/activesupport/lib/active_support/dependencies/autoload.rb)

この モジュールを extend すると Rails の規約に従って autoload が動くようになります。
autoload は クラス名から クラスが定義されているファイルを予測できるようになります。
また、eager load を提供します。
eager load は `eager_load!` した際に autoload に指定された クラスをまとめて読み込みます。
これを使うには `eager_outoload` に渡した block 内で autoload するのが基本的になります。
モジュールの `@_eager_autoload = true` としておけば、autoload した際に常に eager_load の対象となります。

モジュールメソッド
--------------------------------------------------------------------------------

### .extended

* extended(base)

モジュールを extend した時に呼ばれる。
extend を実行した モジュール名は 引数base で渡ってくる。

autoload と eager load に必要なインスタンスを設定する。

インスタンスメソッド
--------------------------------------------------------------------------------

### #autoload

* const_name, path = @_at_path

元々の `autoload` メソッド の第2引数が、必須からデフォルト値があるように拡張します。
引数 path が指定されている場合は通常の autoload のように動作する。
指定しない場合は、クラス名からRailsの規約に基いて推測します。

この時、基本となるディレクトリを設定したい場合は `autoload_under` メソッドのブロック内で使うことで設定できます。
また、`eager_autoload` メソッドのブロック内で利用することで eager load の対象にできます。

### #autoload_under

* autoload_under(path)

path の元で ファイルパスを推測してクラスを探すようになります。

```ruby
module Hoge
  extend ActiveSupport::Autoload

  autoload Mogu  # => hoge/mogu.rb を参照しようとする

  autoload_under 'mogu' do
    autoload :Goro   # => hoge/mogu/goro.rb を参照しようとする
  end
end
```

### #autoload_at

* autoload_under(path)

autoload の第2引数のデフォルト値をブロックの間だけ変更できる。

```ruby
module Hoge
  extend ActiveSupport::Autoload

  autoload_at 'mogu' do
    autoload :Goro   # => 'mogu.rb' を参照しようとする
  end
  # ブロックを抜けると元の状態に
end
```

### #eager_autoload

*  eager_autoload(path)

このメソッドのブロック内で `autoload` メソッドを利用すると `eager_load!` メソッドでまとめて読み込めます。`eager_load!` を使用しなければ、普通の autoload として振舞います。

```ruby
module Hoge
  extend ActiveSupport::Autoload

  eager_autoload do
    # ここで autoload しておけば eager_load! でまとめてよみこめる
  end
end
```

### #eager_load!

`autoloads`メソッドで返すクラスをすべて `require` します。

### #autoloads

eager_autoload で登録した クラスの一覧を取得できます。

気付きなど
--------------------------------------------------------------------------------

一時的に動作を変える方法としては、元の状態を保持しておき、
ブロック終了後に ensure を使って確実に元に戻すパターンがある。

```ruby
def メソッド名
  # 古い状態を保持して、新しい状態を設定
  # 古い状態はローカル変数にいれておき, ensure の内側で使える
  yield
ensure
  # 古い状態で上書きして元にもどす
end
```

というようなパターンになっている。
