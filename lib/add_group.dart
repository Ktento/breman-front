import 'package:bremen_fe/song_search.dart';
import 'package:flutter/material.dart';
import 'profile_edit.dart';
import 'main.dart';
import 'main.dart' as global;
import 'login.dart';
import 'login.dart' as global;
import 'song_search.dart';
import 'account_profile.dart';

class AddGroup extends StatefulWidget {
  @override
  _AddGroupState createState() => _AddGroupState();
}

class _AddGroupState extends State<AddGroup> {
  int _currentIndex = 1; // 現在のインデックスをアカウントプロフィールに設定
  TextEditingController _groupNameController = TextEditingController();

  @override
  void dispose() {
    _groupNameController.dispose();
    super.dispose();
  }

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
                    'グループ作成',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            //グループ作成
            Container(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _groupNameController, // コントローラを設定
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: 'グループ名'),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                child: const Text('グループ作成'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () { //グループ作成ボタンが押されたとき
                  String groupName = _groupNameController.text;
                  // グループ名を使った処理
                  print("グループ名: $groupName");  //groupNameにグループ名を格納
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
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
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
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => AddGroup()),
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
              if (global.login) { // global.loginの確認
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
