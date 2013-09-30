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
