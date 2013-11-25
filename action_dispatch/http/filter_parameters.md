---
title: ActionDispatch::HTTP::FilterParameters
---

```
$ ruby -v
ruby 2.1.0dev (2013-09-22 trunk 43011) [x86_64-darwin12.5.0]
```

```
bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.1
```

* [ソースコード](https://github.com/rails/rails/blob/4-0-stable/actionpack/lib/action_dispatch/http/filter_parameters.rb)

[ActionDispatch::Request](/action_dispatch/http/response) include されている。
リクエストに含まれる機密情報をfilterできるようにする機能を提供するモジュール。

`action_dispatch.parameter_filter` に値を保存している。
機能自体は [ParameterFilterクラスa](/action_dispatch/http/parameter_filter)に実装されており、このラッパになっている。


ActionDispatch::HTTP::FilterParameters
--------------------------------------------------------------------------------

### filtered_parameters

フィルタされたパラメータを返す。
戻り値は Hash。

### filtered_env

フィルタされた環境変数を返す。
戻り値は Hash。

### filtered_path

フィルタされたpathを返す。クエリストリングをfilterするために使う。
