---
title: ActiveSupport::DescendantsTracker
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

`active_support` で Autoload されています。

* [ソースコード](https://github.com/rails/rails/blob/master/activesupport/lib/active_support/descendants_tracker.rb)

子孫追跡機。
子クラスや孫クラスの一覧を高速に取得できます。

取得したいクラスに`extend` して使います。
継承した時に情報を記録することで動作します。
`descendants` メソッドで子孫クラスの一覧を取得でき、`direct_descendants` メソッドで子クラスの一覧を取得できます。

```ruby
require 'active_support/descendants_tracker'

class Base
end

class Hoge1 < Base
end

class Hoge2 < Hoge1
end

# `extend` する
class Base
  extend ActiveSupport::DescendantsTracker
end

# `extend` する前の情報は取得できない
Base.descendants  # => []

class Mogu1 < Base
end

class Mogu2 < Mogu1
end

class Mogu3 < Mogu2
end

Base.descendants         # => [Mogu1, Mogu2, Mogu3]
Base.direct_descendants  # => [Mogu1]

# 記録の削除
ActiveSupport::DescendantsTracker.clear

Base.descendants         # => []
Base.direct_descendants  # => []
```

ActiveSupport::Descendants
--------------------------------------------------------------------------------

子孫を追跡したいクラスに `extend` して使う。
子孫を取得するには モジュールメソッドからでも、extend したクラスオブジェクトのインスタンスメソッドからでも取得できる。

### .direct_descendants

* direct_descendants(klass)

引数klass の子クラスの一覧を返す。
記録している情報を返すだけ。

### .descendants

* descendants(klass)

引数klass の子孫クラスの一覧を返す。
クラスごとに記録している情報を辿って収集して返す。

### .clear

記録している情報を破棄する。
[ActiveSupport::Dependencies](/active_support/dependencies) を利用している場合は、autoload したものであれば削除するようになっている。
その意図はまだよくわからない。

### .store_inherited

* store_inherited(klass, descendant)

引数klass の子クラスとして 引数descendant を加える

### #inherited

* inherited(base)

このモジュールを`extend` したクラスが継承された時に呼ばれるメソッド
`.stroe_inherited` を呼び出して、子クラスであることを記録する。

### #direct_descendants

レシーバの子クラスを一覧を返す。
`.direct_descendants` に self を渡して呼び出すだけ。

### descendants

レシーバの子孫クラスを一覧を返す。
`.descendants` に self を渡して呼び出すだけ。
