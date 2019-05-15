import 'package:flutter/material.dart';
import './demo/ScaffoldDemo.dart';
import './demo/ScaffoldStateDemo.dart';
import './demo/BarDemo.dart';
import './demo/SliverAppBarDemo.dart';
import './demo/TextDemo.dart';
import './demo/TextFieldDemo.dart';
import './demo/Button.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
//      home: TextDemo(),
      home: RaiseButtonDemo(),
    );
  }
}




