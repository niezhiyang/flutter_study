**flutter控件练习demo地址**：[github](https://github.com/niezhiyang/flutter_study)
## 一。Radio (单选框)
> flutter 中的单选框 ， 和 Checkbox 一样 本身没有状态，必须父亲有状态 才能改变值
### 1.1 属性
- **value：** 此 Radio 的 value 值
- **onChanged：** 当选择此 radio 的时候 的回调。 参数就是 此 value 的值
- **groupValue：** 如果 Radio 的 value 和 groupValue 一样 就 是此 Radio 选中 其他 设置为 不选中
- **activeColor：** 选中的颜色
## 二、RadioListTile(dan)
### 2.1 属性
- **value：** 此 Radio 的 value 值
- **onChanged：** 当选择此 radio 的时候 的回调。 参数就是 此 value 的值
- **groupValue：** 如果 Radio 的 value 和 groupValue 一样 就 是此 Radio 选中 其他 设置为 不选中
- **activeColor：** 选中的颜色
- **title：** 标题， 具有代表性的就是 Text
- **subtitle：** 副标题（在 title 下面）， 具有代表性的就是 Text
- **isThreeLine = false：**// 是否是三行文本
    - true ： 副标题 不能为 null
    - false：如果没有副标题 ，就只有一行， 如果有副标题 ，就只有两行
- **dense：** 是否密集垂直
- **secondary：** 左边的一个控件
- **selected = false：** text 和 icon 的 color 是否 是 activeColor 的颜色
- **controlAffinity = ListTileControlAffinity.platform：**
    - ListTileControlAffinity.platform 根据不同的平台，来显示 对话框 的位置
    - ListTileControlAffinity.trailing：勾选在右，title 在中，secondary 在左
    - ListTileControlAffinity.leading ：勾选在左，title 在中，secondary 在右
   
## 1.2 demo图片

![](https://user-gold-cdn.xitu.io/2019/5/21/16ad9003b50e7859?w=320&h=640&f=gif&s=497249)

### 1.3 代码
**注意点** RadioListTile 的父控件 不能选择Row （暂时不知道为什么），demo中选的是  Column
```
import 'package:flutter/material.dart';

class RadioDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
// TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Radio 和 Radio RadioListTile "),
        centerTitle: true,
      ),
      body: RadioStateDemo(),
    );
  }
}

class RadioStateDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RadioSDemo();
  }
}

class RadioSDemo extends State<RadioStateDemo> {
  String groupValue;
  String valueLiu;
  String valueZhang;
  String valueGuo;
  String valueLi;

  @override
  void initState() {
    super.initState();
    groupValue = "刘德华";
    valueLiu = "刘德华";
    valueZhang = "张学友";
    valueGuo = "郭富城";
    valueLi = "黎明";
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        Text(
          "一：Radio",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Radio<String>(
              // 此 Radio 的 value 值
              value: valueLiu,
              // 当选择此 radio 的时候 的回调。 参数就是 此 value 的值
              onChanged: (value) {
                setState(() {
                  groupValue = value;
                });
              },
              // 如果 Radio 的 value 和 groupValue 一样 就 是此 Radio 选中 其他 设置为 不选中
              groupValue: groupValue,
              // 选中的颜色
              activeColor: Colors.red,
              // 响应手势的大小 ， 默认是 48 * 48
              // MaterialTapTargetSize.shrinkWrap 水波纹 在中间
              // MaterialTapTargetSize.padded  水波纹 靠左上
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            Radio(
              value: valueZhang,
              onChanged: (value) {
                setState(() {
                  groupValue = value;
                });
              },
              groupValue: groupValue,
              activeColor: Colors.red,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            Radio(
              value: valueGuo,
              onChanged: (value) {
                setState(() {
                  groupValue = value;
                });
              },
              groupValue: groupValue,
              activeColor: Colors.red,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            Radio(
              value: valueLi,
              onChanged: (value) {
                setState(() {
                  groupValue = value;
                });
              },
              groupValue: groupValue,
              activeColor: Colors.red,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ],
        ),
        SizedBox(
          height: 40,
        ),
        Text(
          "二：RadioListTile",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        // 不知道 为什么 Row 父布局 不行（暂时不知道why）
        Column(
//          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RadioListTile<String>(
              title: Text(valueLiu),
              // 必须要的属性
              value: valueLiu,
              //是否选中发生变化时的回调， 回调的 bool 值 就是是否选中 , true 是 选中
              groupValue: groupValue,
              onChanged: _changed,
              // 选中时 填充的颜色
              activeColor: Colors.red,
              // 标题， 具有代表性的就是 Text ，
              //        selected 如果是 true ：
              //         如果 不设置 text 的 color 的话， text的颜色 跟随 activeColor
              // 副标题（在 title 下面）， 具有代表性的就是 Text ， 如果 不设置 text 的 color 的话， text的颜色 跟随 activeColor
              subtitle: Text("副标题"),
              // 是否是三行文本
              //        如果是 true ： 副标题 不能为 null
              //        如果是 false：
              //                      如果没有副标题 ，就只有一行， 如果有副标题 ，就只有两行
              isThreeLine: false,
              // 是否密集垂直
              dense: false,
              // 左边的一个控件
//              secondary: Text("secondary"),
              // text 和 icon 的 color 是否 是 activeColor 的颜色
              selected: true,
              controlAffinity: ListTileControlAffinity.leading,
            ),
            RadioListTile<String>(
                title: Text(valueZhang),
                value: valueZhang,
                groupValue: groupValue,
                onChanged: _changed),
            RadioListTile<String>(
                title: Text(valueGuo),
                value: valueGuo,
                groupValue: groupValue,
                onChanged: _changed),
            RadioListTile<String>(
                title: Text(valueLi),
                value: valueLi,
                groupValue: groupValue,
                onChanged: _changed),
          ],
        )
      ],
    );
  }

  void _changed(value) {
    groupValue = value;
    setState(() {});
  }
}

```