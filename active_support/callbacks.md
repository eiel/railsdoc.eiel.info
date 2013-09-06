---
title: ActiveSupport::Callbacks
---

試した環境

```
$ ruby -v
ruby 2.0.0p247 (2013-06-27 revision 41674) [x86_64-darwin12.4.0]
```

```
$ bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.0
```

* [ソースコード](https://github.com/rails/rails/blob/master/activesupport/lib/active_support/callbacks.rb)

callback を登録できるようにします。
利用には `ActiveSupport::Callbacks` をミックスインして `define_callback` を利用してコールバックを登録します。
callback には :before, :after, :around があります。
callback は `run_callback name` に対し挿入されます。

```ruby
require 'active_support/callbacks'

class Base
  include ActiveSupport::Callbacks
  define_callbacks :save

  def save
    puts 'before save'
    run_callbacks :save do
      puts 'save'
    end
    puts 'after save'
  end
end

class Child < Base
  set_callback :save, :before do
    puts 'saving'
  end

  set_callback :save, :after do
    puts 'saved'
  end
end

Child.new.save

# > before save
# > saving
# > save
# > saved
# > after save
```
