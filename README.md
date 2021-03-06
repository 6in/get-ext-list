# 概要

フォルダを探索し、拡張子一覧を表示します。

## ビルド

以下のコマンドでビルドし、作成された ```bin/get_ext_list``` をPATHの通ったフォルダに配置して下さい
```
nimble install
```

## 起動

get_ext_list [options] folder

* --ignore
  * 無視するフォルダを指定します
  * 複数のフォルダを指定するとｋは、カンマ区切りでフォルダを列挙します
```
# .svnと.gitを無視する
get_ext_list --ignore=.svn,.git /file/or/path
```

* folder
  * フォルダを指定します
  * 省略した場合には、カレントディレクトリ配下を探索します

## 出力結果

結果は、TSVにて表示されます

| 項目名 | 内容 |
| ----- | ---- |
| ext   | 拡張子名     | 
| count   | 存在した個数     | 
| size   | ファイルサイズの合計  | 

実行サンプル
```
ext     count   size
.c      14      837574
.cfg    1       61
.json   3       7258
.md     1       0
.nim    3       3489
.nimble 1       451
.o      14      551536
.sample 9       14788
noext   57      723855
```
