import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_queue/View/AppbarView/AppBar.dart';
import 'package:ui_queue/View/LoginView/LoginPage.dart';
import 'package:ui_queue/View/MenuView/MenuBar.dart';
import 'package:ui_queue/View/RegisterView/Register.dart';
import 'package:ui_queue/View/ShowQueue/ShowQueue.dart';
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
  String display = 'คิวว่าง';

  Future<void> readQueue() async {
    String queue_data = await rootBundle.loadString(q.peekAll().toString());
    print(queue_data);
  }


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
              // display_AllQuque(),

              SizedBox(height: 200, width: 1200,),
              column2(),
              input_name(),
              enQueue(), deQueue(),
              queeu_all(),
              SizedBox(height: 25,),
              column3(),routeRegisterPage(),
              SizedBox(height: 25,)
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
      q.enqueue(data);
    },),
    child: Text('เข้าคิว'),
    style: TextButton.styleFrom(
      foregroundColor: Colors.orange
    ),
  );

  Widget deQueue() => OutlinedButton(
    onPressed: () => setState(() {
      (q.isEmpty())?display == 'รอคิว...': display = q.dequeue() ;
    }),
    child: Text('เรียกคิว'),
    style: TextButton.styleFrom(
        foregroundColor: Colors.orange
    ),
  );

  Widget display_home() => Text(
      'คิวของ: ${display}', textScaler: TextScaler.linear(5),
  );

  Widget display_AllQuque() => Text(
    'คิวทั้งหมด: ${show_queue()}', textScaler: TextScaler.linear(2),
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

  Widget show_queue() => ListView.builder(
    itemCount: 10,
    itemBuilder: (context, index) => Card(
      elevation: 10,
      shape: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black12)
      ),
      child: ListTile(
        title: Text('data'),
      ),
    ),
  );

  Widget queeu_all() => TextButton(
      onPressed: () => {
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => ShowQueue()))},
      child: Text("คิวที่เหลือทั้งหมด"));

  Widget routeRegisterPage() {
    return FloatingActionButton.extended(
        onPressed: navigatorToAddPage,
        label: Text("เข้าคิว", textScaler: TextScaler.linear(1.5),),
    );
  }

  void navigatorToAddPage() {
    final route = MaterialPageRoute(
        builder: (context) => Register(),
    );
    Navigator.push(context, route);
  }

}



