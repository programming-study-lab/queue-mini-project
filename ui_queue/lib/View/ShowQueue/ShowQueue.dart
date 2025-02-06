import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_queue/process/Queue.dart';

class ShowQueue extends StatefulWidget{
  State<ShowQueue> createState() => ShowQueueState();
}

class ShowQueueState extends State<ShowQueue>{
  Queue q = Queue();
  // Future<Widget> test () async {
  //   List a = q.peekAll();
  //   a.map((e) {
  //     return Text(e);
  //   },).toList();
  // }

  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text('คิวที่เหลือทั้งหมด'),),
    body: queue_list(),
  );

  Widget showQueue() => ListView(
    children: [
      Container(
        height: 20,
        color: Colors.orange,

      ),
      Container(
        height: 20,
        color: Colors.indigo,
      ),
    ],
  );

    Widget queue_list() {
      List queue_data = q.peekAll();
      print(q.peekAll().length);
      return ListView.builder(
        itemCount: queue_data.length,
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
            child: Container(
              height: 100,
              width: double.infinity,
            ),
          );
        },
      );
    }

}