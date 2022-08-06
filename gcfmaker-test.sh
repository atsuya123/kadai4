#!/bin/bash

#最大公約数を求める関数
GCFMAKER () {
  echo 最大公約数を求めたい2つの自然数を入力してください.
  DATA1=$1
  DATA2=$2
  r=$(($DATA1 % $DATA2))
  while [ 0 -lt $r ]
  do
    DATA1=$DATA2
    DATA2=$r
    r=$(($DATA1 % $DATA2))
  done
  echo 最大公約数:$DATA2
}

#パスを変数に設定
ans="/home/atsuya/tmp/$$-ans"
result="/home/atsuya/tmp/$$-result"
err="/home/atsuya/tmp/$$-error"

#テスト1 正常動作の確認（2つの入力が自然数）
GCFMAKER 81 36  > ${ans}
echo -e "81\n36" | ./gcfmaker.sh > ${result}
diff ${ans} ${result} || echo テスト1でエラー発生 >> ${err}

#テスト2 異常動作の確認（1つ目の入力が文字）
echo 自然数を入力してください。 > ${ans}
echo AAA | ./gcfmaker.sh 1> /dev/null 2> ${result}
diff ${ans} ${result} || echo テスト2でエラー発生 >> ${err}

#エラーの確認
if [ -f ${err} ]; then
  #エラーの出力
  cat ${err}
  #一時保存ファイルの削除
  rm /home/atsuya/tmp/$$-*
  exit 1
else
  #正常終了
  rm /home/atsuya/tmp/$$-*
  echo OK!
fi
