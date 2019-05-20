import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CheckBoxDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("CheckBox"),
        centerTitle: true,
      ),
      body: _Stateful(),
    );
  }
}

class _Stateful extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CheckBoxState();
  }
}

class _CheckBoxState extends State {
  bool _isCheck;
  bool _isMale;
  bool _isFemale;
  bool _checkboxListChecked;
  bool _checkboxList2Checked;

  @override
  void initState() {
    super.initState();
    _isCheck = false;
    _isMale = true;
    _isFemale = false;
    _checkboxListChecked = false;
    _checkboxList2Checked = false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        Text("一：Checkbox",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        Checkbox(
//          tristate: true,
          // 这个值不能是null(除非上面 tristate 是true) ， 用来设置 此 checkbox 是否选中
          value: _isCheck,
          // 勾选后  勾选框填充的颜色 默认是 ThemeData.toggleableActiveColor
          activeColor: Colors.red,
          // 对勾的颜色  默认的是白色
          checkColor: Colors.blue,
          // 是否选中发生变化时的回调， 回调的 bool 值 就是是否选中
          // true 就是选中
          onChanged: (isCheck) {
            if (isCheck) {
              Fluttertoast.showToast(msg: "改变了：$isCheck");
            }
            _isCheck = isCheck;
            //改变_CheckBoxState
            setState(() {});
          },
        ),
        Text("用checkbox实现单选，其实就是改值",
            style: TextStyle(fontWeight: FontWeight.bold)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text("男"),
                Checkbox(
                  value: _isMale,
                  onChanged: (isMan) {
                    setState(() {
                      if (isMan) {
                        _isMale = true;
                        _isFemale = false;
                      }
                    });
                  },
                )
              ],
            ),
            SizedBox(
              width: 20,
            ),
            Row(
              children: <Widget>[
                Text("女"),
                Checkbox(
                  value: _isFemale,
                  onChanged: (isFemale) {
                    setState(() {
                      if (isFemale) {
                        _isFemale = true;
                        _isMale = false;
                      }
                    });
                  },
                )
              ],
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Text("二：CheckboxListTile",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        SizedBox(
            width: 250,
            child: Column(
              children: <Widget>[
                CheckboxListTile(
                  // 必须要的属性
                  value: _checkboxListChecked,
                  //是否选中发生变化时的回调， 回调的 bool 值 就是是否选中 , true 是 选中
                  onChanged: (isCheck) {
                    Fluttertoast.showToast(msg: "选的$isCheck");
                    setState(() {
                      _checkboxListChecked = isCheck;
                    });
                  },
                  // 选中时 checkbox 的填充的颜色 ，
                  //      selected 如果是 true ：
                  //                如果 不设置 title 和 subtitle 中 text 的 color 的话， text的颜色 跟随 activeColor
                  activeColor: Colors.red,
                  // 标题， 具有代表性的就是 Text ，
                  //        selected 如果是 true ：
                  //         如果 不设置 text 的 color 的话， text的颜色 跟随 activeColor
                  title: Text(
                    "标题",
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                  // 副标题（在 title 下面）， 具有代表性的就是 Text ， 如果 不设置 text 的 color 的话， text的颜色 跟随 activeColor
                  subtitle: Text("副标题"),
                  // 是否是三行文本
                  //        如果是 true ： 副标题 不能为 null
                  //        如果是 false：
                  //                      如果没有副标题 ，就只有一行， 如果有副标题 ，就只有两行
                  isThreeLine: true,
                  // 是否密集垂直
                  dense: false,
                  // 左边的一个控件
                  secondary: Text("secondary"),
                  // text 和 icon 的 color 是否 是 activeColor 的颜色
                  selected: false,
                  controlAffinity: ListTileControlAffinity.trailing,
                ),
                CheckboxListTile(
                  onChanged: (isCheck) {
                    setState(() {
                      _checkboxList2Checked = isCheck;
                    });
                  },
                  selected: false,
                  value: _checkboxList2Checked,
                  title: Text("标题2"),
                  controlAffinity: ListTileControlAffinity.leading,
                )
              ],
            )),
      ],
    );
  }
}
