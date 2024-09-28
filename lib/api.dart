import 'dart:ffi';

import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  final String _baseUrl =
      'https://agile-adventure-production.up.railway.app/'; // 実際のAPIサーバーのURLに変更してください

  // ログインのGETリクエスト
  Future<List<dynamic>> login(String userId, String password) async {
    final url = Uri.parse(
        //クエリパラメータを使用する際は?user_id=$userId&password=$password'を変更
        //今回はuser_idとpasswordを使用するのでこのような形になっている
        '$_baseUrl/users/login?user_id=$userId&password=$password'); // クエリパラメータをURLに追加
    try {
      //http.get ->getリクエスト
      //http.post ->postリクエスト
      //http.put ->putリクエスト
      //http.delete ->deleteリクエスト
      final response = await http.get(url
          //POSt,PUT,DELETの場合でbodyは以下のように指定する
          //以下bodyにuser_id,passwordの指定が必要な時の例
          //  headers: {
          //   'Content-Type': 'application/json', // ヘッダーの設定
          //   },
          // body: json.encode({
          //   'user_id': userId, // リクエストボディにユーザーIDを追加
          //   'password': password, // リクエストボディにパスワードを追加
          // }),
          );
      //レスポンス確認用のprint
      // print(response.body);
      if (response.statusCode == 200) {
        // JSONをデコードしてマップ形式に変換
        //レスポンスの始まりのかっこによって型が変わる
        //レスポンスが以下の場合([]なのでList) -> List<dynamic>
        /*
        [
          {
            "id": 10,
            "user_id": "test",
            "user_name": "test"
          }
        ]*/
        //レスポンスが以下の場合({}なのでMap) -> Map<String, dynamic>
        /*
          {
            "id": 1,
            "user_id": "test",
            "user_name": "test",
            "password_digest": "test",
          }
        */

        final Map<String, dynamic> data = json.decode(response.body);
        if (data['user'] != null) {
          int id = data['user']['id'];
          String user_id = data['user']['user_id'];
          String user_name = data['user']['user_name'];
          return [id, user_id, user_name];
        } else {
          print('userオブジェクトがnullです。レスポンスデータ: $data');
          return [];
        }
      } else {
        print('ログイン失敗: ${response.statusCode}');
        //失敗した場合はstatusCodeを返す
        return [response.statusCode];
      }
    } catch (e) {
      print('エラーが発生しました: $e');
      print(e);
      return [];
    }
  }

  //ユーザ新規登録のPOSTリクエスト
  Future<List<dynamic>> SignUp(
    String user_id,
    String user_name,
    String password,
    String password_confirmation,
  ) async {
    final url = Uri.parse('$_baseUrl/users/signup'); // クエリパラメータをURLに追加
    try {
      print(user_name);
      print(user_id);
      print(password);
      print(password_confirmation);

      //http.get ->getリクエスト
      //http.post ->postリクエスト
      //http.put ->putリクエスト
      //http.delete ->deleteリクエスト
      final response = await http.post(
        url,
        //POSt,PUT,DELETの場合でbodyは以下のように指定する
        headers: {
          'Content-Type': 'application/json', // ヘッダーの設定
        },
        body: json.encode({
          'user': {
            'user_id': user_id,
            'user_name': user_name,
            'password': password,
            'password_confirmation': password_confirmation
          }
        }),
      );
      //レスポンス確認用のprint
      // print(response.body);
      if (response.statusCode == 201) {
        // JSONをデコードしてマップ形式に変換
        final Map<String, dynamic> data = json.decode(response.body);
        return [
          response.statusCode,
          data['id'],
          data['user_id'],
          data['user_name']
        ];
      } else {
        print('新規登録失敗: ${response.statusCode}');
        //失敗した場合はstatusCodeを返す
        return [response.statusCode];
      }
    } catch (e) {
      print('エラーが発生しました: $e');
      print(e);
      return [];
    }
  }

  //ユーザ検索のGETリクエスト
  Future<List<dynamic>> UserSearch(String user_id) async {
    final url = Uri.parse('$_baseUrl/users/search?search_user_id=$user_id');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        if (data.isNotEmpty) {
          int id = data[0]['id'];
          String user_id = data[0]['user_id'];
          String user_name = data[0]['user_name'];
          return [id, user_id, user_name];
        } else {
          print('レスポンスは空です。');
          return [];
        }
      } else {
        print('検索失敗: ${response.statusCode}');
        return [response.statusCode];
      }
    } catch (e) {
      print('エラーが発生しました: $e');
      return [];
    }
  }

  //曲検索のリクエスト
  //{response[0]["id"]}このようにすると1曲目のidを知れる
  Future<List<dynamic>> TrackSearch(String track_name) async {
    final url = Uri.parse(
        '$_baseUrl/tracks/search?track_name=$track_name'); // クエリパラメータをURLに追加
    try {
      final response = await http.get(url);

      //レスポンス確認用のprint
      // print(response.body);
      if (response.statusCode == 200) {
        // JSONをデコードしてマップ形式に変換 ----------------------------------<
        final List<dynamic> data = json.decode(response.body);

        // データを処理して、必要な情報をリストに格納
        List<Map<String, dynamic>> trackList = [];

        for (var track in data) {
          String trackId = track['id'];
          String trackName = track['track_name'];
          String imageUrl = track['image_url'];

          // アーティスト情報をすべて取得
          List<String> artistNames = [];
          for (var artist in track['artists']) {
            artistNames.add(artist['name']);
          }

          // 必要な情報をマップにして追加
          trackList.add({
            'id': trackId,
            'track_name': trackName,
            'artists': artistNames, // 複数のアーティスト名をリストに格納
            'image_url': imageUrl,
          });
        }

        return trackList; // 最終的なトラック情報リストを返す
      } else {
        print('検索失敗: ');
        return [];
      }
    } catch (e) {
      print('エラーが発生しました: $e');
      print(e);
      return [];
    }
  }
}
