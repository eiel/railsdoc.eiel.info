---
title: Rails::Engine::Commands
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-80 revision 45877) [x86_64-darwin13.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0.beta1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0.beta1/railties/lib/rails/engine/commands.rb)

engin に登録されている generate を使用するための部分。
Rails::Generator.name_space を Engine がもっているものと差し替えることで実現する。
