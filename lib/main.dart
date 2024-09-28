import 'package:flutter/material.dart';
import 'account_profile.dart';
import 'login.dart';
import 'add_friend.dart';
import 'ranking-list.dart';

bool login = false;

// ランキング画像のURLリスト
final List<String> r_imageUrls = [
  'https://i.scdn.co/image/ab67616d0000b273e4da12ab8213633c552ecfa9',
  'https://i.pinimg.com/236x/b8/44/62/b84462069b5784e0bf29d3ce1426925d.jpg',
  'https://i.pinimg.com/236x/41/56/a6/4156a68baa1b6779860a3ab33d1acfda.jpg',
  'https://i.pinimg.com/236x/9c/90/59/9c9059cb64d005cd1cb0fdbdf3cbdfde.jpg',
];

// グループ画像のURLリスト
final List<String> g_imageUrls = [
  'https://i.pinimg.com/236x/37/f6/28/37f628fcafd4fd222cc3c3899948e84b.jpg',
  'https://i.pinimg.com/474x/b4/0f/be/b40fbe8222a7a493db26b36ee8c1550a.jpg',
  'https://i.pinimg.com/236x/a3/73/0f/a3730ff74e7832087740c2a128538f3f.jpg',
  'https://i.pinimg.com/236x/94/a3/ae/94a3ae1dda96ad0c71d6a396856b2025.jpg',
  'https://i.pinimg.com/236x/24/13/d1/2413d199ef41196284c9eec33b90a2a0.jpg',
  'https://i.pinimg.com/236x/de/67/54/de67546f2a3cfedae325399aa55fedef.jpg',
];

// グループ画像のURLリスト
final List<String> f_imageUrls = [
  'https://i.pinimg.com/236x/59/c3/bf/59c3bf10ac4f402a0364e2278473492a.jpg',
  'https://i.pinimg.com/236x/f8/0c/4c/f80c4c91f707605b2dbb8bf412316ca5.jpg',
  'https://i.pinimg.com/236x/ec/1b/ef/ec1befcde4d75fbb9ec6146ac4a2fb1c.jpg',
  'https://i.pinimg.com/236x/8c/b1/f7/8cb1f773d581ff99bede558d0eb758ba.jpg',
  'https://i.pinimg.com/736x/68/26/d5/6826d5f7d9535605cdca6d648dae66c0.jpg',
  'https://i.pinimg.com/236x/a3/73/0f/a3730ff74e7832087740c2a128538f3f.jpg',
];

// メイン関数
void main() {
  runApp(MaterialApp(
    home: MyHomePage(),
  ));
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0; // 現在選択されているインデックス

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
                          onPressed: () {
                            print('アカウント新規作成が押されました');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    // （2） 実際に表示するページ(ウィジェット)を指定する
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
                          onPressed: () {
                            print('アカウント新規作成が押されました');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    // （2） 実際に表示するページ(ウィジェット)を指定する
                                    builder: (context) => RankingList()));
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
                          onPressed: () {
                            print('アカウント新規作成が押されました');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    // （2） 実際に表示するページ(ウィジェット)を指定する
                                    builder: (context) => RankingList()));
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // お気に入り画像
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
            icon: Icon(Icons.group),
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
