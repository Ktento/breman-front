import 'package:flutter/material.dart';
import 'account_profile.dart';
import 'login.dart';

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
                                    builder: (context) => AccountProfile()));
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                // ランキングコンテナ
                Container(
                  color: const Color.fromARGB(58, 244, 67, 54),
                  width: MediaQuery.of(context).size.width, // 画面の幅に合わせる
                  height: 300,
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
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // グループコンテナ
                Container(
                  color: const Color.fromARGB(57, 207, 255, 34),
                  width: MediaQuery.of(context).size.width, // 画面の幅に合わせる
                  height: 300,
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
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // あなたのお気に入りコンテナ
                Container(
                  color: const Color.fromARGB(57, 54, 127, 244),
                  width: MediaQuery.of(context).size.width, // 画面の幅に合わせる
                  height: 300,
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
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //テスト用
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




              ],
            );
          },
        ),
      ),
    ),
  ));
}
