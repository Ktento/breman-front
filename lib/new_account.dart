import 'package:flutter/material.dart';
import 'login.dart';
import 'api.dart';
import 'main.dart';
// import 'main.dart' as global;

class NewAccount extends StatefulWidget {
  @override
  _NewAccountState createState() => _NewAccountState();
}

class _NewAccountState extends State<NewAccount> {
  final TextEditingController _userIdController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmationController =
      TextEditingController();
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
                    'アカウント作成',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            // その他のコンテンツをここに追加
            Container(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _userIdController, // ここを追加
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'ユーザID', // メアド入力フォーム
                ),
              ),
            ),

            Container(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _userNameController, // ここを追加
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'ユーザ名', // メアド入力フォーム
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _passwordController, // ここを追加
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'パスワード', // メアド入力フォーム
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _passwordConfirmationController, // ここを追加
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'パスワード(確認用)', // メアド入力フォーム
                ),
                obscureText: true, //入力内容を非表示
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                child: const Text('アカウント作成'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15), // 角の丸みを調整
                  ),
                ),
                onPressed: () async {
                  //新規登録ボタンを押したときの処理
                  final userId = _userIdController.text;
                  final userName = _userNameController.text;
                  final password = _passwordController.text;
                  final _passwordConfirmation =
                      _passwordConfirmationController.text;

                  // APIサービスを使用してログイン処理を実行
                  try {
                    print('aaaaaaaaaaaaaaaaaaaaaaaaaaa');
                    
                    List response = await _apiService.SignUp(
                        userId, userName, password, _passwordConfirmation);
                    //response[0]->response.statusCode
                    //response[1]->id(userを登録するときに自動でつく主キー)
                    //response[2]->user_id(自分で決めるuser_id)
                    //response[3]->user_name(名前)

                    print('サインインリクエストを送信しました');
                    print(response[1]);

                    //変数に格納
                    String statusCode = response[0];
                    id = response[1];
                    user_id = response[2];
                    user_name = response[3];

                    //login状態をキープ
                    login = true;

                    //ホーム画面に自動遷移
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyHomePage()));
                  } catch (e) {
                    print('ログイン中にエラーが発生しました: $e');
                  }
                },
              ),
            ),
            Container(
              // Flutter1.22以降のみ
              child: TextButton(
                child: const Text('ログイン'),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.orange,
                ),
                onPressed: () {
                  print('ログインボタンが押されました');
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
    );
  }

  @override
  void dispose() {
    _userIdController.dispose();
    _userNameController.dispose();
    _passwordController.dispose();
    _passwordConfirmationController.dispose();
    super.dispose();
  }
}
