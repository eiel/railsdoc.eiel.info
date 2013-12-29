---
title: ActionDispatch::Routing::Inspector
---

```
$ ruby -v
ruby 2.1.0p0 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.2
```

* [ソースコード](https://github.com/rails/rails/blob/4-0-stable/actionpack/lib/action_dispatch/routing/inspector.rb)




ActionDispatch::Routing::RouteWrapper
--------------------------------------------------------------------------------

[SimpleDelegator](http://rurema.clear-code.com/2.1.0/class/SimpleDelegator.html)が利用されている。対応するメソッドがない場合はインスタンス生成時に渡したオブジェクトに処理が委譲される。

内部で委譲しているメソッド。

* requriments
* app

### endpoint

ルーティング先を示す文字列を返す模様。
普通であれば "controller#action" という形式になる。


### constraints

ルーティングに必要なパラメータを返す模様。
requirments から action と controller を排除したもの。


### rack_app

* rack_app(app = self.app)

引数はデフォルトで self.app を使うが変更が効くよう。
ただし、`@rack_app` にキャッシュされる。
ActionDispatch::Routing::Mapper::Constraints のインスタンスの場合、皮を向いて内部にいる app を取り出す。
ActionDispatch::Routing という接頭辞がつくクラスのオブジェクトだと nil を返す。ActionDispatch::Routing::Redirectのインスタンス の場合は例外。


### verb

名前から動詞を返すようだが…スーパークラスの source メソッドの返す文字列から $^ を削除したものを返す。

### path

名前からして path を返すようだが…スーパークラスの spec メソッドの返すオブジェクトを文字列にするだけ。

### name

スーパークラスの to_s を返す。

### regexp

ルーティングのための正規表現を作成。path から to_regexp するだけ。

### json_regexp

名前から推察すると JSON 用の正規表現を作るようだけどよくわからない。
regexp の結果を置換して正規表現を作成しなおしている。

### reqs

endpoint の情報に加えて constraints の情報を組合せて、リクエストに必要なものを表現する文字列を生成する。


### controller

コントローラ名を返す。動的な場合は :controller という文字列を返す。


### action

アクション名を返す。動的な場合は :action という文字列を返す。

### internal?

Rails に付属されている内部コントローラなのかを確認する。

### engine?

Rails Engine なのかを確認する。 routes メソッドをもつかどうかで判断できるようです。
