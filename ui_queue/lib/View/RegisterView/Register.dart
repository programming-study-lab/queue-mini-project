
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_queue/HomePage.dart';
import 'package:http/http.dart' as http;
import 'package:ui_queue/process/Queue.dart';

class Register extends StatefulWidget {
  State<Register> createState() => RegisterState();
}

class RegisterState extends State<Register> {
  Queue q = Queue();
  TextEditingController first_name = TextEditingController();
  TextEditingController last_name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController type = TextEditingController();
  String type_data = '';
  TextEditingController descriptionController = TextEditingController();
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
    controller: first_name,
    decoration: InputDecoration(
      hintText: 'ชื่อ',
      border: OutlineInputBorder()
    ),
  );

  Widget last_name_text() => TextField(
    controller: last_name,
    decoration: InputDecoration(
      hintText: 'นามสกุล',
      border: OutlineInputBorder()
    ),
  );

  Widget phone_number() => TextField(
    controller: phone,
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
    var data = ['กลุ่มผู้สูงอายุ','กลุ่มผู้มีรายได้น้อย','กลุ่มเกษตรกร'];
    return DropdownButtonFormField(
        items: data.map((e) {
          return DropdownMenuItem(child: Text(e), value: e,);
        },).toList(),
        decoration: InputDecoration(
          hintText: "คลิกเพื่อเลือกกลุ่มตามเงื่อนไขของรัฐบาล"
        ),
        onChanged: (value) {
          type_data = value as String;
        },
    );
  }

  Widget submit_button(){

    return ElevatedButton(
        onPressed: () {
          submitData();
          navigatorToHomePage();
        },
        child: Text('ลงทะเบียน'));
  }

  void navigatorToHomePage() {
    final route = MaterialPageRoute(
      // builder: (context) => Register(),
      builder: (context) => HomePage(),
    );
    Navigator.push(context, route);
  }

  void test() {
    print('test');
  }

  Future<void> submitData () async {
    print("Check 1");
    q.enqueue(first_name.text);
    print('Rear: ${q.rear}');
    print('Front: ${q.front}');
    final firstName = first_name.text;
    final lastName = last_name.text;
    final _phone = phone.text;
    final _type = type_data;
    final queueStatus = 1;
    final queueNumber = q.rear;
    final body = {
      "first_name": firstName,
      "last_name": lastName,
      "phone": _phone,
      "type": _type,
      "queue_status": queueStatus,
      "queue_number": queueNumber
    };

    // final body = {
    //   "first_name": 'dd',
    //   "last_name": 'dd',
    //   "phone": 'dd',
    //   "type": 'dd',
    //   "queue_status": 1,
    //   "queue_number": 666
    // };
    final url = 'http://127.0.0.1:8000/api/v1/register';
    final uri = Uri.parse(url);
    final response = await http.post(
      uri,
      body: jsonEncode(body),
      headers: {'Content-Type' : 'application/json'}
    );
  if (response.body != 200 || q.rear >= q.max) {
    print('err');
  } else{
    print('Successfully.');
    print(response.body);
    print(response.statusCode);
  }


  }


}