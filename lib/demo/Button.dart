import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Button"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            MaterialButton(
              // onPressed不能设置null  相当于用户按下时（高亮） 或者 松开时（不高亮）的监听。 也就是 MaterialButton 样式改变时
//              onHighlightChanged: (boo) {
//                Fluttertoast.showToast(
//                    msg: "onHighlightChanged改变了", textColor: Colors.white);
//              },
              child: Text("MaterialButton"),
              // 按下之后松开的回调，也就是所谓的点击事件。其实是当用户手抬起来时的动作
              onPressed: () {
                Fluttertoast.showToast(
                    msg: "点击MaterialButton", textColor: Colors.white);
              },
//              onPressed: null,
              // 里面文本的颜色
//              textColor: Colors.red,
              // 当状态为 disable的时候 文本的颜色，onpress=null 为disable
              // 在这里we；
              //在这里无效 在它子类有效（RaisedButton ，FlatButton ，OutlineButton ）
//              disabledTextColor: Colors.black,
              // 设置边框样式 , 在MaterialButton这里没用 在它子类里面有用
//              shape: Border.all(
//                width: 10,
//                color:Color(0xFFFF0000),
//                style: BorderStyle.solid,
//              ),
              // 当是 enable （onpress != null） 背景 ，有阴影，有圆角
              //在这里无效 在它子类有效（RaisedButton ，FlatButton ，OutlineButton ）
              shape: Border.all(
                  color: Color(0xFFFF0000), style: BorderStyle.solid, width: 2),
              color: Colors.grey,
              // onpress = null 的时候的颜色（不知道为什么不管用）
              // 我测试的结果是 当onPress = null 的时候 ，还是 上面 color 属性的颜色， 只不过是没有阴影，没有圆角而已
              // 在这里无效 在它子类有效（RaisedButton ，FlatButton ，OutlineButton ）
//              disabledColor: Colors.amberAccent,
              // 当用户 按下高亮时 的颜色
//              highlightColor: Colors.red,
//              splashColor: Colors.deepPurple,
//              colorBrightness: Brightness.light,
              // 高度， 阴影 默认是2
              elevation: 2,
              // 高亮时的阴影 默认是 8  button 被按下的时候
//              highlightElevation: 14,
              // 当 disabled （onpress = null） 的阴影   默认是0
              // 测试的时候 阴影还是 为0.0
              //在这里无效 在它子类有效（RaisedButton ，FlatButton ，OutlineButton ）
//              disabledElevation: 20,
//              padding: EdgeInsets.all(20),
              // 最小的宽度 默认是 88 。 在 ButtonTheme 规定的
//              minWidth: 187,
              //  高度， 默认是 36 也是在 ButtonTheme 规定的
//              height: 1,
            )
          ],
        ),
      ),
    );
  }
}

class RaiseButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Button"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            MaterialButton(
              child: Text("MaterialButton"),
              // 按下之后松开的回调，也就是所谓的点击事件。其实是当用户手抬起来时的动作
              onPressed: () {
                Fluttertoast.showToast(
                    msg: "点击MaterialButton", textColor: Colors.white);
              },
