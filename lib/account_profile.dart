import 'package:flutter/material.dart';

class AccountProfile extends StatelessWidget {
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
                    'プロフィール',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            // その他のコンテンツをここに追加
            Container(
              color: const Color.fromARGB(109, 40, 255, 90),
              width: MediaQuery.of(context).size.width, // 画面の幅に合わせる
              height: 300,
            ),
            // ボタンコンテナ
            Container(
              color: const Color.fromARGB(108, 40, 158, 255),
              child: ElevatedButton(
                onPressed: () {}, // ログインボタンを押したときの処理
                child: const Text('アカウントを編集'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  minimumSize: Size(120, 30), // ボタンの最小サイズを指定
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7), // 角の丸みを調整
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
