import 'package:flutter/material.dart';
import 'package:ui_queue/HomePage.dart';
import 'package:ui_queue/View/ShowQueue/ShowQueue.dart';

void main() => runApp(QueueApp());

class QueueApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: HomePage(),
      // home: ShowQueue(),
      );
}
