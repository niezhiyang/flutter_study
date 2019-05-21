## 一。   **TextFiled**
**flutter控件练习demo地址**：[github](https://github.com/niezhiyang/flutter_study)
### 1.1 **TextFiled简介**
> **Text：** 文本输入框，相当于 android 中的 EditText 和 Ios 中的 UITextField

### 1.2 **基本属性**
#### 1.2.1 重点属性
- **controller** 控制器，可以拿到 TextFiled 的文本和清除文本框内容。如果用户没有设置此属性，TextField 自动会设置个默认的
- **decoration = const InputDecoration**装饰TextFiled，默认下面有一条横线，可以有icon ，error ，hint 文字等等
- **keyboardType**  当获取焦点，打开软键盘的时候优先打开的类型(注意，不是锁定类型， 还是可以切换的)
    - TextInputType.text  文本
    - TextInputType.number 数字 
    - TextInputType.emailAddress 等等等
- **style** 输入文本的样式
- **autofocus = false** 是否自动获取焦点，，默认是false
- **obscureText = false** 是否以密码格式为输入，默认是false
- **maxLength** 限制文本最大长度。同时右下角会出现 当前长度和最大长度 ，比如手机号11位 
- **onChanged** 文本变化之后的回调 方法参数是 String
- **inputFormatters** 限制文本输入的类型，总共有两种 正则表达式<br>(比如：只能是数字)  ```inputFormatters: [WhitelistingTextInputFormatter (RegExp("[1234567890]"))]``` package:flutter/services.dart 别忘了导包
    -  WhitelistingTextInputFormatter （白名单） 只能输入 以下内容
    - BlacklistingTextInputFormatter （黑名单） 除了 以下内容 全部都能输入
- **onTap**  文本框点击事件

#### 1.2.2 不常用属性
- **focusNode** 控制焦点的
- **textInputAction**软键盘里面显示的样式（软键盘的功能键）。比如 TextInputAction.go（开始） TextInputAction.search（搜索）TextInputAction.next（下一步）<br>

![](https://user-gold-cdn.xitu.io/2019/5/7/16a9210a4763a7b6?w=970&h=627&f=png&s=75322)

- **onEditingComplete** 当点击软键盘里面的（软键盘的功能键） 下一步 或者 搜索 或者 开始 等等的时候
- **onSubmitted**  当点击软键盘里面的（软键盘的功能键） 下一步 或者 搜索 或者 开始 等等的时候  参数是 String 也就是 TextField 的文本<br>
当 onSubmitted 和 onEditingComplete 同时出现的时候 onEditingComplete属性被忽略 不起作用
- **textAlign = TextAlign.start** 文本对齐方式
- **textDirection** 文本流向
- **autocorrect = true** 是否自动更正，默认是true
- **maxLines = 1** 是说文本框的大小是 几个文本的高度，文本框高度固定的 
- **maxLengthEnforced = true** 限制文本maxLength是否失效。但是还是会出现右下角会出现 当前长度和最大长度
- **cursorWidth = 2.0** 光标的宽度  默认是 2.0
- **cursorRadius** 光标的圆角 此属性 要把 cursorWidth 设置大一点才能看出来
- **cursorColor** 光标的颜色
- **keyboardAppearance** 只用在ios
- **enabled** 是否禁用

### 1.3 demo图片
![](https://user-gold-cdn.xitu.io/2019/5/7/16a921e534feefac?w=320&h=640&f=gif&s=1448819)

### 1.4 demo代码
**注意：** 本代码 引用了个第三方 toast ，在 pubspec.yaml 中 加入 fluttertoast: ^3.0.4
```
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TextFieldDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TextFieldStateDemo();
  }
}

class TextFieldStateDemo extends State {
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    _pressed() {
      Fluttertoast.showToast(
          msg: _controller.text,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 1,
          textColor: Colors.white);
      print(_controller.text);
    }

    _clear() {
      _controller.clear();
    }

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("TextField"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
                //控制器，可以拿到 TextFiled 的文本和清除文本框内容。如果用户没有设置此属性，TextField 自动会设置个默认的
                controller: _controller,
                // keyboardType 当获取焦点，打开软键盘的时候优先打开的类型
                keyboardType: TextInputType.number,
                // 软键盘里面显示的样式（软键盘的功能键），比如 TextInputAction.go（开始） TextInputAction.search（搜索）TextInputAction.next（下一步）
                textInputAction: TextInputAction.next,
                // 输入文本的样式，与 lableText hitetext 无关
                style: TextStyle(color: Colors.red),
                // 文本对齐方式
                textAlign: TextAlign.start,
                //是否自动获取焦点，，默认是false
                autofocus: false,
                // 是否以密码格式为输入
//                obscureText: true,
                //是否自动更正
                autocorrect: true,
                // 是说文本框的大小是 几个文本的高度，文本框高度固定的
                maxLines: 1,
                // 限制文本最大长度。同时右下角会出现 当前长度和最大长度 ，比如手机号11位
                maxLength: 11,
                // 限制文本maxLength是否失效。但是还是会出现右下角会出现 当前长度和最大长度
//                maxLengthEnforced: false,
                // 文本变化之后的回调 方法参数是 String
//                onChanged: (String textAfterChanged) {
//                  Fluttertoast.showToast(
//                    msg: textAfterChanged,
//                  );
//                },

                // 当点击软键盘里面的（软键盘的功能键） 下一步 或者 搜索 或者 开始 等等的时候  参数是 String 也就是 TextField 的文本
                onSubmitted: (String s) {
                  Fluttertoast.showToast(
                    msg: s,
                  );
                },
                // 当点击软键盘里面的（软键盘的功能键） 下一步 或者 搜索 或者 开始 等等的时候
                // 当 onSubmitted 和 onEditingComplete 同时出现的时候 onEditingComplete属性被忽略 不起作用
                onEditingComplete: () {
                  Fluttertoast.showToast(
                    msg: "输入完毕",
                  );
                },
                // 限制文本输入的类型 总共有两种 正则表达式
                // WhitelistingTextInputFormatter （白名单） 只能输入 以下内容
                // BlacklistingTextInputFormatter （黑名单） 除了 以下内容 全部都能输入
                //上面两个属于 package:flutter/services.dart 别忘了导包
                inputFormatters: [
                  WhitelistingTextInputFormatter(RegExp("[1234567890]"))
                ],
                // 是否禁用
                enabled: true,
                // 光标的宽度  默认是 2.0
//                cursorWidth: 20,
                // 光标的圆角 此属性 要把 cursorWidth 设置大一点才能看出来
//                cursorRadius: Radius.circular(20),
                // 光标的颜色
                cursorColor: Colors.blue,
//                keyboardAppearance: Brightness.dark,
                // 文本框点击事件
                onTap: () {
//                  Fluttertoast.showToast(
//                    msg: "点击我了",
//                  );
                },
                decoration: InputDecoration(
                  icon: Icon(Icons.account_circle),
//                  fillColor: Colors.red,
//                  // 填充的颜色
//                  filled: true,
                  // 是否有填充颜色  默认是false
                  labelText: "用户名",
                  hintText: "请输入用户名",
                )),
            TextField(
                decoration: InputDecoration(
              icon: Icon(Icons.lock),
              labelText: "密码",
              hintText: "请输入密码",
            )),
            RaisedButton(
              onPressed: _pressed,
              child: Text("显示TextField文字"),
            ),
            RaisedButton(
              onPressed: _clear,
              child: Text("清除TextField文字"),
            )
          ],
        ),
      ),
    );
  }
}

```