//              shape: Border.all(
//                // 设置边框样式
//                width: 10,
//                color:Color(0xFFFF0000),
//                style: BorderStyle.solid,
//              ),
              shape: Border.all(
                  color: Color(0xFFFF0000),
                  style: BorderStyle.solid,
                  width: 10),
              color: Colors.grey,
              elevation: 2,
            ),
            RaisedButton(
              disabledColor: Colors.blue,
              onPressed: () {
                Fluttertoast.showToast(
                    msg: "点击RaisedButton", textColor: Colors.white);
              },
              child: Text("RaisedButton 方式1"),
            ),
            Row(
              children: <Widget>[
                RaisedButton(
                  onPressed: () {},
                  child: Text("1"),
                  shape: Border.all(
                      color: Colors.red, width: 2, style: BorderStyle.solid),
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text("1"),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: Colors.red,
                          width: 2,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text("1"),
                  shape: StadiumBorder(
                    side: BorderSide(
                        color: Colors.red, width: 2, style: BorderStyle.solid),
                  ),
                ),
                RaisedButton(
                    onPressed: () {},
                    child: Text("1"),
                    shape: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.red,
                            style: BorderStyle.solid,
                            width: 2))),
              ],
            ),
            RaisedButton.icon(
                onPressed: () {
                  Fluttertoast.showToast(
                      msg: "点击RaisedButton", textColor: Colors.white);
                },
                icon: Icon(Icons.add),
                label: Text("RaisedButton.icon的方式"),
                // 一个矩形边框
//              shape: Border.all(
//                width: 2,
//                color: Colors.red,
//                style: BorderStyle.solid,
//              ),
                // 可以设置四个角的弧度的边框
//              shape: RoundedRectangleBorder(
//                side: BorderSide(
//                  width: 2,
//                  color: Colors.red,
//                  style: BorderStyle.solid,
//                ),
//                borderRadius: BorderRadius.all(Radius.circular(5)),
//              ),
                // 只有下面一个边框
//              shape:  UnderlineInputBorder( borderSide:BorderSide(color: Colors.red, style: BorderStyle.solid, width: 2)),
                // 圆形边框（这里会裁剪他）
//                shape: CircleBorder(side: BorderSide(color: Colors.red, style: BorderStyle.solid, width: 2))
                // 把高或者宽弄成半圆
//            shape: StadiumBorder(side: BorderSide(width: 2, style: BorderStyle.solid, color: Color(0xFF00FFFF))),
                // 剪切四个角
                shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    side: BorderSide(
                        color: Colors.red,
                        style: BorderStyle.solid,
                        width: 2))),
            FlatButton(
                child: Text("flatbutton"),
                color: Colors.blue,
                onPressed: () {}),
            OutlineButton(
              disabledBorderColor: Colors.grey,
              highlightedBorderColor: Colors.red,
              child: Text("outlinebuton"),
              onPressed: () {},
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                IconButton(
                    // 必须的参数 一般是 Icon 或者是 ImageIcono
//                icon: Icon(Icons.add),
                    icon: Icon(Icons.add),
                    // 点击事件
                    onPressed: () {},
                    // 按钮不可点击时的颜色
                    disabledColor: Colors.red,
                    //icon 的大小
                    iconSize: 40,
                    //   围绕在 icon 周围的  padding ， 周围的padding也可以响应点击事件，手势事件
                    padding: EdgeInsets.all(0),
                    // icon 在 IconButton 中的位置
                    alignment: Alignment.center,
                    // icon 的颜色  如果里面是 Text ，text的颜色不会改变 注意 不是背景色， 就是icon的颜色
                    color: Colors.red,
                    // 高亮时的背景颜色
                    highlightColor: Colors.blue,
                    // 按下瞬间的颜色 加入从手指按下之后 先是 splashColor然后再是 highlightColor
                    splashColor: Colors.black,
                    // 默认没有长按提示
                    tooltip: "长按的提示"),
                // 就是一个iconbutton 设置了一返回箭头的icon
                BackButton(),
                // 就是一个iconbutton 设置了一 x 关闭的icon
                CloseButton(),
              ],
            ),
            PopupMenuButton(
                // 初始的value ， 就是打开的时候， 在这个value 里面会有不同的样式，让你知道当前值
//                initialValue: "item1",
                // 点击返回键，或者是点击外部， popupmenu关闭时的回调
                onCanceled: () {
                  Fluttertoast.showToast(msg: "取消选择了", textColor: Colors.white);
                },
                // 选择时的回调
                onSelected: (String value) {
                  Fluttertoast.showToast(
                      msg: "选择的值是：$value", textColor: Colors.white);
                },
                // 如果 icon 和 child 属性都没有设置值，flutter会根据不同的平台 给一个icon ，android 中是三个点
                // icon 和 child 不能同时设置， 否则报错
                icon: Icon(Icons.menu),
//                child: Text("打开"), 不要设置有点击事件的 控件,比如 FlatButton 等等，因为影响 PopupMenuButton的点击事件
                // 当前 控件 向左 向下平移
                offset: Offset(-20, 50.0),
                itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
                      PopupMenuItem(
                          value: "item1",
                          child: Row(children: <Widget>[
                            Icon(Icons.delete),
                            Text("删除")
                          ])),
                      PopupMenuItem(
                        value: "item2",
                        child: Row(
                            children: <Widget>[Icon(Icons.add), Text("加好友")]),
                        //是否可以选择
                        enabled: true,
                      ),
                    ]),
          ],
        ),
      ),
    );
  }
}
