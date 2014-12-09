---
title: Rails::Deprecation
---

```
$ ruby -v
ruby 2.1.4p265 (2014-10-27 revision 48166) [x86_64-darwin14.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0.rc1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0.rc1/railties/lib/rails/deprecation.rb)

Rails::DeprecatedConstant.deprecateを提供する。
第1引数にdepracteにする定数を指定する。第2引数は代わり使用できる情報を提供する。
