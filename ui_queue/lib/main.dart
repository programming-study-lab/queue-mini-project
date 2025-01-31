import 'package:flutter/material.dart';
import 'package:ui_queue/HomePage.dart';

void main() => runApp(QueueApp());

class QueueApp extends StatelessWidget {
  const QueueApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: HomePage(),
      );
}
