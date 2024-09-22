import 'package:flutter/material.dart';

//メイン関数
void main() {
  final a = Align(
    alignment: Alignment.topCenter, // 画面の上に配置
    child: Container(
      color: Colors.black, //コンテナの背景色を黒色に設定
      width: 1000, //幅
      height: 100, //高さ
    ),
  );

  runApp(a);//ああああ
}
