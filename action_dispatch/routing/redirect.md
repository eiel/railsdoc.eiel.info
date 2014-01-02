---
title: ActionDispatch::Routing::Redirect
---

```
$ ruby -v
ruby 2.1.0p0 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.2
```

* [ソースコード](https://github.com/rails/rails/blob/4-0-stable/actionpack/lib/action_dispatch/routing/redirection.rb)

ActionDispatch::Routing::Redirection モジュールの redirect を提供するファイル。
ルーティング内で使用し、Rackオブジェクトを返す。
これら redirect の引数に応じてインスタンスは

* Redirect
* PathRedirect
* OptionRedirect

クラスのいずれかになる。

Redirect をすべて継承しているが、インスタンス変数である @block は PathRedirect であれば文字列 OptionREdirect では Hash になるので注意。

call メソッドが提供されていて Rack オブジェクトとして使える。

ActionDispatch::Routing::Redirect
--------------------------------------------------------------------------------
callメソッドが用意されているので、Rack オブジェクトとして扱える。

コンストラクタでは ステータスコードと path を生成するための処理を渡せる。
このブロックには パラメータとリクエストオブジェクトが渡される。

### call

* call(env)

env から Request オブジェクトを作成し、リダイレクトする。
path を作成するための処理はコンストラクタでうけとったブロックで行う。
これは、redirect メソッドでブロックを渡されたものがそのままやってくる。

### path(params, request)

call メソッドでも利用される。params と request は call で生成される。
実際に処理をするのはコンストラクタでうけとったブロック。
そのまま処理を委譲している。

### inspect

`"redirect(#{status})"` という文字列を返す。

ActionDispatch::Routing::PathRedirect
--------------------------------------------------------------------------------
redirect メソッドで第1引数が文字列の場 path と認識して利用され、このクラスのインスタンスとなる。


ActionDispatch::Routing::OptionRedirect
--------------------------------------------------------------------------------
redirect メソッドでオプションが使われている場合、このクラスのインスタンスになる。

ActionDispatch::Routing::Redirection
--------------------------------------------------------------------------------

tionDispatch::Routing::Mapper](action_dispatch/routing/mapper) クラスにミックスインされ、redirectメソッドが提供される。
redirect が返すのは RedirectクラスのインスタンスでRackオブジェクトであることがわかれば後は難しくない。
