---
title: ActionDispatch::HTTP::Cache
---

```
$ ruby -v
ruby 2.1.0dev (2013-09-22 trunk 43011) [x86_64-darwin12.5.0]
```

```
bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.1
```

* [ソースコード](https://github.com/rails/rails/blob/4-0-stable/actionpack/lib/action_dispatch/http/cache.rb)

Rack::Request と Rack::Response を拡張する機能が実装されている。
[ActionDispatch::Request](/action_dispatch/http/request) や [ActionDispatch::Response](/action_dispatch/http/response) などに include して利用される ActionDispatch::HTTP::Cache::Request や ActionDispatch::HTTP::Cache::Response が実装されています。


ActionDispatch::HTTP::Cache::Request
--------------------------------------------------------------------------------

### if_modified_since

指定日より更新されているか確認するのに利用するヘッダ。
`HTTP_IF_MODIFIED_SINCE`の値をチェックし、値があればその時刻を返す。ない場合はnilを返す。

### if_none_match

`HTTP_IF_NONE_MATCH`の値をチェックし、その値を返す。
値がない場合はnilを返す。
この値はスペースで区切られた etag が指定されており、コンテンツが変更されているかどうかに使う。

### if_none_match_etags

変更されているかどうか確認する etag の一覧を返す。
`if_none_match` メソッドの値を利用して、リストを返す。

### not_modified?

* not_modified?(modified_at)

引数 modified_at 以降に変更されているか確認する。

### etag_matches?

* etag_matches?(etag)

引数 etag がさすコンテンツが以前のコンテンツの etag と一致するか確認する。

### fresh?

* fresh?(response)

引数 resopose が最新のコンテンツか確認する。
last_modified も etag も不明の場合は無条件で false を返す。
どちらかが取得できるのであれば確認処理が行われる。


ActionDispatch::HTTP::Cache::Request
--------------------------------------------------------------------------------

### last_modified

最終更新日を返す。

### last_modified?

最終更新日の情報があるか確認する。

### last_modified=

* last_modified=(utc_time)

最終更新日を引数 utc_time に設定する。

### date

header に含まれる `Date` の値を返す。

### date?

header に `Date` という値があるか確認する。

### date=

* date=(utc_time)

header に `Date` という値を引数 utc_time で設定する。

### etag=

* etag=(etag)

@etag を引数 etag で設定する。
そのまま使うわけではなく key を展開してハッシュしなおす。

