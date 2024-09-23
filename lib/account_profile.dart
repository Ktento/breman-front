// account_profile.dart

import 'package:flutter/material.dart';

class AccountProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('アカウントプロフィール'),
      ),
      body: Center(
        child: Text('これはアカウントプロフィールページです'),
      ),
    );
  }
}
