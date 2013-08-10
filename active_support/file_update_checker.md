---
title: ActiveSupport::FileUpdateChecker
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

`active_support` で Autoload されています。

* [ソースコード](https://github.com/rails/rails/blob/master/activesupport/lib/active_support/file_update_checker.rb)

`ActiveSupport::FileUpdateChecker.new` で監視したいファイルを登録しておき、更新があった場合に実行したい処理をブロックで渡します。
`#execute_if_updated` メソッドを呼ぶことで更新があれば処理を実行できます。
更新されているかどうかだけを確認したい場合は `#update?` が使え、更新しているかどうか構わず実行する `#execute` メソッドがあります。
最初はオブジェクト作成時の状態と比較して更新したかどうかを判断します。
`#execute` を実行すると、次回以降はそこからの変化をあれば更新していることになります。

sample ディレクトリをチェックして実行する例

```ruby
require 'active_support/file_update_checker'

checker = ActiveSupport::FileUpdateChecker.new([], {'sample' => nil}) do
  puts 'updated!!'
end

`mkdir -p sample`

`touch sample/hoge.rb`
checker.execute_if_updated
# >> update!
checker.execute_if_updated
`touch sample/hoge.rb`
checker.execute_if_updated
# >> update!
```

ActiveSupport::FileUpdateChecker
--------------------------------------------------------------------------------

### #initilaize

* initialize(files, dirs={}, &block)

第1引数は確認したいファイルのリストを渡し、dirs には監視したいディレクトリがあれば Hash で設定します。
key がディレクトリで、 value 拡張子を限定するかどうかになります。
block には実行したい処理を書いて渡します。

### #updated?

監視ファイルの増減があれば直ちにtrueを返します。
そうでない場合は、該当ファイルの最後に更新した時刻と最後に `execute` メソッドを使用とした時刻で判断します。

### #execute

更新があったかどうかは確認せずに、コンストラクタで渡したブロックを実行する。
実行すると最後に実行した時刻と確認したファイルの一覧を @last_* に保存もします。

### #execute_if_updated

`#update?` が true を返す場合には `execute` を実行します。
実行すればTrue を、更新していなくて実行しない場合は false を返します。
