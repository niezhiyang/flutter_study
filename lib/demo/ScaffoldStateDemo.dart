import 'package:flutter/material.dart';

class ScaffoldStateDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ScaffoldStateDemo();
}

// SingleTickerProviderStateMixin 暂时不知道啥意思 先保留
class _ScaffoldStateDemo extends State with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("ScaffoldStateDemo"),
      ),
      body: RaisedButton(
        child: Text('显示snackbar'),
        onPressed: _showSnackBar,
      ),
    );
  }

  _showSnackBar() {
    _scaffoldKey.currentState
        .showSnackBar(SnackBar(content: Text("通过ScaffoldState打开的")));
  }
}
