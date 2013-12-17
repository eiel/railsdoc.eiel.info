---
title: ActionDispatch::HTTP::Parameters
---

```
$ ruby -v
ruby 2.1.0dev (2013-09-22 trunk 43011) [x86_64-darwin12.5.0]
```

```
bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.1
```

* [ソースコード](https://github.com/rails/rails/blob/4-0-stable/actionpack/lib/action_dispatch/http/parameters.rb)

コントローラ内で params メソッドを提供するモジュール。
`@env["action_dispatch.request.parameters"]` に格納されていて、parameters の別名だったりすようだ。
他にも `path_parameters`, `symbolized_path_parameters`なども提供する。
`{'action' => 'my_action', 'controller' => 'my_controller'}` のような
Hash を返す。
