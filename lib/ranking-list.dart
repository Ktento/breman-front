import 'package:flutter/material.dart';
import 'main.dart';
import 'SongDetailScreen.dart'; // 新しく作成した詳細画面をインポート

class RankingList extends StatefulWidget {
  @override
  _RankingListState createState() => _RankingListState();
}

class _RankingListState extends State<RankingList> {
  int _currentIndex = 0;

  final List<Map<String, dynamic>> _musicRanking = [
    {
      'rank': 1,
      'title': 'Song A',
      'artist': 'Artist X',
      'youtubeUrl': 'https://www.youtube.com/watch?v=ZRtdQ81jPUQ',
      'spotifyUrl': 'https://open.spotify.com/track/7ovUcF5uHTBRzUpB6ZOmvt'
    },
    {'rank': 2, 'title': 'Song B', 'artist': 'Artist Y'},
    {'rank': 3, 'title': 'Song C', 'artist': 'Artist Z'},
    {'rank': 4, 'title': 'Song D', 'artist': 'Artist W'},
    {'rank': 5, 'title': 'Song E', 'artist': 'Artist V'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('音楽ランキング'),
        backgroundColor: Colors.orange,
      ),
      body: ListView.builder(
        itemCount: _musicRanking.length,
        itemBuilder: (context, index) {
          final item = _musicRanking[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.orange,
                child: Text('${item['rank']}',
                    style: TextStyle(color: Colors.white)),
              ),
              title: Text(item['title'],
                  style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(item['artist']),
              onTap: () { // onTapさんは画面遷移
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SongDetailScreen(song: item),
                  ),
                );
              },
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'ホーム'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'お気に入り'),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'グループ'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'アカウント'),
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
              // お気に入り画面の処理
              break;
            case 2:
              // グループ画面の処理
              break;
            case 3:
              // アカウント画面の処理
              break;
          }
        },
      ),
    );
  }
}
