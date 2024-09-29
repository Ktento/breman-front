import 'package:bremen_fe/new_account.dart';
import 'package:flutter/material.dart';
import 'api.dart';

class AddFriend extends StatelessWidget {
  @override
    _AddFriendState createState() => _AddFriendState();
  }

class _AddFriendState extends State<AddFriend>{
  final TextEditingController _userIdController = TextEditingController();
  final ApiService _apiService = ApiService();
  String? _searchResult; // 検索結果を格納する変数
  String? _errorMessage; // エラーメッセージを格納する変数

  
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
                    'フレンド追加',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            //　ユーザID入力フィールド
            Container(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _userIdController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), 
                    hintText: 'ユーザID'//メアド入力フォーム
                    ),
              ),
            ),


            Container(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                child: const Text('フレンド追加'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15), // 角の丸みを調整
                  ),
                ),
                onPressed: () async {
                  



                }, //ログインボタンを押したときの処理
              ),
            ),
          ],
        ),
      ),
    );
  }
}
