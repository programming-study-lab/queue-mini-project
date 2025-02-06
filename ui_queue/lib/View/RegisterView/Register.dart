
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_queue/HomePage.dart';

class Register extends StatefulWidget {
  State<Register> createState() => RegisterState();
}

class RegisterState extends State<Register> {
  var phone
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text('Register'),),
    body: Container(
      child: Column(
        children: [
          phone_number(),
          first_name_text(),
          last_name_text(),
          submit_button()
        ],
      ),
    ),
  );


  Widget first_name_text() => TextField(
    controller: TextEditingController(),
    decoration: InputDecoration(
      hintText: 'ชื่อ',
      border: OutlineInputBorder()
    ),
  );

  Widget last_name_text() => TextField(
    controller: TextEditingController(),
    decoration: InputDecoration(
      hintText: 'นามสกุล',
      border: OutlineInputBorder()
    ),
  );

  Widget phone_number() => TextField(
    controller: TextEditingController(),
    decoration: InputDecoration(
      hintText: 'เบอร์โทรศัพท์',
      border: OutlineInputBorder()
    ),
  );

  Widget submit_button() => OutlinedButton(
      onPressed: () => {
        Navigator.push(
            context, MaterialPageRoute(
            builder: (context) => HomePage(),
        )
        )
      },
      child: Text("ลงทะเบียน"));
}