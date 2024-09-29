// // デバックするときは以下の文にする
// import 'debug.dart';

// void main() async {
//   await debugApiService(); // debug.dartの関数を呼び出す
// }

import 'package:bremen_fe/song_search.dart';
import 'package:flutter/material.dart';
import 'account_profile.dart';
import 'login.dart';
import 'add_friend.dart';
import 'ranking-list.dart';
import 'group_view.dart';

bool login = false;


//画像のURLがほしい
//音楽の詳細ページに行きたい
// ランキング画像のURLリスト
final List<String> r_imageUrls = [
  'https://i.scdn.co/image/ab67616d0000b273e4da12ab8213633c552ecfa9',
  'https://i.scdn.co/image/ab67616d0000b2730574601f4bcf70362bc7cce3',
  'https://i.scdn.co/image/ab67616d0000b27381f55cd879e9480e3ed313df',
  'https://i.scdn.co/image/ab67616d0000b27389d4982c66a38e88b2b3b272',
  'https://i.scdn.co/image/ab67616d0000b273ef96f1d50c9562c321ef207e',
];

//グループの画像のURLがほしい
// グループ画像のURLリスト
final List<String> g_imageUrls = [
  'https://i.pinimg.com/236x/37/f6/28/37f628fcafd4fd222cc3c3899948e84b.jpg',
  'https://i.pinimg.com/474x/b4/0f/be/b40fbe8222a7a493db26b36ee8c1550a.jpg',
  'https://i.pinimg.com/236x/a3/73/0f/a3730ff74e7832087740c2a128538f3f.jpg',
  'https://i.pinimg.com/236x/94/a3/ae/94a3ae1dda96ad0c71d6a396856b2025.jpg',
  'https://i.pinimg.com/236x/24/13/d1/2413d199ef41196284c9eec33b90a2a0.jpg',
  'https://i.pinimg.com/236x/de/67/54/de67546f2a3cfedae325399aa55fedef.jpg',
];

//音楽の画像のURLがほしい
//音楽の詳細ページに行きたい
// グループ画像のURLリスト

// メイン関数
void main() {
  if (login == true) {
    runApp(MaterialApp(
      home: MyHomePage(),
    ));
  } else {
    runApp(MaterialApp(
      home: Login(),
    ));
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0; // 現在選択されているインデックス

  //自分のお気に入り曲を取得


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // スクロールを可能にする
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            // ホームコンテナ
            Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              child: Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          'ホーム',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: IconButton(
                      icon: Icon(
                        Icons.person,
                        size: 30,
                        color: const Color.fromARGB(255, 255, 152, 0),
                      ),
                      onPressed: () {
                        print('アカウントボタンが押されました');
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AddFriend()),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: IconButton(
                      icon: Icon(
                        Icons.account_circle,
                        size: 30,
                        color: const Color.fromARGB(255, 255, 152, 0),
                      ),
                      onPressed: () {
                        if (login) {
                          print('アカウントボタンが押されました');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AccountProfile(),
                            ),
                          );
                        } else {
                          print('アカウントボタンが押されました');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Login(),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),

            // ランキングコンテナ
            Container(
              color: const Color.fromARGB(57, 255, 255, 255),
              width: MediaQuery.of(context).size.width,
              height: 40,
              child: Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: TextButton(
                          child: const Text('ランキング'),
                          style: TextButton.styleFrom(
                            minimumSize: Size(40, 50), // 幅200、高さ50のボタン
                            foregroundColor: Colors.black,
                            textStyle: const TextStyle(
                              fontSize: 20, // フォントサイズを20に設定
                            ),
                          ),
                          //ランキングのボタン(文字)が押されたとき
                          onPressed: () {
                            print('ランキングが押されました');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    //ランキング画面に遷移
                                    builder: (context) => RankingList()));
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // ランキング画像
            Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: r_imageUrls.map((url) {
                    return GestureDetector(
                      //ランキングの画像が押されたときの処理
                      //画像URLごとに管理されてると思う
                      onTap: () {
                        print('画像がタップされました: $url');
                      },
                      child: Container(
                        width: 200,
                        height: 200,
                        margin: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(url),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),

            // グループコンテナ
            Container(
              color: const Color.fromARGB(57, 255, 255, 255),
              width: MediaQuery.of(context).size.width,
              height: 40,
              child: Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: TextButton(
                          child: const Text('グループ'),
                          style: TextButton.styleFrom(
                            minimumSize: Size(40, 30), // 幅200、高さ50のボタン
                            foregroundColor: Colors.black,
                            textStyle: const TextStyle(
                              fontSize: 20, // フォントサイズを20に設定
                            ),
                          ),
                          //グループ(文字)ボタンを押したとき
                          onPressed: () {
                            print('アカウント新規作成が押されました');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    // （2） 実際に表示するページ(ウィジェット)を指定する
                                    builder: (context) => GroupView()));
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // グループ画像
            Container(
              height: 300,
              margin: EdgeInsets.all(8),
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 3,
                  mainAxisSpacing: 3,
                ),
                itemCount: g_imageUrls.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    //グループアイコンが押されたとき
                    //多分URLで管理されてる
                    onTap: () {
                      print('画像がタップされました: ${g_imageUrls[index]}');
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(g_imageUrls[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // あなたのお気に入りコンテナ
            Container(
              color: const Color.fromARGB(110, 255, 255, 255),
              width: MediaQuery.of(context).size.width,
              height: 40,
              child: Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: TextButton(
                          child: const Text('あなたのお気に入り'),
                          style: TextButton.styleFrom(
                            minimumSize: Size(40, 30), // 幅200、高さ50のボタン
                            foregroundColor: Colors.black,
                            textStyle: const TextStyle(
                              fontSize: 20, // フォントサイズを20に設定
                            ),
                          ),
                          //お気に入り(文字)が押されたとき
                          onPressed: () {
                            print('アカウント新規作成が押されました');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    // お気に入りリストに遷移させたい。
                                    builder: (context) => RankingList()));
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),


            Container(
              height: 300,
              margin: EdgeInsets.all(8),
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 3,
                  mainAxisSpacing: 3,
                ),
                itemCount: f_imageUrls.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    //お気に入り曲の画像がタッチされたときの処理
                    //多分URLで管理されてる
                    onTap: () {
                      print('画像がタップされました: ${f_imageUrls[index]}');
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(f_imageUrls[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
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
          setState(() {
            _currentIndex = index; // タップされたインデックスを設定
          });
          // タップされたインデックスに応じてナビゲーションを行う
          switch (index) {
            case 0:
              // ホーム画面の処理
              break;
            case 1:
              // お気に入り画面の処理
              break;
            case 2:
              // グループ画面の処理
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SongSearch()),
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
