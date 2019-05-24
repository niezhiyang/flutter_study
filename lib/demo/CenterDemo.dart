import 'package:flutter/material.dart';

class CenterDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Container"), centerTitle: true),
      body: Column(
        children: <Widget>[
          Center(
            child: RaisedButton.icon(
                icon: Icon(Icons.ac_unit), label: Text("child")),
          ),
          Container(
            height: 50.0,
            width: 50.0,
            color: Colors.blueAccent,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            color: Colors.red,
            child: Padding(
              // 不能为空
              padding: EdgeInsets.all(10.0),
              child: Container(
                height: 50.0,
                width: 50.0,
                color: Colors.blueAccent,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 100,
            height: 100,
            color: Colors.red,
            child: Align(
              alignment: Alignment.topRight,
              child: Icon(Icons.ac_unit),
            ),
          )
        ],
      ),
    );
  }
}
