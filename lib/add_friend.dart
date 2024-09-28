import 'package:flutter/material.dart';

class AddFriend extends StatelessWidget {
  // TextEditingControllerを定義
  final TextEditingController _userIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 戻るボタンを含むコンテナ
            Container(
              padding: EdgeInsets.only(top: 20, left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, size: 30),
                    onPressed: () {
                      Navigator.pop(context); // 前の画面に戻る
                    },
                  ),
                  SizedBox(width: 8),
                  Text(
                    'フレンド追加',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            // ユーザID入力フォーム
            Container(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _userIdController, // TextEditingControllerをTextFieldに接続
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'ユーザID',
                ),
              ),
            ),

            // フレンド追加ボタン
            Container(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                child: const Text('フレンド追加'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  // TextFieldの内容を取得
                  String userId = _userIdController.text;
                  print('ユーザID: $userId');
          
                  // ここにフレンド追加のロジックを追加
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
