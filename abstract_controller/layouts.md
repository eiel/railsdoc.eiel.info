---
title: AbstractController::Layouts
---

```
$ ruby -v
ruby 2.1.0dev (2013-09-22 trunk 43011) [x86_64-darwin12.5.0]
```

```
bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.0
```

* [ソースコード](https://github.com/rails/rails/blob/4-0-stable/actionpack/lib/abstract_controller/layouts.rb)

[AbstractController::Rendering](/abstract_controller/rendering) をミックスインしている。
コントローラでViewで使うlayoutが指定できるようになる。

動的に _layout というメソッドを書き換えるような仕組みになっている。
_normalize_options に割り込み options[:layout] を勝手に設定することで動作する。
