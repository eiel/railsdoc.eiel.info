---
title: ActionController::StanddardError
---

```
$ ruby -v
ruby 2.1.0p0 (2013-12-25 revision 44422) [x86_64-darwin13.0]
```

```
bundle exec ruby -r action_pack -e 'puts ActionPack::VERSION::STRING'
4.1.0.rc1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.0.rc1/actionpack/lib/action_controller/metal/exceptions.rb)

Controllerまわり各種エラーが定義されてる。

* ActionControllerError
* BadRequest < ActionControllerError
* RenderError < ActionControllerError
* RoutingError < ActionControllerError
* ActionController::UrlGenerationError < RoutingError
* NotImplemented < MethodNotAllowed
* UnknownController < ActionControllerError
* MissingFile < ActionControllerError
* SessionOverflowError < ActionControllerError
* UnknownFormat < ActionControllerError

が定義されてる

TODO グラフにしたい
