---
title: ActiveModel::Validations::Clusivity
---

```
$ ruby -v
ruby 2.1.4p265 (2014-10-27 revision 48166) [x86_64-darwin14.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0/activemodel/lib/active_model/validations/clusivity.rb)

[ExclusionValidator](/active_model/validations/exclusion_validator)や[InclusionValidator](/active_model/validations/inclusion_validator)で利用する`include?`メソッドを提供する。

`:in`または`:within`オプションに指定された値をもとに`include?`を機能させる。
また、このモジュールをインクルードしていると`include?`が利用できるようにオプションが指定されていないとバリデート時にArgumentErrorが発生する。
