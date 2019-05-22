import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("row"),
        centerTitle: true,
      ),
      body: RowDemo(),
    );
  }
}

class RowDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final _list = <Widget>[
      RaisedButton(
        disabledColor: Colors.red,
        child: Text("儿子1"),
      ),
      Text("儿子2"),
      Text("儿子3"),
      Text("儿子4"),
      Text("儿子5"),
    ];
    return Column(
      children: <Widget>[
        SizedBox(
          height: 30,
        ),
        Container(
          color: Colors.grey,
          child: Row(
            // 主轴(main axis)
            // 把 children 放到 Column 主轴 的哪个位置
            //  end : 尾部， start ：头部， center ： 中间 ，spaceBetween：在 children 之间均匀地放置 空间 ，spaceAround ： 每个 children
            mainAxisAlignment: MainAxisAlignment.start,

            // 此 Row 的宽度。默认是 MainAxisSize.max
            //          MainAxisSize.min 是 包裹 children 的高度 即可  。android 中 相当于 wrap_content
            //          MainAxisSize.max 是 铺满 Row 的父 Widget 的宽度  。android 中 相当于 match_parent
            //  如果设置成 MainAxisSize.min 。 那么 mainAxisAlignment 属性相当于无效。 因为是包裹 children
            mainAxisSize: MainAxisSize.max,
            // 交叉轴(cross axis)
            // 把 children 放到 Column 主轴 的哪个位置
            // end : 尾部， start ：头部， center ： 中间 ，
            crossAxisAlignment: CrossAxisAlignment.start,
            // children 在主轴 的排列顺序
            textDirection: TextDirection.ltr,
            // children 在 交叉轴 的排列顺序
            verticalDirection: VerticalDirection.down,
            children: _list,
          ),
        ),
        SizedBox(
          height: 30,
        ),
        SizedBox(
            width: 200,
            height: 200,
            child: Stack(
              alignment: AlignmentDirectional.topStart,
//            alignment:   AlignmentDirectional(-1.0, -1.0),
              fit: StackFit.loose,
              overflow: Overflow.visible,
              children: <Widget>[
                Container(
                  color: Colors.black,
                  height: 200,
                  width: 200,
                ),
                Container(
                  color: Colors.deepPurple,
                  height: 100,
                  width: 100,
                ),
                Container(
                  color: Colors.green,
                  height: 50,
                  width: 50,
                ),
              ],
            )),
      ],
    );
  }
}
