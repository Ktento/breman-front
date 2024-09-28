import 'package:bremen_fe/new_account.dart';
import 'package:flutter/material.dart';

class AddFriend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 戻るボタンを含むコンテナ
            Container(
              padding: EdgeInsets.only(top: 20, left: 16, right: 16), // 上部余白を調整
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, size: 30),
                    onPressed: () {
                      Navigator.pop(context); // 前の画面に戻る
                    },
                  ),
                  SizedBox(width: 8), // 戻るボタンとテキストの間にスペースを追加
                  Text(
                    'フレンド追加',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),


            Container(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: 'ユーザID'), //メアド入力フォーム
              ),
            ),

            Container(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                child: const Text('フレンド追加'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15), // 角の丸みを調整
                  ),
                ),
                onPressed: () {}, //ログインボタンを押したときの処理
              ),
            ),
          ],
        ),
      ),
    );
  }
}
