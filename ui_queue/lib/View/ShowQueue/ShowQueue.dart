import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ui_queue/model/QueueData/QueueDataModel.dart';

class ShowQueue extends StatefulWidget {
  State<ShowQueue> createState() => ShowQueueState();
}

class ShowQueueState extends State<ShowQueue> {
  List<QueueDataModel> queue_data = []; // ใส่ Type ตาม คลาสที่จะใช้งาน (QueueDataModel)
  Widget build(BuildContext context){
    fetchQueueDatas();
    return Scaffold(
      appBar: AppBar(title: Text('คิวทั้งหมด'),),
      body: ListView.builder(
          itemCount: queue_data.length,
          itemBuilder: (context, index) {
            final queue = queue_data[index];

            // final first_name = queue.first_name;
            // final last_name = queue.last_name;
            // final phone = queue.phone;
            // final type = queue.type;
            // final queue_status = queue.queue_status;
            // final queue_number = queue.queue_number;
            return ListTile(
              leading: CircleAvatar(
                child: Text(queue.queue_number.toString()),),
              title: Text('ชื่อ: ${queue.fullname}'),
              subtitle: Text('เบอร์โทร: ${queue.phone} ประเภท: ${queue.type}'),
            );
          },),
      );
  }

  Future<void> fetchQueueDatas() async {
    final response = await QueueDataModel.getData(); //ต้องใส่ static ใน Future getData
    setState(() {
      queue_data = response;
    });
  }
}