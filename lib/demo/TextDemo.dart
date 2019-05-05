import 'package:flutter/material.dart';

class TextDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        color: Colors.red,
        width: 200,
        height: 200,
        child: Text(
          "1234561222222222222222222222222222333222ssssssssssssssssss",
          textAlign: TextAlign.left,
          // 对齐方式
//            textDirection: TextDirection.ltr, // 文本流向
          softWrap: false, // 是否允许换行 ， 如果设置了 maxLines 此属性失效
          overflow: TextOverflow.ellipsis,
          // 文本的截断方式
          // TextOverflow.ellipsis 以三个点结尾 ，
          // TextOverflow.clip（默认的截断方式）强制截断，没有任何商量
          //  TextOverflow.fade 褪色的截断
          textScaleFactor: 2,// 放大比例（估计一般用不到，一般直接设置 style 来设置 大小
            maxLines:3, // 最大的行数
//            semanticsLabel: "adfadsfasdf", (暂时不知道什么用)
        ));
  }
}
