---
title: ActiveSupport::JSON
---

試した環境

```
$ ruby -v
ruby 2.1.0dev (2013-09-22 trunk 43011) [x86_64-darwin12.5.0]
```

```
$ bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.0
```

基本的には json.rb 機能をそのまま使います。
追加機能を ActiveSupport::JSON に実装しています。

encode の必要な機能は `ActiveSupport::Encoding::Encoder` に実装されています。
必要な処理は delegate されているので ActiveSupport::JSON からもアクセス可能です。

また、さまざまなクラスに `#as_json` メソッドが追加されています。
これは JSON に変換可能な Ruby オブジェクトのみで構成されたデータに変換します。
Object クラスは `#to_hash` できるのであれば `#to_hash` しようとします。
そうでない場合は`#instance_values`を使います。
自作クラスの場合は `as_json` を上書きすることで自由に制御できます。
上書きする場合には `encode_json`が実装されているオブジェクトのみで構成させます。
他のオブジェクトの `as_json` を呼びだす場合は options を渡すようにします。
実際に JSON への変換は `encode_json` が担います。

実装されているクラスは

* TrueClass
* FalseClass
* NilClass
* String
* Array
* Hash

です。

* [ソースコード](https://github.com/rails/rails/blob/4-0-stable/activesupport/lib/active_support/json.rb)


ActiveSupport::JSON
--------------------------------------------------------------------------------

### ActiveSupprt.parse_json_times

モジュール変数です。
JSON レコードする時に 時刻オブジェクトをparse するかどうかを設定できます。
デフォルトはnilです。

### .decode

* decode(json, options = {})

引数 `json` をデコードしてRubyのオブジェクトに変換します。
JSONライブラリのparser を経由して `ActiveSupport.parse_json_times` が true であれば JSON 内の 日付として扱えるもののをDateTimeへの変換を試みます。

* [ソースコード](https://github.com/rails/rails/blob/master/activesupport/lib/active_support/json/decoding.rb)

### .encode

* [ソースコード](https://github.com/rails/rails/blob/master/activesupport/lib/active_support/json/encoding.rb#L34-L36)


ActiveSupport::Encoding::CircularReferenceError
--------------------------------------------------------------------------------

オブジェクトが循環参照している場合に発生する例外。

ActiveSupport::Encoding::Encoder
--------------------------------------------------------------------------------

Ruby オブジェクトヲJSON への変換する責務を担うクラスです。


# #initialize

* initialize(options = nil)

引数 options は `as_json` メソッドに伝搬され利用することができます。


# #encode

* encode(value, use_options = true)

引数`value` をJSONに変換します。
引数`use_options` を false にすることでコンストラクタに渡した options を無視することもできます。

# #as_json

* as_json(value, use_options = true)

引数`value` をJSONへ変換前のRubyオブジェクトに変換します。
エンコードしたものをデコードした場合と同じ構成になります。
引数`use_options`を false にすることでコンストラクタに渡した options を無視することもできます。

# #escape

* escape(string)

ActiveSupport::Encoding.escape へのエイリアス。

# .use_standard_json_time_format

true に設定すると 時刻のフォーマットが ISO 8601 になります。
デフォルトで true です

# .encode_big_decimal_as_string

true に設定していると BigDecimal は 文字列で変換されます。
デフォルトで true です。

# .escape_html_entities_in_json

true に設定していると JSON 内で htmlをエスケープします。
デフォルトで true です。

# .escape

* escope(string)

エスケープします。強制的にUTF-8なります。
