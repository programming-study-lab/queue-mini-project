import 'package:flutter/material.dart';
import 'package:ui_queue/HomePage.dart';
import 'package:ui_queue/View/LoginView/LoginPage.dart';
import 'package:ui_queue/View/RegisterView/Register.dart';
import 'package:ui_queue/View/ShowQueue/ShowQueue.dart';

Drawer menu_bar(BuildContext ctx) => Drawer(
  child: ListView(
    children: [
      UserAccountsDrawerHeader(
          accountName: Text('Tชื่อนามสกุลAPI'),
          accountEmail: Text('เบอร์โทรAPI')),
          TextButton(
              onPressed: () => {Navigator.push(
                  ctx, MaterialPageRoute(
                  builder: (context) => HomePage(),
              ))},
              child: Text('จองคิว')),
          TextButton(onPressed: () => {Navigator.push(
              ctx, MaterialPageRoute(
            builder: (context) => LoginPage(),
          ))}, child: Text('Login')),
          TextButton(
              onPressed: () => {Navigator.push(
                  ctx, MaterialPageRoute(
                  builder: (context) => Register(),
              ))},
              child: Text('ลงทะเบียน')),
          TextButton(onPressed: () => {
            Navigator.push(ctx, MaterialPageRoute(
                builder: (context) => ShowQueue(),
            ))}, child: Text('คิวที่เหลือทั้งหมด'))

    ],
  ),
);