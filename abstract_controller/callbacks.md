---
title: AbstractController::Callbacks
---

```
$ ruby -v
ruby 2.1.0dev (2013-09-22 trunk 43011) [x86_64-darwin12.5.0]
```

```
bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.0
```

* [ソースコード](https://github.com/rails/rails/blob/4-0-stable/actionpack/lib/abstract_controller/callbacks.rb))

Controller に before_action, after_action, around_action といったフィルター機能を提供するモジュール。
[ActiveSupport::Callbacks](/active_support/callbacks) を使い実装している。
process_action に対する callback を作成して、これを扱いやすくしています。

before_action は `response_body` が true と見なせる状態であれば は後続のアクションやフィルタは実行されなくなります。
after_action に関しては、関係ありません。

```ruby
require 'abstract_controller'
require 'active_support/callbacks'

class HogeController < AbstractController::Base
  include AbstractController::Callbacks

  before_action :goro_filter
  before_action :last_filter

  after_action :after_filter

  # action
  def hoge
    self.response_body = "hoge"
  end

  private

  def goro_filter
    self.response_body = "goro"
  end

  def last_filter
    self.response_body = "last"
  end
end

controller = HogeController.new
controller.process('hoge')
# goro_filter しか実行されない
controller.response_body # => "goro"
```

AbstarctController::Callbacks
--------------------------------------------------------------------------------

I以下のメソッドが追加されます。

* before_action
* prepend_before_action
* skip_before_action
* append_before_action
* after_action
* prepend_after_action
* skip_after_action
* append_after_action
* around_action
* prepend_around_action
* skip_around_action
* append_around_action
