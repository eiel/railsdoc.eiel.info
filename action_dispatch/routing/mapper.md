---
title: ActionDispatch::Routing::Mapper
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

`config/routes.rb` のDSLを担当する部分を担当しており、最終的な仕事は Journey によって行われている模様。

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

* Base
* HttpHelpers
* Redirection
* Scoping
* Concerns
* Resources

を include して機能強化されます。

初期化時に RouteSet のインスタンスをうけとり、これにルーティングを追加していく。
scopeにはデフォルトで path_names が設定される。
この値は最初に受けとった set の resources_path_names の戻り値を使う。
resources_path_name のデフォルトでは `{ :new => 'new', :edit => 'edit' }` が設定されている。

### .normalize_path

* normalize_path(path)

Journey::Router::Utils.normalize_path で path を修正します。

`(:locale)` が `(/:locale)` になってしまうのを `/(:locale)` になおす模様

### .normalize_name

* normalize_name(name)

normalaize_path を使い name をノーマライズし、`/` をアンダーラインに変更して名前に修正する。
先頭の / もなくなる。

ActionDispatch::Routing::Mapper::Base
--------------------------------------------------------------------------------

基本的なメソッドが実装されているっぽいけど、一番基本っぽい match は空の実装になってる。
Resources にて実装されている。

### root

* root(options = {})

"/" に対するルーティングを設定する。

`match '/', { :as => :root, :via => :get }.merge!(options)`

という実装になってる。as に使用してるのが root なので helper は root_path のようになる。

### match

* match(path, options=nil)

ルーティングを作成する上で一番基本的なメソッド。
大くのメソッドが match のラッパになっている。

第1引数path にパスを指定する。
もっとも基本的な使い方は `to` オプションに対して、rackオブジェクトが `controller名#action` という指定をする。

使えるオプション

* action
* controller
* path
* module
* as
* via
* to
* on
* constraits
* defaults
* anchor
* format

これらのオプションは scope を設定しておくとデフォルト値にできる。

`path` オプションは pathのprefixになる。

`as` オプションは helper を生成する時の名前になる。

`module` オプションはコントローラの名前空間となる

`via` オプションはうけつけるHTTPメソッドを設定する。

`constraints` はpathにふくまれるパラメータに制約を設定できる。

`anchor` はデフォルトで true になっているオプションで false に設定すると path ではじまるパスにマッチするようになる。

## mount

* (app, options = nil)

Rackアプリケーションをとりこめる。

`at` オプションで path を指定する。

`as` オプションが指定されていない場合は、railtie_name メソッドを使い取得する。
それでも取得できない場合は、クラス名から生成します。

### default_url_options

Mapper が生成する RouteSet のインスタンスの defoult_url_options を設定します。
urlを生成する時のデフォルト値として使われるはず。

### with_default_scope

scope を付与した状態でルーティングを構築できます。

### has_named_route?

* has_named_route?(name)

name のルーティングがあるか確かめます。

ActionDispatch::Routing::Mapper::HttpHelpers
--------------------------------------------------------------------------------

HTTP メソッドに対応した get post patch put delete が実装されてる。
どれも match メソッドの via オプションが設定されるようになっているだけ。


ActionDispatch::Routing::Mapper::Scoping
--------------------------------------------------------------------------------

scope とスコープを使って作られてる namespace, constraints, controler, defaults も実装されている。

### scope

パラメータを設定した状態を維持できる機能。コンテキストを作る。
resources でネストしたりした際の情報の維持などにも使われる。

```ruby
scope as: 'hoge' do
  get :mogu, to: 'hoge#mogu'
end
```

と

```ruby
get :mogu, to: 'hoge#mogu', as: 'hoge'
```

が同じもののように動作する。

### controller

scope に controller オプションを設定する。

```ruby
controller 'hoge' do
  ...
end
```

は等価と言える。

```ruby
scope controller: 'hoge' do
  ...
end
```


### namespace

名前空間をつかったコントローラへのルーティングを支援する機能。
Hoge::MogusController への resourceを作る場合には

```ruby
namespace :hoge
  resources :mogu
end
```

のようになる。scopeで書き換えると

```ruby
scope path: :hoge, as: :hoge, module: :hoge, shallow_path: :hoge, shallow_prefix: :hoge do
  resources :mogu
end
```

となる模様。

### constraints

ルーティングへ制約を付与できる。
パラメータに対し、制約をかくこともできるし true, false を返す call メソッドを持つオブジェクトを渡すことも可能。
call メソッドが呼ばれる場合には、第1引数に request オブジェクトが渡される。

```ruby
constraints(id: /\d+\.\d+/) do
  resources :posts
end
```

のような使い方をする。この場合 id が 3.4 のような小数点をもつような形式である必要がある。

これも scope でかきなおせる。

```ruby
scope constraints: {id: /\d+\.\d+/} do
  resources :posts
end
```

### defaults

ルーティングに含まれるパラメータにデフォルト値を設定できる。

これもscopeでかきなおせる。
