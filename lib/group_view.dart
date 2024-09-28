import 'package:bremen_fe/song_search.dart';
import 'package:flutter/material.dart';
import 'profile_edit.dart';
import 'main.dart';
import 'login.dart';
import 'login.dart' as global;
import 'song_search.dart';
import 'account_profile.dart';
import 'add_group.dart';

class GroupView extends StatefulWidget {
  @override
  _GroupViewState createState() => _GroupViewState();
}

class _GroupViewState extends State<GroupView> {
  int _currentIndex = 1; // 現在のインデックスをアカウントプロフィールに設定
  final List<Map<String, String>> GroupViews = [
    {
      'title': 'Song Title 1',
      'image': 'images/image.png',
    },
    {
      'title': 'Song Title 2',
      'image': 'images/image.png',
    },
    // APIで情報を取得して、上の配列に格納
    //とってくる情報は変えてもいいお
  ];

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
                    'グループ',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            //グループ作成
            Container(
              child: TextButton(
                child: const Text('アカウント作成'),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.orange,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddGroup()),
                  );
                },
              ),
            ),

            // グループリスト
            Container(
              color: const Color.fromARGB(158, 255, 255, 255),
              width: MediaQuery.of(context).size.width,
              height: 400,
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: GroupViews.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        GroupViews[index]['image']!,
                        fit: BoxFit.cover,
                        width: 50, // 幅を指定
                        height: 50, // 高さを指定
                      ),
                    ),
                    title: Text(GroupViews[index]['title']!),
                  );
                },
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
                MaterialPageRoute(builder: (context) => GroupView()),
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
