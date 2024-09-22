import 'package:flutter/material.dart';

// メイン関数
void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.white,
      body: Align(
        alignment: Alignment.topCenter, // 上揃え
        child: Column(
          // 縦並びにする
          mainAxisSize: MainAxisSize.min, // Columnのサイズを中身に合わせる
          children: [
            Container(
              // コンテナ要素
              color: const Color.fromARGB(135, 182, 179, 179),
              width: 1000, // 幅
              height: 50, // 高さ
              child: Row(
                // 横並びにする
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft, // 左揃えに設定
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0), // 左に余白を追加
                        child: Text(
                          'ホーム',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold, // 太字に設定
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0), // 右に余白を追加
                    child: IconButton(
                      icon: Icon(Icons.account_circle, size: 30), // アカウントアイコン
                      onPressed: () {
                        // アイコンボタンが押された時の処理
                        print('アカウントボタンが押されました');
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20), // 2つのコンテナ間にスペースを追加
            Container(
              color: Colors.red, // 背景色
              width: 1000, // 幅
              height: 100, // 高さ
            ),
          ],
        ),
      ),
    ),
  ));
}
