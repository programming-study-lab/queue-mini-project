import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ui_queue/View/AppbarView/AppBar.dart';
import 'package:ui_queue/View/LoginView/LoginPage.dart';
import 'package:ui_queue/View/MenuView/MenuBar.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => HomePageState();

}

class HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: appBar(context, 'จองคิว'),
      body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Image.asset('assets/11021.jpg',
                fit: BoxFit.cover,height: 200,width: 1800,),
              // SizedBox(height: 15,),

              column2(),
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
          Text('999')
        ],
      ),
    ],
  );
}
