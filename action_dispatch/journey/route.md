---
title: ActionDispatch::Journey::Route
---

```
$ ruby -v
ruby 2.1.0p0 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -r action_pack -e 'puts ActionPack::VERSION::STRING'
4.0.2
```

* [ソースコード](https://github.com/rails/rails/blob/4-0-stable/actionpack/lib/action_dispatch/journey/rout.rb)

このクラスのインスタンスは[ActionDispatch::Joureny::Routes](action_dispatch/journey/routes) の1要素にになります。
Routes は制約を含めた上で request がマッチするかどうかを判定する機能をもってるところがポイントになりそう。

読取可能なフィールドは

* app
* path
* defaults
* name
* constraints,conditions

優先度である precedence が設定でき、デフォルトは0に設定されている。
routes 側で設定されます。

path は [ActionDispatch::Journey::Path::Pattern](action_dispatch/journey/path/pattern) のインスタンスでないかと思われる。

### ast

pash の ast を取得して Nodes::Terminal にマッチするものには memo に self を追加して返す。まだよくわからない。

### requirements

path の requirments に defaults をマージして、何もはいってないものがあれば、そのキーを返す。

### segments

path の name を返す

### required_keys

require_parts と required_defaluts.keys を合わせたリストを返す。

### score

* score(constraints)

制約や必須項目があると高いスコアがでる。よくわかってない。


### parts

segments の結果をすべてシンボルにしたリストを返す

segments_keys でも同じ結果を返す。

### format

* format(path_options)

Vister::Formatter のインスタンスを返す。

### optimized_path

Visitors::OptimizedPath のインスタンスを返す。

### optional_parts

path.optional_names をすべてシンボル化した結果を返す。
無くてもよい parts。

### required_parts

path.required_names をすべてシンボル化した結果を返す。
必須の parts。

### required_default?

*  required_default?(key)

key が デフォルト値が必要か確認する

### required_defaults

デフォルト値が必要な項目の一覧を返す。


### dispatcher?

app が Routing::RouteSet::Dispatcher かどうか確認する

### matches?

* matches?(request)

request がこのルートにマッチするか確認する。

### ip

ipの制約があればそれを返す。

### verb

request method に制約があればそれを返す。
