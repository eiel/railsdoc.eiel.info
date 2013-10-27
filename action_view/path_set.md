---
title: ActionView::PathSet
---

```
$ ruby -v
ruby 2.1.0dev (2013-09-22 trunk 43011) [x86_64-darwin12.5.0]
```

```
bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.0
```

* [ソースコード](https://github.com/rails/rails/blob/4-0-stable/actionpack/lib/action_view/path_set.rb)

view の保存先の一覧を記録するクラスで Enumerable がミックスインされている。
path は [ActienView::OptimizedFileSystemResolver](/action_view/template/resolver) クラスのインスタンスとなっている。

`find`, `find_all`, `exist?` というメソッドが追加されている。
登録されている path から目的のテンプレートファイルを探す。

ActionView::PathSet
--------------------------------------------------------------------------------

### paths

探索対象の path が保持されている。
Array のように振る舞うメソッドはここへ処理が委譲される。

### find

* find(path, prefixes = [], *args)

path に該当するテンプレートファイルを探す。引数 prefixes を追加すると paths に何か接頭辞をつけて探索することができる。返す情報は一番最初にみつかったもの。

### find_all

* find_all(path, prefixes = [], *args)

find はこの結果の先頭を返す。
paths をすべて探すわけではなく、paths の中の何れかひとつでもテンプレートファイルをみつけるとその path の範囲内のテンプレートの一覧が返される。
paths を複数設定している場合は注意が必要。

### exists?

* exists?(path, prefixes, *args)

なぜか prefixes が省略できない。
find_all が結果を返すか確認する。
