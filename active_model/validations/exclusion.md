---
title: ActiveModel::Validations::ExclusionValidator
---

```
$ ruby -v
ruby 2.1.4p265 (2014-10-27 revision 48166) [x86_64-darwin14.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0/activemodel/lib/active_model/validations/exclusion.rb)

範囲外の値であれば正常として判断してくれるバリデータ。
対象になるものとしては[InclusionValidator](/active_model/validations/inclusion)がある。

inオプションに範囲値やprocオブジェクト、シンボルを渡せる。
