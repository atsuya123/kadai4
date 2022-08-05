#!/bin/bash

echo 最大公約数を求めたい2つの自然数を入力してください.

#1つ目の自然数を受け取る。
read -p "1つ目の自然数：" DATA1
#入力された値が自然数でなければ、エラーを出力して処理を終了する。
if !(expr "$DATA1" : "[0-9]*$" >&/dev/null) || test 0 -eq $DATA1;then
  echo 自然数を入力してください. 1>&2
  exit 1
fi

#2つ目の自然数を受け取る。
read -p "2つ目の自然数：" DATA2
if !(expr "$DATA2" : "[0-9]*$" >&/dev/null) || test 0 -eq $DATA2;then
  echo 自然数を入力してください。 1>&2
  exit 1
fi

#ユークリッドの互除法
r=`expr $DATA1 % $DATA2`
while [ 0 -lt $r ]
do
  DATA1=$DATA2
  DATA2=$r
  r=`expr $DATA1 % $DATA2`
done

echo 最大公約数:$DATA2
