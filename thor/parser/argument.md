---
title: Thor::Argument
---

```
$ ruby -v
ruby 2.1.2p95 (2014-05-80 revision 45877) [x86_64-darwin13.0]
```

```
$ bundle exec  ruby -r thor/version -e 'puts Thor::VERSION'
0.19.1
```

* [ソースコード](https://github.com/erikhuda/thor/blob/master/lib/thor/parser/argument.rb)

[Thor::Option](/thor/parser/option/) が継承している。

コマンドに渡る引数のを表す。ヘルプの生成に利用されたりする。

Thor::Argment
---

コンストラクタに渡せるオプションは

* :type
* :desc
* :required
* :default
* :banner
* :enum

がある。

type は デフォルトで :string に設定されます。

desc は @description に格納されます。

required はデフォルトで true になります。

default はデフォルト値になります。

banner はusageで文字列を作成する際の文字列になります。

enum は選択可能な値の一覧だと思われるけど、ここだけでは判断がつかない。

### VALID_TYPES

type に指定できる値の一覧

* numeric
* hash
* array
* string
