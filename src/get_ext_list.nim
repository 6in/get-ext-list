import os
import tables
import algorithm
import future

type
  ExtInfo = tuple[count: int, size: BiggestInt]

proc get_ext_list_impl3(startPath:string): Table[string,ExtInfo] =
  result = initTable[string,ExtInfo]()

  # 再帰で探索
  for f in startPath.walkDirRec :
    if f.existsFile :
      let (_,_,ext) = f.splitFile
      var ext2 = ext
      # 拡張子なしもカウントする
      if ext == "" :
        ext2 = "noext"
      # 既に格納されているか確認
      if result.contains(ext2) == false :
        result[ext2] = (count: 0,size: 0'i64 )
      if ext2 == "noext" :
        echo "NOEXT:" & f
      # ファイルサイズを取得
      let len = getFileSize(f)      
      let extInfo:ExtInfo = result[ext2]
      result[ext2] = ( count: extInfo.count + 1 , size: extInfo.size + len) 

# メイン関数
proc main(args:seq[string]):int =
  # メイン処理
  result = 1
  # 対象パスを特定(対象フォルダを１つだけ指定)
  # 対象パスがない場合は、カレントディレクトリを検索対象とする
  let path =
    if args.len == 1: args[0]
    else: "."

  # ディレクトリチェック
  if path.existsDir == false :
    echo "directory(",path,") is not exists"
    # プログラム終了
    return

  # フォルダを探索し、拡張子と頻度を取得
  #let ret = get_ext_list_impl(path) 
  #let ret = get_ext_list_impl2(path) 
  let ret = get_ext_list_impl3(path) 

  # 内包表記で、キー一覧を取得
  let keys = lc[ k | (k <- ret.keys), string ]

  # ヘッダーを表示
  echo "ext\tcount\tsize"

  # キーをソートして、カウンタを表示する
  for k in keys.sortedByIt(it):
    echo k,"\t",ret[k].count,"\t",ret[k].size

  # main関数の戻り値
  result = 0

when isMainModule:
  # 引数を取得
  let args = commandLineParams()
  # メイン関数を実行
  quit(main(args))
