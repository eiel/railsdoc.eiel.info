---
title: ActionDispatch::Routing::Mapping
---

```
$ ruby -v
ruby 2.1.0p0 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.2
```

* [ソースコード](https://github.com/rails/rails/blob/4-0-stable/actionpack/lib/action_dispatch/routing/mapper.rb)

Routing の中で一番重要なファイルになりそうな気がする。

ActionDispatch::Routing::Mapper::Costraints
--------------------------------------------------------------------------------

self.new がオーバライドされてる珍しい例だと思う。
制約が指定されていない場合は第1引数をそのまま返す。
そうでない場合はインスタンスを返すようです。

call メソッドがあり Rackオブジェクト。

constraints でチェックを行い、チェックを通れば app を実行できるというもの。

### matches?

* mathes?(env)

env で反応するべきルーティングがあるのかチェックする。
コンストラクタの第2引数で渡された constraionts に対しチェックを行う。
ものによっては実際に call してチェックする。

### call

matches? を満す場合のにコンストラクタの第1引数である app を実行する。
失敗した場合は 404 を返す。

ActionDispatch::Routing::Mapper::Mapping
--------------------------------------------------------------------------------
[ActionDispatch::Routing::RouteSet](action_dispatch/routing/route_set) へ追加する情報を作成する。
to_route メソッドによって値が構築される。

生成される値は

* app
* conditions
* requirements
* defaults
* as
* anchor

as と anchor はコンストラクタで渡したオプションが正規化した情報を利用する。

### normalize_options!

コンストラクタで渡された options の内容をチェックして調整する。x

* scope が保持しているオプションがあれば取り込む。
* パスの中でワイルドカードが使われており、オプションへ情報を取り込む。
* scope が module の場合に :controller が path 内があった場合、ArgumentErrorにする。
* デフォルトのcontrollerとactionオプションを生成する。
  * option to が Rackオブジェクトの場合、何も生成しない。
  * to が字列の場合は `#` 区切りで前がコントローラ、後ろがアクションとなる。
  * to がシンボルの場合、アクションとなる。
  * 共にScopeに情報があればこれがデフォルト値になる。
  * コントローラが正規表現ではない場合スコープのモジュール情報を結合させる。* コントローラが文字列の場合 かつ スラッシュの場合は ArgmunteError
  * コントローラもアクションも文字列で保存される。
  * コントローラもアクションも決定する要素がない場合もArgmentError
  * コントローラが文字列で、使用できない文字で構成されていても ArgmentError

### normalaize_path!

コンストラクタで渡された path の内容をチェック。

* path は必須項目。
  * format が必須の場合は`.:format` を付与
  * format が任意の場合ha`(.:format)` を付与

### normalalize_requirements!

制約から必要な @requirements を作成する。 requirements はパス内の動的値の模様。
farmat の必須状況次第で requirements を設定。

### normalize_conditions!

* path から conditions[:path_info] を作成
* 制約情報から conditions を作成
* via オプションから HTTPメソッドへの conditions を作成。

### normalize_defaults

値が設定されなかった場合のデフォルトを格納した @defaults を作成。x

### app

rack アプリケーションを作成

* to が call を実装しているオブジェクトならそのまま endpoint として利用
  * そうでない場合は Routing::RouteSet::Dispatcher を作成。

### segment_keys

path 内に変数になっている部分をとりだす。
この部分の作成には Journey が利用されている。

ActionDispatch::Routing::Mapper
--------------------------------------------------------------------------------
コンストラクタの引数には [ActionDispatch::Routing::RouteSet](action_dispatch/routing/route_set) のインスタンスが利用される。
`config/routes.rb` で渡しているブロックはこのクラスのインスタンスで instance_eval される。
`config/routes.rb` で利用できるDSLを定義している。
