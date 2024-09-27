import 'package:flutter/material.dart';
import 'login.dart';

class NewAccount extends StatelessWidget {
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
                    'アカウント作成',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            // その他のコンテンツをここに追加
            Container(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'ユーザID', // メアド入力フォーム
                ),
              ),
            ),

            Container(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'ユーザ名', // メアド入力フォーム
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'パスワード', // メアド入力フォーム
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'パスワード(確認用)', // メアド入力フォーム
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                child: const Text('アカウント作成'),
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
            Container(
              // Flutter1.22以降のみ
              child: TextButton(
                child: const Text('ログイン'),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.orange,
                ),
                onPressed: () {
                  print('ログインボタンが押されました');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          // （2） 実際に表示するページ(ウィジェット)を指定する
                          builder: (context) => Login()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
