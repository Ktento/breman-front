import 'package:bremen_fe/song_search.dart';
import 'package:flutter/material.dart';
import 'profile_edit.dart';
import 'main.dart';
import 'login.dart';
import 'login.dart' as global;
import 'song_search.dart';
import 'account_profile.dart';

class FavoriteSong extends StatefulWidget {
  @override
  _FavoriteSongState createState() => _FavoriteSongState();
}

class _FavoriteSongState extends State<FavoriteSong> {
  int _currentIndex = 1; // 現在のインデックスをアカウントプロフィールに設定

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
                    'お気に入り',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            // その他のコンテンツをここに追加
            Container(
              width: 200,
              height: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50), //丸み具合を調整
                child: Image.asset('images/image.png'),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20, left: 16, right: 16),
              color: const Color.fromARGB(119, 255, 255, 255),
              width: MediaQuery.of(context).size.width, // 画面の幅に合わせる
              height: 60, // 高さ
              alignment: Alignment.center, // ボタンを中央に配置
              child: SizedBox(
                width: 250, // ボタンの幅
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
                    print('アカウントボタンが押されました');

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        //（2） 実際に表示するページ(ウィジェット)を指定する
                        builder: (context) => ProfileEdit(),
                      ),
                    );
                  },
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.only(top: 20, left: 16, right: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          '名前:　　' + user_name,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20, left: 16, right: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          'ユーザID: ' + user_id,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
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
              // お気に入り画面がすでに表示されている場合でも何かしらの処理を追加可能
              // 例: リロードする場合
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => FavoriteSong()),
              );
              break;
            case 2:
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => SongSearch()),
                (Route<dynamic> route) => false,
              );
              break;
            case 3:
              // アカウント画面の処理
              if (login) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AccountProfile()),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              }
              break;
          }
        },
      ),
    );
  }
}
