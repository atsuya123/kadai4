#!/bin/bash

#最大公約数を求める関数
GCFMAKER () {
  echo 最大公約数を求めたい2つの自然数を入力してください。
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
echo ERROR：自然数を入力してください。 > ${ans}
echo AAA | ./gcfmaker.sh 1> /dev/null 2> ${result}
diff ${ans} ${result} || echo テスト2でエラー発生 >> ${err}

#テスト3 異常動作の確認（2つ目の入力が文字）
echo ERROR：自然数を入力してください。 > ${ans}
echo -e "81\nAAA" | ./gcfmaker.sh 1> /dev/null 2> ${result}
diff ${ans} ${result} || echo テスト3でエラー発生 >> ${err}

#テスト4 異常動作の確認（どちらの入力も文字）
echo ERROR：自然数を入力してください。 > ${ans}
echo -e "AAA\nAAA" | ./gcfmaker.sh 1> /dev/null 2> ${result}
diff ${ans} ${result} || echo テスト4でエラー発生 >> ${err}

#テスト5 異常動作の確認（1つ目の入力が負の数）
echo ERROR：自然数を入力してください。 > ${ans}
echo -1 | ./gcfmaker.sh 1> /dev/null 2> ${result}
diff ${ans} ${result} || echo テスト5でエラー発生 >> ${err}

#テスト6 異常動作の確認（2つ目の入力が負の数）
echo ERROR：自然数を入力してください。 > ${ans}
echo -e "81\n-1" | ./gcfmaker.sh 1> /dev/null 2> ${result}
diff ${ans} ${result} || echo テスト6でエラー発生 >> ${err}

#テスト7 異常動作の確認（どちらの入力も負の数）
echo ERROR：自然数を入力してください。 > ${ans}
echo -e "-1\n-1" | ./gcfmaker.sh 1> /dev/null 2> ${result}
diff ${ans} ${result} || echo テスト7でエラー発生 >> ${err}

#テスト8 異常動作の確認（1つ目の入力が小数）
echo ERROR：自然数を入力してください。 > ${ans}
echo 0.1 | ./gcfmaker.sh 1> /dev/null 2> ${result}
diff ${ans} ${result} || echo テスト8でエラー発生 >> ${err}

#テスト9 異常動作の確認（2つ目の入力が小数）
echo ERROR：自然数を入力してください。 > ${ans}
echo -e "81\n0.1" | ./gcfmaker.sh 1> /dev/null 2> ${result}
diff ${ans} ${result} || echo テスト9でエラー発生 >> ${err}

#テスト10 異常動作の確認（どちらの入力も小数）
echo ERROR：自然数を入力してください。 > ${ans}
echo -e "0.1\n0.1" | ./gcfmaker.sh 1> /dev/null 2> ${result}
diff ${ans} ${result} || echo テスト10でエラー発生 >> ${err}

#テスト11 異常動作の確認（1つ目の入力が記号）
echo ERROR：自然数を入力してください。 > ${ans}
echo % | ./gcfmaker.sh 1> /dev/null 2> ${result}
diff ${ans} ${result} || echo テスト11でエラー発生 >> ${err}

#テスト12 異常動作の確認（2つ目の入力が記号）
echo ERROR：自然数を入力してください。 > ${ans}
echo -e "81\n%" | ./gcfmaker.sh 1> /dev/null 2> ${result}
diff ${ans} ${result} || echo テスト12でエラー発生 >> ${err}

#テスト13 異常動作の確認（どちらの入力も記号）
echo ERROR：自然数を入力してください。 > ${ans}
echo -e "%\n%" | ./gcfmaker.sh 1> /dev/null 2> ${result}
diff ${ans} ${result} || echo テスト13でエラー発生 >> ${err}

#テスト14 異常動作の確認（1つ目の入力が10桁より多い）
echo ERROR：10桁以内の自然数を入力してください。 > ${ans}
echo 12345678901 | ./gcfmaker.sh 1> /dev/null 2> ${result}
diff ${ans} ${result} || echo テスト14でエラー発生 >> ${err}

#テスト15 異常動作の確認（2つ目の入力が10桁より多い）
echo ERROR：10桁以内の自然数を入力してください。 > ${ans}
echo -e "81\n12345678901" | ./gcfmaker.sh 1> /dev/null 2> ${result}
diff ${ans} ${result} || echo テスト15でエラー発生 >> ${err}

#テスト16 異常動作の確認（どちらの入力も10桁より多い）
echo ERROR：10桁以内の自然数を入力してください。 > ${ans}
echo -e "12345678901\n12345678901" | ./gcfmaker.sh 1> /dev/null 2> ${result}
diff ${ans} ${result} || echo テスト16でエラー発生 >> ${err}

#テスト17 異常動作の確認（1つ目の入力の先頭に0がついている）
echo ERROR：先頭に0をつけないでください。 > ${ans}
echo 011 | ./gcfmaker.sh 1> /dev/null 2> ${result}
diff ${ans} ${result} || echo テスト17でエラー発生 >> ${err}

#テスト18 異常動作の確認（2つ目の入力の先頭に0がついている）
echo ERROR：先頭に0をつけないでください。 > ${ans}
echo -e "81\n011" | ./gcfmaker.sh 1> /dev/null 2> ${result}
diff ${ans} ${result} || echo テスト18でエラー発生 >> ${err}

#テスト19 異常動作の確認（どちらの入力の先頭にも0がついている）
echo ERROR：先頭に0をつけないでください。 > ${ans}
echo -e "011\n011" | ./gcfmaker.sh 1> /dev/null 2> ${result}
diff ${ans} ${result} || echo テスト19でエラー発生 >> ${err}

#テスト20 異常動作の確認（1つ目の入力がない）
echo ERROR：自然数を入力してください。 > ${ans}
echo | ./gcfmaker.sh 1> /dev/null 2> ${result}
diff ${ans} ${result} || echo テスト20でエラー発生 >> ${err}

#テスト21 異常動作の確認（2つ目の入力がない）
echo ERROR：自然数を入力してください。 > ${ans}
echo -e "81\n" | ./gcfmaker.sh 1> /dev/null 2> ${result}
diff ${ans} ${result} || echo テスト21でエラー発生 >> ${err}

#テスト22 異常動作の確認（どちらの入力もない）
echo ERROR：自然数を入力してください。 > ${ans}
echo -e "\n" | ./gcfmaker.sh 1> /dev/null 2> ${result}
diff ${ans} ${result} || echo テスト22でエラー発生 >> ${err}

#エラーの確認
if [ -f ${err} ]; then
  echo --------------------------------------------------------
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
