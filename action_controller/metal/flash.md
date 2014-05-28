---
title: ActionController::Flash
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-08 revision 45877) [x86_64-darwin13.0]
```

```
bundle exec ruby -r action_pack -e 'puts ActionPack::VERSION::STRING'
4.1.1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.1.0/actionpack/lib/action_controller/metal/flash.rb)

基本は `Request#flash` の機能を使うだけ。
`ActionController::Flash#add_flash_type` を使用すると flash へのショートカットが作成される。
デフォルトでは alert, notice が登録されており `flash[:alert]` は alertで使える。

また `add_flash_type` をした場合は redirect_to する際にオプションで指定することで値を渡すこともできる。
