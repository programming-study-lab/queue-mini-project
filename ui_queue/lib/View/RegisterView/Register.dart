
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_queue/HomePage.dart';

class Register extends StatefulWidget {
  State<Register> createState() => RegisterState();
}

class RegisterState extends State<Register> {
  // var phone
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text('เข้าคิว',),),
    body: Container(
      child: Column(
        children: [
          phone_number(),
          first_name_text(),
          last_name_text(),
          user_type(),
          SizedBox(height: 20,),
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

  // Widget user_type() => TextField(
  //   controller: TextEditingController(),
  //   decoration: InputDecoration(
  //       hintText: 'กลุ่มตามเงื่อนไขของรัฐบาล',
  //       border: OutlineInputBorder()
  //   ),
  // );

  Widget user_type() {
    final type = ['กลุ่มผู้สูงอายุ','กลุ่มผู้มีรายได้น้อย','กลุ่มเกษตรกร'];
    return DropdownButtonFormField(
        items: type.map((e) {
          return DropdownMenuItem(child: Text(e), value: e,);
        },).toList(),
        decoration: InputDecoration(
          hintText: "คลิกเพื่อเลือกกลุ่มตามเงื่อนไขของรัฐบาล"
        ),
        onChanged: (v) {}
    );
  }

  Widget submit_button() => ElevatedButton(
      onPressed: () => {
        Navigator.push(
            context, MaterialPageRoute(
            builder: (context) => HomePage(),
        )
        )
      },
      child: Text("ลงทะเบียน"));


}