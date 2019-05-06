import 'package:flutter/material.dart';

class TextDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("TextRich"),
        ),
        body: Container(
            color: Colors.red,
            width: 200,
            height: 200,
            child: Column(
              children: <Widget>[
                Text(
                  "1234561222222222222222222222222222333222ssssssssssssssssss",
                  textAlign: TextAlign.left,
                  // 对齐方式
//            textDirection: TextDirection.ltr, // 文本流向
                  softWrap: false,
                  // 是否允许换行 ， 如果设置了 maxLines 此属性失效
                  overflow: TextOverflow.ellipsis,
                  // 文本的截断方式
                  // TextOverflow.ellipsis 以三个点结尾 ，
                  // TextOverflow.clip（默认的截断方式）强制截断，没有任何商量
                  //  TextOverflow.fade 褪色的截断
                  textScaleFactor: 2,
                  // 放大比例（估计一般用不到，一般直接设置 style 来设置 大小
                  maxLines: 3,
                  // 最大的行数
//            semanticsLabel: "adfadsfasdf", (暂时不知道什么用)
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.black,
                      decorationStyle: TextDecorationStyle.dotted),
                ),
                Text(
                  "1234561222222222222222222222222222333222ssssssssssssssssss",
                  textAlign: TextAlign.left,
                  // 对齐方式
//            textDirection: TextDirection.ltr, // 文本流向
                  softWrap: false,
                  // 是否允许换行 ， 如果设置了 maxLines 此属性失效
                  overflow: TextOverflow.ellipsis,
                  // 文本的截断方式
                  // TextOverflow.ellipsis 以三个点结尾 ，
                  // TextOverflow.clip（默认的截断方式）强制截断，没有任何商量
                  //  TextOverflow.fade 褪色的截断
                  textScaleFactor: 2,
                  // 放大比例（估计一般用不到，一般直接设置 style 来设置 大小
                  maxLines: 3,
                  // 最大的行数
//            semanticsLabel: "adfadsfasdf", (暂时不知道什么用)
                  style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.black,
                      decorationStyle: TextDecorationStyle.dashed),
                )
              ],
            )));
  }
}

class TextRichDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("TextRich"),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text.rich(
                TextSpan(
                    // 必须设置一个父TextStyle 否则 字体是白色
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    text: "Text.rich 实现：      ",
                    children: <TextSpan>[
                      TextSpan(
                          text: '绚丽',
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.normal)),
                      TextSpan(
                          text: '文本',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          )),
                      TextSpan(
                          text: '样式',
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.black,
                              fontSize: 18,
                              decoration: TextDecoration.lineThrough,
                              fontWeight: FontWeight.normal)),
                    ]),
                style: TextStyle(height: 2),
              ),
              RichText(
                  text: TextSpan(
                // 必须设置一个父TextStyle 否则 字体是白色
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                text: "RichText 实现：      ",
                children: <TextSpan>[
                  TextSpan(
                      text: '绚丽',
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.normal)),
                  TextSpan(
                      text: '文本',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.blue)),
                  TextSpan(
                      text: '样式',
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Colors.black,
                          fontSize: 18,
                          decoration: TextDecoration.lineThrough,
                          fontWeight: FontWeight.normal)),
                ],
              ))
            ],
          ),
        ));
  }
}

class TextStyleDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Paint paintBlue = Paint();
    paintBlue.color = Colors.blue;
    Paint paintRed = Paint();
    paintRed.color = Colors.red;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("TextStyle"),
        centerTitle: true,
      ),
      body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "inherit=false时 默认的文字颜色是白色，相当于完全重新样式",
                style: TextStyle(inherit: false, color: Colors.red),
              ),
              Divider(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "fontWeight:                                                  ",
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "FontWeight.normal == FontWeight.w400",
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                  Text(
                    "FontWeight.bold == FontWeight.w700(正常加粗)",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Divider(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "fontStyle:                                                  ",
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "FontStyle.normal(正常)",
                    style: TextStyle(fontStyle: FontStyle.normal),
                  ),
                  Text(
                    "FontStyle.italic(斜体)",
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ],
              ),
              Divider(),
              Text(
                "letterSpacing，每个字符的间距",
                style: TextStyle(letterSpacing: 4),
              ),
              Divider(),
              Text(
                "wordSpacing 单词 每个单词之间的距离(相当于给空格设置的距离)",
                style: TextStyle(wordSpacing: 10),
              ),
              Divider(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "textBaseline:                                                  ",
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "TextBaseline.ideographic",
                    style: TextStyle(textBaseline: TextBaseline.ideographic),
                  ),
                  Text(
                    "   TextBaseline.alphabetic",
                    style: TextStyle(textBaseline: TextBaseline.alphabetic),
                  ),
                ],
              ),
              Divider(),
              Text(
                "foreground 相当于设置paint，来绘制文字",
                style: TextStyle(foreground: paintBlue),
              ),
              Divider(),
              Text(
                "background  文本的背景",
                style: TextStyle(background: paintRed),
              ),
              Divider(),
              Text(
                "shadows  文本的阴影",
                style: TextStyle(shadows: [
                  BoxShadow(
                      color: Colors.grey, offset: Offset(-1, -1), blurRadius: 5)
                ]),
              ),
              Divider(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "decoration:                                                                                                     ",
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "TextDecoration.overline(上划线)",
                    style: TextStyle(decoration: TextDecoration.overline),
                  ),
                  Text(
                    "TextDecoration.none(没有划线)",
                    style: TextStyle(decoration: TextDecoration.none),
                  ),
                  Text(
                    "TextDecoration.underline(下划线)",
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                  Text(
                    "TextDecoration.lineThrough（中划线，删除线）",
                    style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        textBaseline: TextBaseline.alphabetic),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "decorationStyle:                                                                                                     ",
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "TextDecorationStyle.solid(实线)",
                    style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        decorationStyle: TextDecorationStyle.solid),
                  ),
                  Text(
                    "TextDecorationStyle.double(两条线)",
                    style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        decorationStyle: TextDecorationStyle.double),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
