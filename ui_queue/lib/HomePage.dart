import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_queue/View/AppbarView/AppBar.dart';
import 'package:ui_queue/View/LoginView/LoginPage.dart';
import 'package:ui_queue/View/MenuView/MenuBar.dart';
import 'package:ui_queue/View/RegisterView/Register.dart';
import 'package:ui_queue/View/ShowQueue/ShowQueue.dart';
import 'package:ui_queue/model/QueueData/QueueDataModel.dart';
import 'package:ui_queue/process/Queue.dart';
import 'package:ui_queue/ShareData/UserData.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  // List<QueueDataModel> queue_data = []; // ใส่ Type ตาม คลาสที่จะใช้งาน (QueueDataModel)
  // List<QueueDataModel> de_queue_datas = []; // ใส่ Type ตาม คลาสที่จะใช้งาน (QueueDataModel)
  // String outputQueue = test();
  Queue q = Queue();

  Map<String, dynamic>? a;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   show_one();
  //   fetchQueueDatas();
  //   // deQueueDatas();
  // }


  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: appBar(context, 'จองคิว'),
      body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              // display_home(),
              SizedBox(height: 200, width: 1200,),
              column2(),
              SizedBox(height: 25,),
              column3(),
              SizedBox(height: 25,),
              routeRegisterPage(),
              SizedBox(height: 25,),
              routeShowAllQueuePage(),
              SizedBox(height: 25,),
              deQueue(),
            ],
          ),
      ),drawer: menu_bar(context),
  );

  Widget column2() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('ชื่อในการจองคิว',
            textScaler: TextScaler.linear(1.5),
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold
            ),
          )
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(Icons.star, color: Colors.orange,),
          Text('999'),
        ],
      ),
    ],
  );

  Widget column3() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        ],
      ),
    ],
  );

  Widget enQueue() => OutlinedButton(
    onPressed: () => setState(() {
      // q.enqueue(data);
    },),
    child: Text('เข้าคิว'),
    style: TextButton.styleFrom(
      foregroundColor: Colors.orange
    ),
  );



  // Widget display_home() {
  //   List<dynamic> s = a!['queue'];
  //   return Text('a', textScaler: TextScaler.linear(1.5),);
  // }


  // Widget queeu_all() => TextButton(
  //     onPressed: () => {
  //       Navigator.push(context, MaterialPageRoute(
  //           builder: (context) => ShowQueue()))},
  //     child: Text("คิวที่เหลือทั้งหมด"));

  Widget routeRegisterPage() {
    return FloatingActionButton.extended(
      // onPressed: navigatorToAddPage,
      onPressed: () {
        navigatorToAddPage();
      },
        label: Text("เข้าคิว", textScaler: TextScaler.linear(1.5),),
    );
  }

  void navigatorToAddPage() {
    final route = MaterialPageRoute(
      // builder: (context) => Register(),
      builder: (context) => Register(),
    );
    Navigator.push(context, route);
  }

  Widget routeShowAllQueuePage() {
    return FloatingActionButton.extended(
      onPressed: navigatorToAllQueue,
      label: Text("คิวทั้งหมด", textScaler: TextScaler.linear(1.5),),
    );
  }

  void navigatorToAllQueue() {
    final route = MaterialPageRoute(
      builder: (context) => ShowQueue(),
    );
    Navigator.push(context, route);
  }

  // Widget deQueuev1() => OutlinedButton(
  //   onPressed: () => setState(() {
  //     (q.isEmpty())?display == 'รอคิว...': display = q.dequeue() ;
  //   }),
  //   child: Text('เรียกคิว'),
  //   style: TextButton.styleFrom(
  //       foregroundColor: Colors.orange
  //   ),
  // );

  Widget deQueue() {
    return FloatingActionButton.extended(
      onPressed: () => {deLelete()},
      label: Text("เรียกคิว", textScaler: TextScaler.linear(1.5),),
    );
  }

  // Widget TestButton() {
  //
  //   return ElevatedButton(
  //       onPressed: () => show_one,
  //       child: Text("Test"));
  // }


  // Future<void> fetchQueueDatas() async {
  //   final response = await QueueDataModel.getData(); //ต้องใส่ static ใน Future getData
  //   setState(() {
  //     queue_data = response;
  //   });
  // }
  // Future<void> deQueueDatas() async {
  //   QueueDataModel.deteleData(q.front); //ต้องใส่ static ใน Future getData
  //
  // }

  // Future<void> show_one() async {
  //   print("open");
  //   String url = 'http://127.0.0.1:8000/api/v1/queue';
  //   final uri = Uri.parse(url);
  //   final response = await http.get(uri);
  //   final body = response.body;
  //   final json = jsonDecode(body) as Map<String, dynamic>;
  //
  //   setState(() {
  //     a = json;
  //   });
  //   Map<String, dynamic> s = a!['queue'];
  // print(s!['first_name']);
  // print("Close");
  // }

  Future<void> deLelete() async {

    print("open: ${q.getFront()}");
    String url = 'http://127.0.0.1:8000/api/v1/queue_delete/${q.getFront()}';
    final uri = Uri.parse(url);
    final response = await http.delete(uri);
    final body = response.body;
    print("Close");
  }

}



