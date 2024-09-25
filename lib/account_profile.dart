import 'package:flutter/material.dart';
import 'profile_edit.dart';

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
              color: const Color.fromARGB(110, 118, 253, 88),
              width: MediaQuery.of(context).size.width, // 画面の幅に合わせる
              height: 100, // 高さ
            ),
            Container(
              color: const Color.fromARGB(109, 40, 255, 90),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ProfileEdit()), // ProfileEdit画面に遷移
                  );
                },
                child: const Text('アカウント作成'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  minimumSize: Size(150, 30), // ボタンの最小サイズを指定
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
