import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ui_queue/View/AppbarView/AppBar.dart';
import 'package:ui_queue/View/LoginView/LoginPage.dart';
import 'package:ui_queue/View/MenuView/MenuBar.dart';
import 'package:ui_queue/process/Queue.dart';
import 'package:ui_queue/ShareData/UserData.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  String outputQueue = test();
  Queue q = Queue();
  var ctl = TextEditingController();
  // UserData userData = UserData();
  String data = '';
  String display = '';


  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: appBar(context, 'จองคิว'),
      body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              // Image.asset('assets/11021.jpg',
              //   fit: BoxFit.cover,height: 200,width: 1800,),
              display_home(),
              SizedBox(height: 200, width: 1200,),
              column2(),
              input_name(),
              enQueue(), deQueue(),
              ElevatedButton(onPressed: ()=>{}, child: Text('test')),
              SizedBox(height: 25,),
              column3(),
              SizedBox(height: 25,)
            ],
          ),
      ),
  );

  Widget column2() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Test',
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
          enQueue(),
        ],
      ),
    ],
  );

  Widget enQueue() => OutlinedButton(
    onPressed: () => setState(() {
      q.enqueue(data);
    },),
    child: Text('เข้าคิว'),
    style: TextButton.styleFrom(
      foregroundColor: Colors.orange
    ),
  );

  Widget deQueue() => OutlinedButton(
    onPressed: () => setState(() {
      display = q.dequeue();
    }),
    child: Text('เรียกคิว'),
    style: TextButton.styleFrom(
        foregroundColor: Colors.orange
    ),
  );

  Widget display_home() => Text(
      'คิวของ: ${display}', textScaler: TextScaler.linear(5),
  );

  Widget input_name() => TextField(
    controller: ctl,
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      hintText: 'ชื่อ'
    ),
    onChanged: (value) =>
    setState(() {
     data = ctl.value.text;
    })
  );

  Widget list_view() => ListView(
      padding: EdgeInsets.all(15),


  );


}



