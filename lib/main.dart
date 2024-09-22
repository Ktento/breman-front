import 'package:flutter/material.dart';

// メイン関数
void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Builder(
          builder: (BuildContext context) {
            return Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                // ホームコンテナ
                Container(
                  color: const Color.fromARGB(57, 67, 54, 244),
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
                  height: 100,
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
              ],
            );
          },
        ),
      ),
    ),
  ));
}
