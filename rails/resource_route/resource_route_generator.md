---
title: Rails::Generators::ResourceRouteGenerator
---

```
$ ruby -v
ruby 2.1.3p242 (2014-09-19 revision 47630) [x86_64-darwin13.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0.beta2
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0.beta2/railties/lib/rails/generators/rails/resource_route/resource_route_generator.rb)

以下のようなルーティングを生成するジェネレータ。

```
namespace :admin do
  namespace :users do
    resources :products
  end
end
```

地道にwriteしてるだけの実装。
