import 'package:ui_queue/View/AppbarView/AppBar.dart';
import 'package:ui_queue/View/MenuView/MenuBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_queue/HomePage.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: appBar(context, 'Login'),
    body: Container(
      child: Column(
        children: [
          phone(),
          pass_text(),
          button_submit()
        ],
      ),
    ),drawer: menu_bar(context),
  );

  Widget pass_text() => TextField(
    controller: TextEditingController(),
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      hintText: 'รหัสผ่าน',
    ),
  );

  Widget phone() => TextField(
    controller: TextEditingController(),
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      hintText: 'เบอร์โทรศัพท์',
    ),
  );
  
  Widget button_submit() => TextButton(
      onPressed: () => {
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => HomePage()))},
      child: Text("เข้าสู่ระบบ"));
}