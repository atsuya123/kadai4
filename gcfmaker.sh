#!/bin/bash

#最大公約数を求めるシェルスクリプト
#  2つの自然数を受け取る。
#  ユークリッドの互除法により、最大公約数を求める。
#  結果を出力する。

#入力された値の検証関数
VALIDATION () {
  #入力が10桁以内であるかを検証
  if [ 10 -lt "${#1}" ]; then
    echo ERROR：10桁以内の自然数を入力してください。 1>&2
    exit 1
  fi
  #自然数であるかを確認
  if !(expr "$1" : "[0-9]*$" >&/dev/null) || test 0 -eq $1;then
    echo ERROR：自然数を入力してください。 1>&2
    exit 1
  fi
  #先頭に0がついていないかを確認
  t=`echo "$1" | sed 's/0*\([0-9]*[0-9]$\)/\1/g'`
  if [ "${#t}" -ne "${#1}" ]; then
    echo ERROR：先頭に0をつけないでください。 1>&2
    exit 1
  fi
}

#直接引数が渡されていないかを確認
if [ "$1" ]; then
  echo WARNING：直接引数を入力せず、次の指示に従ってください。
fi

echo 最大公約数を求めたい2つの自然数を入力してください。

#1つ目の自然数
read -p "1つ目の自然数：" DATA1
#入力された値の検証
VALIDATION "$DATA1"

#2つ目の自然数
read -p "2つ目の自然数：" DATA2
#入力された値の検証
VALIDATION "$DATA2"

#ユークリッドの互除法
r=$(($DATA1 % $DATA2))
while [ 0 -lt $r ]
do
  DATA1=$DATA2
  DATA2=$r
  r=$(($DATA1 % $DATA2))
done

#結果の出力
echo 最大公約数:$DATA2
