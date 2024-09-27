import 'package:flutter/material.dart';
import 'account_profile.dart';
import 'login.dart';
import 'add_friend.dart';

bool login = false;

// グループ画像のURLリスト
final List<String> g_imageUrls = [
  'https://i.scdn.co/image/ab67616d0000b273e4da12ab8213633c552ecfa9',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwYj5xgn43t-7S9pGZk1-9UOK1apbnt5e48Q&s',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwYj5xgn43t-7S9pGZk1-9UOK1apbnt5e48Q&s',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwYj5xgn43t-7S9pGZk1-9UOK1apbnt5e48Q&s',
  'https://i.scdn.co/image/ab67616d0000b273e4da12ab8213633c552ecfa9',
  'https://i.scdn.co/image/ab67616d0000b273e4da12ab8213633c552ecfa9',
];

// グループ画像のURLリスト
final List<String> f_imageUrls = [
  'https://i.scdn.co/image/ab67616d0000b273e4da12ab8213633c552ecfa9',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwYj5xgn43t-7S9pGZk1-9UOK1apbnt5e48Q&s',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwYj5xgn43t-7S9pGZk1-9UOK1apbnt5e48Q&s',
  'https://i.scdn.co/image/ab67616d0000b273e4da12ab8213633c552ecfa9',
  'https://i.scdn.co/image/ab67616d0000b273e4da12ab8213633c552ecfa9',
  'https://i.scdn.co/image/ab67616d0000b273e4da12ab8213633c552ecfa9',
];

// メイン関数
void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        // スクロールを可能にする
        child: Builder(
          builder: (BuildContext context) {
            return Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                // ホームコンテナ
                Container(
                  width: MediaQuery.of(context).size.width, // 画面の幅に合わせる
                  height: 100, // 高さ
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
                            color: const Color.fromRGBO(236, 212, 29, 1),
                          ),
                          onPressed: () {
                            print('アカウントボタンが押されました');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    // （2） 実際に表示するページ(ウィジェット)を指定する
                                    builder: (context) => AddFriend()));
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: IconButton(
                          icon: Icon(
                            Icons.account_circle,
                            size: 30,
                            color: const Color.fromRGBO(236, 212, 29, 1),
                          ),
                          onPressed: () {
                            if (login == true) {
                              print('アカウントボタンが押されました');
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      // （2） 実際に表示するページ(ウィジェット)を指定する
                                      builder: (context) => AccountProfile()));
                            } else {
                              print('アカウントボタンが押されました');
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      // （2） 実際に表示するページ(ウィジェット)を指定する
                                      builder: (context) => Login()));
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
                  width: MediaQuery.of(context).size.width, // 画面の幅に合わせる
                  height: 40,
                  child: Row(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Align(
                              alignment: Alignment.topLeft, // 上左寄りに配置
                              child: Text(
                                'ランキング',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Center(
                  child: SingleChildScrollView(
                    // スクロール
                    scrollDirection: Axis.horizontal, // スクロールの方向、水平
                    child: Row(
                      children: [
                        Container(
                          width: 200,
                          height: 200,
                          margin: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20), // 角を丸くする
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://i.scdn.co/image/ab67616d0000b273e4da12ab8213633c552ecfa9',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          width: 200,
                          height: 200,
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20), // 角を丸くする
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://i.scdn.co/image/ab67616d0000b273e4da12ab8213633c552ecfa9',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          width: 200,
                          height: 200,
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20), // 角を丸くする
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://i.scdn.co/image/ab67616d0000b273e4da12ab8213633c552ecfa9',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          width: 200,
                          height: 200,
                          margin: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10), // 角を丸くする
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://i.scdn.co/image/ab67616d0000b273e4da12ab8213633c552ecfa9',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // グループコンテナ
                // あなたのお気に入りコンテナ
                Container(
                  color: const Color.fromARGB(57, 255, 255, 255),
                  width: MediaQuery.of(context).size.width, // 画面の幅に合わせる
                  height: 30,
                  child: Row(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Align(
                              alignment: Alignment.topLeft, // 上左寄りに配置
                              child: Text(
                                'グループ',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  height: 300, // 高さを固定
                  margin: EdgeInsets.all(8), // 各アイテムにマージンを追加
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(), // スクロールを無効にする
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // グリッドの列数
                      crossAxisSpacing: 3, // グリッドの横方向のスペース
                      mainAxisSpacing: 3, // グリッドの縦方向のスペース
                    ),
                    itemCount: g_imageUrls.length, // グリッドに表示するアイテムの数
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.all(10), // 各アイテムのマージン
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10), // ボーダー半径の設定
                          image: DecorationImage(
                            image: NetworkImage(
                                f_imageUrls[index]), // リストから画像のURLを取得
                            fit: BoxFit.cover, // 画像をコンテナにフィットさせる
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // あなたのお気に入りコンテナ
                Container(
                  color: const Color.fromARGB(112, 255, 255, 255),
                  width: MediaQuery.of(context).size.width, // 画面の幅に合わせる
                  height: 30,
                  child: Row(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Align(
                              alignment: Alignment.topLeft, // 上左寄りに配置
                              child: Text(
                                'あなたのお気に入り',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  height: 300, // 高さを固定
                  margin: EdgeInsets.all(8), // 各アイテムにマージンを追加
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(), // スクロールを無効にする
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // グリッドの列数
                      crossAxisSpacing: 3, // グリッドの横方向のスペース
                      mainAxisSpacing: 3, // グリッドの縦方向のスペース
                    ),
                    itemCount: f_imageUrls.length, // グリッドに表示するアイテムの数
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.all(10), // 各アイテムのマージン
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10), // ボーダー半径の設定
                          image: DecorationImage(
                            image: NetworkImage(
                                f_imageUrls[index]), // リストから画像のURLを取得
                            fit: BoxFit.cover, // 画像をコンテナにフィットさせる
                          ),
                        ),
                      );
                    },
                  ),
                ),

                //////////ログイン画面テスト用//////////
                Container(
                  width: MediaQuery.of(context).size.width, // 画面の幅に合わせる
                  height: 100, // 高さ
                  child: Row(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text(
                              'ログイン画面へ(仮)',
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
                            Icons.account_circle,
                            size: 30,
                            color: const Color.fromRGBO(236, 212, 29, 1),
                          ),
                          onPressed: () {
                            print('アカウントボタンが押されました');
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
                //////////ここまで//////////
              ],
            );
          },
        ),
      ),
    ),
  ));
}
