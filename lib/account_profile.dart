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
              padding: const EdgeInsets.all(16.0),
              color: const Color.fromARGB(119, 0, 0, 0),
              width: MediaQuery.of(context).size.width, // 画面の幅に合わせる
              height: 250, // 高さ
              alignment: Alignment.center, // ボタンを中央に配置
              child: SizedBox(
                width: 250,  // ボタンの幅
                height: 30, // ボタンの高さ
                child: ElevatedButton(
                  child: const Text('アカウント情報を編集'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange, // 背景色
                    foregroundColor: Colors.white, // 文字色
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5), // 角の丸みを調整
                    ),
                  ),
                  onPressed: () {
                    // ボタンを押したときの処理
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
