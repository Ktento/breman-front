import 'package:flutter/material.dart';
import 'main.dart';

class RankingList extends StatefulWidget {
  @override
  _RankingListState createState() => _RankingListState();
}

class _RankingListState extends State<RankingList> {
  int _currentIndex = 3;

  // 音楽ランキングのダミーデータ
  final List<Map<String, dynamic>> _musicRanking = [
    {'rank': 1, 'title': 'Song A', 'artist': 'Artist X', 'lastWeek': 2},
    {'rank': 2, 'title': 'Song B', 'artist': 'Artist Y', 'lastWeek': 1},
    {'rank': 3, 'title': 'Song C', 'artist': 'Artist Z', 'lastWeek': 5},
    {'rank': 4, 'title': 'Song D', 'artist': 'Artist W', 'lastWeek': 3},
    {'rank': 5, 'title': 'Song E', 'artist': 'Artist V', 'lastWeek': 4},
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
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('前週: ${item['lastWeek']}位'),
                  Icon(
                    item['lastWeek'] > item['rank']
                        ? Icons.arrow_upward
                        : Icons.arrow_downward,
                    color: item['lastWeek'] > item['rank']
                        ? Colors.green
                        : Colors.red,
                  ),
                ],
              ),
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
