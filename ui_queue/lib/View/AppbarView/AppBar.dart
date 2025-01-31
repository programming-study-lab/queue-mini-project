import 'package:flutter/material.dart';
import 'package:ui_queue/HomePage.dart';
import 'package:ui_queue/View/LoginView/LoginPage.dart';

AppBar appBar(BuildContext context, String title) {
  Function login = () =>
  {
    Navigator.push(
        context, MaterialPageRoute(
      builder: (context) => LoginPage(),))
        .then((value) => Text('เข้าสู่ระบบแล้ว'),)
  };

  Function logout = () => {
    Navigator.of(context).popUntil(
      (route) => route.isFirst,
    )
  };

  return AppBar(
    title: Text(title),
    actions: [
      IconButton(
          onPressed: () => login(),
          icon: Icon(Icons.login, size: 30,))
    ],
  );
}