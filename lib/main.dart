import 'package:flutter/material.dart';

//メイン関数
void main() {
  final a = Column( //縦並びにする
    mainAxisSize: MainAxisSize.min, // Columnのサイズを中身に合わせる
    children: [
      Container(  //コンテナ要素
        color: Colors.black, //背景色
        width: 1000, //幅
        height: 100, //高さ
      ),
      SizedBox(height: 20), // 2つのコンテナ間にスペースを追加
      Container(
        color: Colors.red, //背景色
        width: 1000, //幅
        height: 100, //高さ
      ),
    ],
  );

  runApp(a);
}
