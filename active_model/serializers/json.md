---
title: ActiveModel::Serializers::JSON
---

```
$ ruby -v
ruby 2.1.4p265 (2014-10-27 revision 48166) [x86_64-darwin14.0]
```

```
$ bundle exec ruby -r rails -e 'puts Rails.version'
4.2.0.rc3
```

* [ソースコード](https://github.com/rails/rails/blob/v4.2.0.rc3/activemodel/lib/active_model/serializers/json.rb)

このモジュールをincludeすると、`as_json`メソッドと`from_json`メソッドが提供される。
`as_json`はJSON形式にする前のhashへの変換をする。
`from_json` はJSON文字列を読み込みしてattributesを設定する。

利用にはattributesが提供されている必要がある。

## ActiveModel::Serializers::JSON

### #as_json

:root オプションを指定するとクラス名のキーに属性が設定されたものになる。
`.include_root_in_json`でデフォルト設定をすることもできる。

```ruby
require 'active_model'

class Hoge
  include ActiveModel::Serializers::JSON

  attr_accessor :goro, :mogu

  def attributes=(hash)
    hash.each do |key, value|
      send("#{key}=", value)
    end
  end

  def attributes
    instance_values
  end
end

hoge = Hoge.new
h.goro = 1
h.mogu = 2
h.as_json              # => {"goro"=>1, "mogu"=>2}
h.as_json(root: true)  # => {"hoge"=>{"goro"=>1, "mogu"=>2}}

Hoge.include_root_in_json = true
h.as_json              # => {"hoge"=>{"goro"=>1, "mogu"=>2}}
```

### #from_json

JSONから属性を設定できる。

`.include_root_in_json`の値の影響をうける。
第2引数で`.include_root_in_json`の値を無視できる。

```ruby
require 'active_model'

class Hoge
  include ActiveModel::Serializers::JSON

  attr_accessor :goro, :mogu

  def attributes=(hash)
    hash.each do |key, value|
      send("#{key}=", value)
    end
  end

  def attributes
    instance_values
  end
end

json = {goro: 1}.to_json
Hoge.new.from_json(json).as_json # => {"goro"=>1}

json = {hoge:{ goro: 1}}.to_json
Hoge.new.from_json(json, true).as_json # => {"goro"=>1}
```
