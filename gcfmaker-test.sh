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


ans="/tmp/$$-ans"
result="/tmp/$$-result"

# テスト1 正常動作の確認
GCFMAKER 81 36  > ${ans}
echo -e "81\n36" | ./gcfmaker.sh > ${result}
diff ${ans} ${result} || exit 1

echo OK!
