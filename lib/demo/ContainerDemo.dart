import 'package:flutter/material.dart';

class ContainerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Container"), centerTitle: true),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                // 怎样排列 child
                alignment: Alignment.topCenter,
//                color: Colors.red[100],
                // 围绕在 child 周围的东西
                padding: EdgeInsets.only(),
                // Container 距离 自己兄弟姐妹的距离
                margin: EdgeInsets.all(20),
                // 自己的 宽度
                width: 150,
                // 自己的 高度
                height: 100,
//                foregroundDecoration: BoxDecoration(color: Colors.green),

                // 绘制在child后面装饰品 设置边框、背景色、背景图片、圆角等属性，不能与 color 属性共存
                decoration: BoxDecoration(
                  // 渐变
                  // LinearGradient 线性渐变
                  // SweepGradient  波浪纹渐变
                  // RadialGradient 放射线渐变
                  gradient:
                      LinearGradient(colors: [Colors.white, Colors.black]),
                  // 阴影  此阴影数组是在 控件 Container 外面的阴影
                  boxShadow: <BoxShadow>[
                    BoxShadow(color: Colors.black, spreadRadius: 8),
                    BoxShadow(color: Colors.red, spreadRadius: 6),
                    BoxShadow(color: Colors.lightGreenAccent, spreadRadius: 4),
                    BoxShadow(color: Colors.amberAccent, spreadRadius: 2)
                  ],
                  // 圆角弧度
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.red,
                  // 长方形还是圆形  BoxShape.circle 和  BoxShape.rectangle
//                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.blueAccent, width: 2),
                  // 背景图片
//                  image: DecorationImage(
//                    image: AssetImage("images/hashiqi.jpg"),
//                    fit: BoxFit.cover,
//                  ),
//                  backgroundBlendMode: BlendMode.dstOver,
                ),
//                constraints: BoxConstraints(
//                    maxHeight: 150, maxWidth: 150, minHeight: 50, minWidth: 50),
                // Container 做矩阵变换
//                transform: new Matrix4.rotationZ(0.5),
                child: FlatButton.icon(
                    icon: Icon(Icons.ac_unit),
                    label: Text(
                      "child",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    )),
              ),
            ],
          ),
          // 布局行为1
          Container(
            color: Colors.red,
          ),
          // 布局行为2
          Container(
            color: Colors.red,
            constraints: BoxConstraints(
                minWidth: 50, maxWidth: 100, minHeight: 50, maxHeight: 100),
          ),
          SizedBox(
            height: 20,
          ),
          // 布局行为3
          SizedBox(
              width: 100,
              height: 100,
              child: Container(
                color: Colors.red,
              )),
          SizedBox(height: 20,),
          // 布局行为4
          Container(color: Colors.red,child: Text("child"),alignment: Alignment.centerLeft,),
          SizedBox(height: 20,),
          // 布局行为5
          SizedBox(
              width: 100,
              height: 100,
              child: Container(
                alignment: Alignment.center,
                color: Colors.red,
                child: Text("child"),
              )),
        ],
      ),
    );
  }
}
