import 'api.dart';

//注意:使用するときはmain.dartをデバック用に変更する必要あり
Future<void> debugApiService() async {
  final apiService = ApiService();

  // // ログインを試みる
  // var loginResponse = await apiService.login('Kento', 'Kento0721');
  // print('Login Response: $loginResponse');

  // 新規登録を試みる
  // var signUpResponse = await apiService.SignUp(
  //     'new_user_id', 'New User', 'password', 'password');
  // print('Sign Up Response: $signUpResponse');

  // // ユーザ検索を試みる
  // var userSearchResponse = await apiService.UserSearch('Kento');
  // print('User Search Response: $userSearchResponse');

  // // 曲検索を試みる
  // var trackSearchResponse = await apiService.TrackSearch('白日');
  // print('Track Search Response: ${trackSearchResponse[0]}');

  // //曲追加を試みる
  // var trackaddResponse = await apiService.TrackAdd("3CmVQtVx9KlzOuPhRJRShH",
  //     "https://youtu.be/Zo0LfdRwzjk?si=bBHQEsQ7eNPK8Lfl");
  // print('Track Add Response: $trackaddResponse');

// <<<<<<< feature-group_users-from_userid_to_groupid
//   // var from_userid_to_groupid = await apiService.from_userid_to_groupid("1");

//   // print(from_userid_to_groupid);
//   var response = await apiService.from_userid_to_groupid("1");
// =======
//   //ユーザのお気に入り曲の追加を試みる
//   // var usertrackaddResponse = await apiService.UserTrackAdd(
//   //   '1',
//   //   '1',
//   // );
//   // print('User Track Add Response: $usertrackaddResponse');

//   var response = await apiService.from_groupid_to_userid("1");s
}
