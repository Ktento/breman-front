import 'package:flutter/material.dart';
import 'profile_edit.dart';
import 'main.dart';

class SongSearch extends StatefulWidget {
  @override
  _SongSearchState createState() => _SongSearchState();
}

class _SongSearchState extends State<SongSearch> {
  int _currentIndex = 2; // 現在のインデックスをアカウントプロフィールに設定

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
                    '検索',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            // その他のコンテンツをここに追加
            Container(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    )),
              ),
            ),

            Container(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'ホーム',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'お気に入り',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '検索',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'アカウント',
          ),
        ],
        currentIndex: _currentIndex, // 現在選択されているインデックス
        onTap: (index) {
          // タップされたインデックスに応じてナビゲーションを行う
          setState(() {
            _currentIndex = index; // タップされたインデックスを更新
          });

          switch (index) {
            case 0:
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
                (Route<dynamic> route) => false,
              );
              break;
            case 1:
              // お気に入り画面の処理
              break;
            case 2:
              // グループ画面の処理
              break;
            case 3:
              // アカウント画面の処理は不要
              break;
          }
        },
      ),
    );
  }
}
