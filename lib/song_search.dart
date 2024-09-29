import 'package:flutter/material.dart';
import 'profile_edit.dart';
import 'main.dart';
import 'login.dart';
import 'account_profile.dart';
import 'api.dart';
//import 'login.dart' as global;

class SongSearch extends StatefulWidget {
  @override
  _SongSearchState createState() => _SongSearchState();
}

class _SongSearchState extends State<SongSearch> {
  List<dynamic> _searchResults = [];
  final ApiService _apiService = ApiService(); // ApiServiceのインスタンス
  int _currentIndex = 2; // 現在のインデックスをアカウントプロフィールに設定
  final TextEditingController _searchController =
      TextEditingController(); // TextEditingControllerの追加
  List<bool> _favoriteStatus = []; // お気に入りの状態を管理するリスト

  @override
  void dispose() {
    _searchController.dispose(); // メモリリークを防ぐためにコントローラを破棄
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
                    '検索',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            // 検索フォーム
            Container(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: _searchController, // コントローラをTextFormFieldに割り当て
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  hintText: '曲名を入力', // 透かし文字をここに指定
                ),
              ),
            ),

            ElevatedButton(
              onPressed: () async {
                String searchText = _searchController.text; // 入力内容を取得
                print("検索ワード: $searchText"); // 検索ワードをコンソールに表示
                try {
                  List response = await _apiService.TrackSearch(searchText);
                  print(response);
                  setState(() {
                    _searchResults = response; // 検索結果を保存
                    _favoriteStatus = List<bool>.filled(
                        response.length, false); // お気に入り状態を初期化
                  });
                } catch (e) {
                  print('ログイン中にエラーが発生しました: $e');
                }
              },
              child: Text('検索'),
            ),

            // 検索結果を表示するリスト
            if (_searchResults.isNotEmpty)
              Container(
                height: 450, // リストビューの高さを指定
                child: ListView.builder(
                  itemCount: _searchResults.length,
                  itemBuilder: (context, index) {
                    var songData = _searchResults[index];

                    String artists =
                        songData['artists'].join(', '); // アーティスト名をカンマ区切りで結合
                    return ListTile(
                      leading: Image.network(
                        songData['image_url'],
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      title: Text(songData['track_name']),
                      subtitle: Text(artists),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min, // Rowの幅を必要最小限に制限
                        children: [
                          IconButton(
                            icon: Icon(Icons.add), // 空のハートアイコンを表示
                            onPressed: () {
                              // お気に入りに追加する処理
                              print(
                                  'グループ追加ボタンが押されました: ${songData['track_name']}');
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return SimpleDialog(
                                    title: Text('グループを選択'),
                                    children: <Widget>[
                                      SimpleDialogOption(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          print('1項目目が選ばれました');
                                        },
                                        child: Text('1項目目'), // グループ名
                                      ),
                                      SimpleDialogOption(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          print('2項目目が選ばれました');
                                        },
                                        child: Text('2項目目'), // グループ名
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                          SizedBox(width: 8), // ボタン同士の間にスペースを追加
                          IconButton(
                            icon: Icon(
                              _favoriteStatus.length > index &&
                                      _favoriteStatus[index]
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: _favoriteStatus.length > index &&
                                      _favoriteStatus[index]
                                  ? Colors.red
                                  : null,
                            ),
                            onPressed: () async {
                              // お気に入りの状態を切り替える
                              setState(() {
                                if (index < _favoriteStatus.length) {
                                  _favoriteStatus[index] =
                                      !_favoriteStatus[index];
                                }
                                print(
                                    'お気に入りボタンが押されました: ${songData['track_name']}');
                                String trackid = songData['id'];
                                print("トラックID:  " + trackid);
                                print(id);
                                //                 try {
                                //   List response = await _apiService.UserTrackAdd(id,trackid);
                                // } catch (e) {
                                //   print('ログイン中にエラーが発生しました: $e');
                                // }
                              });
                            },
                          ),
                        ],
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
              // お気に入り画面の処理
              break;
            case 2:
              // グループ画面の処理
              break;
            case 3:
              // アカウント画面の処理は不要
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
