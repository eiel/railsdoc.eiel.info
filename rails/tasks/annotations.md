---
title: task annotationns
---

```
$ ruby -v
ruby 2.1.4p265 (2014-10-27 revision 48166) [x86_64-darwin14.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0.beta4
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0.beta4/railties/lib/rails/tasks/annotations.rake)

TODO や FIXME などの含むコメントを発見する。

`rake notes` で [SourceAnnotationExtractor](rails/source_annotation_extractor)をつかって`OPTIMIZE|FIXME|TODO`でソースコードの検索を行う。

他にも

* `rake notes:optimize`
* `rake notes:note`
* `rake notes:fixme`
* `rake notes:custom`

が使える。

notesカスタムは環境変数 ANNOTATION で調整できる。
