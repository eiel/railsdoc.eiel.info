---
title: ActiveModel::Naming
---

```
$ ruby -v
ruby 2.2.0p0 (2014-12-25 revision 49005) [x86_64-darwin14]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0/activemodel/lib/active_model/naming.rb)

クラス名からいろんな名前をつくれる。複数形だったり人間向けのものだったり、テールブル名だったり。

`extend ActiveModel::Naming`するだけで使える。
model_nameというメソッドが追加されて、これはActiveModel::Nameのインスタンスとなる。
実際に名前をつくるのはこのクラスとなる。

いろんなところでこのmodel_nameを取り出してなんとかする感じとなる。
