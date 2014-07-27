---
title: Thor::Option
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-80 revision 45877) [x86_64-darwin13.0]
```

```
$ bundle exec  ruby -r thor/version -e 'puts Thor::VERSION'
0.19.1
```

* [ソースコード](https://github.com/erikhuda/thor/blob/master/lib/thor/parser/option.rb)

[Thor::Argument](/thor/parser/argument/) を継承している。

コマンドに渡すオプションを表わす。

Thor::Option
---

コンストラクトに渡せるオプションは

* :aliases
* :group
* :lazy_default
* :hide

追加されている。

required オプションのデフォルト値が false に設定される。

:group はキャピタライズされて保存される。

:aliases は配列にラップされて保存される。

### .parse

* parse(key, value)

key が配列の場合は2番目以降はエイリアスになる。
value から type は自動判別される。

### #switch_name

ダッシュがついた名前

### #human_name

ダッシュがついてない名前

### #usage

ヘルプ用のメッセージを作成する
