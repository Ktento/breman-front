import 'package:bremen_fe/new_account.dart';
import 'package:flutter/material.dart';
import 'new_account.dart';
import 'main.dart';
// import 'main.dart' as global;
import 'api.dart';

//グローバル変数
int id = 0;
String user_id = "";
String user_name = "";
//お気に入り曲リスト
List<int> favSongs = [6];

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _userIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ApiService _apiService = ApiService(); // ApiServiceのインスタンス

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 戻るボタンを含むコンテナ
            Container(
              padding: EdgeInsets.only(top: 20, left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, size: 30),
                    onPressed: () {
                      Navigator.pop(context); // 前の画面に戻る
                    },
                  ),
                  SizedBox(width: 8),
                  Text(
                    'ログイン',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            // ユーザID入力フィールド
            Container(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _userIdController, // コントローラーを設定
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'ユーザID',
                ),
              ),
            ),

            // パスワード入力フィールド
            Container(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _passwordController, // コントローラーを設定
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'パスワード',
                ),
                obscureText: true,
              ),
            ),

            // ログインボタン
            Container(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                child: const Text('ログイン'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () async {
                  // ボタン押下時の処理
                  final userId = _userIdController.text;
                  final password = _passwordController.text;

                  // APIサービスを使用してログイン処理を実行
                  try {
                    List response = await _apiService.login(userId, password);
                    //response[0]->id(userを登録するときに自動でつく主キー)
                    //response[1]->user_id(自分で決めるuser_id)
                    //response[2]->user_name(名前)
                    print('ログインリクエストを送信しました');
                    print(response[1]);

                    //変数に格納
                    id = response[0];
                    user_id = response[1];
                    user_name = response[2];

                    //login状態をキープ
                    login = true;
                  } catch (e) {
                    print('ログイン中にエラーが発生しました: $e');
                  }
                  //自分のお気に入り曲を取得
                  print("ID");
                  print(id);
                  try {
                    List response = await _apiService.UserTrackShow(id);
                    //response[0]->id(userを登録するときに自動でつく主キー)
                    //response[1]->user_id(自分で決めるuser_id)
                    //response[2]->user_name(名前)
                    print("お気に入りの曲");
                    print(response[1]);

                    for (int i = 0; i < response.length; i++) {
                      if (response[i] == null) {
                        break;
                      } else {
                        favSongs.add(response[i]);
                        print(favSongs[i]);
                      }
                    }

                    //ホーム画面に自動遷移
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyHomePage()));
                  } catch (e) {
                    print('ログイン中にエラーが発生しました: $e');
                  }
                },
              ),
            ),

            // アカウント作成ボタン
            Container(
              child: TextButton(
                child: const Text('アカウント作成'),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.orange,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NewAccount()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _userIdController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
