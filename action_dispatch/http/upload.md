---
title: ActionDispatch::HTTP::Upload
---

```
$ ruby -v
ruby 2.1.0dev (2013-09-22 trunk 43011) [x86_64-darwin12.5.0]
```

```
bundle exec ruby -r active_support -e 'puts ActiveSupport::VERSION::STRING'
4.0.1
```

ファイルが添付されているパラメータであった場合は ActionDispatch::HTTP::UploadedFile のインスタンスで表現される。
tempfile メソッドで添付されたファイルへと直接アクセスできるが、基本的な機能は delegate されているので read や rewind を直接できる。
ファイル名をUTf_8 にエンコードしたものは original_filenameから取得できる。
他には content_type, headers で mime_type と multipart request のヘッダが取得できる。
