---
title: Rails::Generators::NamedBase
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-80 revision 45877) [x86_64-darwin13.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.1.4
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0.beta1/railties/lib/rails/generators/named_base.rb)

名前から様々な名前を生成できるようにしているGenerator。
名前を基準にファイルやクラスを生成したい場合に基底クラスにしているっぽい。たぶん。
