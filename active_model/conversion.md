---
title: ActiveModel::Conversion
---

```
$ ruby -v
ruby 2.1.4p265 (2014-10-27 revision 48166) [x86_64-darwin14.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0/activemodel/lib/active_model/conversion.rb)

to_hogehogeなメソッドが実装されている。

* to_model
* to_key
* to_param
* to_partial_path

が実装されている。

`to_model`はモデルオブジェクトと含まあないリストとかまとめて処理する時のためにあるだけっぽくselfを返す。
残りはURLやrenderに影響を受けるrailsのモデルとして重要なメソッドな気がする。

to_keyはURLで使用する`:id`の部分を作る値をつくる。リストを返す。

to_paramでto_keyでかえってきた値を文字列にする。
リストは`"-"`でjoinする。
ただし、永続化されていない場合はnilを返す。

to_partal_pathはrender時のファイル名を生成する。
