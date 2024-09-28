import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // URLを開くためのパッケージ

class SongDetailScreen extends StatelessWidget {
  final Map<String, dynamic> song;

  SongDetailScreen({required this.song});

  // URLを開くための関数
  Future<void> _launchURL(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $_url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('曲の詳細'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              song['title'],
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'アーティスト: ${song['artist']}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Text(
              'ランキング: ${song['rank']}位',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 32),

            // YouTubeリンクボタン (URLが存在する場合のみ表示)
            if (song.containsKey('youtubeUrl') && song['youtubeUrl'] != null)
              ElevatedButton.icon(
                onPressed: () {
                  _launchURL('https://www.youtube.com/watch?v=ZRtdQ81jPUQ');
                },
                icon: Icon(Icons.play_circle_filled),
                label: Text('YouTubeで見る'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // YouTubeカラー
                ),
              ),

            SizedBox(height: 16),

            // Spotifyリンクボタン (URLが存在する場合のみ表示)
            if (song.containsKey('spotifyUrl') && song['spotifyUrl'] != null)
              ElevatedButton.icon(
                onPressed: () {
                  _launchURL(song['spotifyUrl']);
                },
                icon: Icon(Icons.music_note),
                label: Text('Spotifyで聴く'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // Spotifyカラー
                ),
              ),
          ],
        ),
      ),
    );
  }
}
