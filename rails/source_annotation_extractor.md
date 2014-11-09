---
title: SourceAnnotationExtractor
---

```
$ ruby -v
ruby 2.1.4p265 (2014-10-27 revision 48166) [x86_64-darwin14.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0.beta4
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0.beta4/railties/lib/rails/source_annotation_extractor.rb)

`rake notes` や `rake notes:*` 系rakeの中身。
TODO や FIXME といったコメントを見付けて列挙してくれる。

環境変数`SOURCE_ANNOTATION_DIRECTORIES`をカンマ区切りで探索するディレクトリを追加できる。

SourceAnnotationExtractor::AnnotationRails
---

line, :tag, :text のみっつのメンバをもった構造体。
みつけたアノテーションを表す。

### .directories

探索するディレクトリの一覧を返す。デフォルトでほ app config db lib test の5つから検索。
環境変数`SOURCE_ANNOTATION_EXTRACTOR`で追加できる。

### .extensions

対象とするファイルの拡張子とコメントの形式を含んだHashを返す。
`register_extensions`メソッドを使い追加できる。

### #to_s

* to_s(options={})

出力するための文字列を返す。
opniotns[:tag]が指定されているとタグの情報を付与する。

SourceAnnotationExtractor
---

### .enumerate

* .enumerate(tag, options={})

このクラスのエントリーポイント。
指定されたタグを含む行を探して表示する。

### #initialize

* find(dirs)

複数tagを指定したい場合は `hoge|goro` のように正規表現を指定する。

### find

* find(dir)

fileをキーにバリューに AnnotationのリストにしたHashを返す。

### find_in

* find_in(dir)

find メソッドのひとつのディレクトリに対し動作する部分。

### #extract_annotations_from

* extract_annotations_from(file, pattern)

ファイルから annotationを探す処理。


### display

* display(results, options={})

find の結果を画面に出力するメソッド。
