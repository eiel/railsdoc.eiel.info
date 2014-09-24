---
title: Rails::Generators::Css::Generator::AssetsGenerator
---

```
$ ruby -v
ruby 2.1.3p242 (2014-09-19 revision 47630) [x86_64-darwin13.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0.beta1
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0.beta1/railties/lib/rails/generators/active_model.rb)

ActiveModelをつかったコードの文字列を生成するためのジェネレータ用のヘルパー。
コンストラクタの第1引数のnameには、変数名を指定する。

例

```ruby
builder = ActiveRecord::Generators::ActiveModel.new "@foo"
#   builder.save # => "@foo.save"
```

クラスメソッドと用意されている`.all`と`.find`については、クラス名を与える。

```ruby
ActiveRecord::Generators::ActiveModel.find(Foo, "params[:id]")
# => "Foo.find(params[:id])"
```
