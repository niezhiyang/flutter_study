## 一。   **Text**
**flutter控件练习demo地址**：[github](https://github.com/niezhiyang/flutter_study)
### 1.1 **Text简介**
> **Text：** 单一格式的文本 使用比较多的 ， 相当于 android 中的TextView

### 1.2 **基本属性**

- **data**	要显示的文本，必填参数	String
- **style**	用于指定文本显示的样式如字体大小，颜色等，字体默认的大小是 14 ，默认样式会继承层级最为接近的 **DefaultTextStyle**    如果再加样式。有两种情况：
    - TextStyle.inherit = true 相当于***继承*** 最为接近的DefaultTextStyle ，比如要让DefaultTextStyle的字体大小，颜色一样，直接再设置个粗体即可
    - TextStyle.inherit = false 完全重写了样式
- **strutStyle** 
- **textAlign**	对齐方式,
    - TextAlign.left : 对齐容器左边缘的 Text
    - TextAlign.right : 对齐容器右边缘的 Text
    - TextAlign.center : 对齐容器中心的 Text
    - TextAlign.justify （感觉很少用）: 拉伸以结束的文本行以填充容器的宽度(暂时不知道怎么用)
    - TextAlign.start  （感觉很少用）：对齐容器前缘的 Text。对于从左到右的文本([TextDirection.ltr])，这是左边缘，对于从右到左的文本([TextDirection.rtl])，这是右边缘 
    - TextAlign.end （感觉很少用）：对齐容器尾部边缘的 Text。/对于从左到右的文本([TextDirection.ltr])，这是右边缘。对于从右到左的文本([TextDirection.rtl])，这是左边缘
- **textDirection**（感觉很少用） text 的流向
- **softWrap**  是否允许换行 false 表示 只显示一行，如果设置了 maxLines 此属性失效
- **overflow**	文本显示的截断方式	
- **textScaleFactor**	文本的缩放比例	
- **maxLines**	text显示的最大行数	
- **semanticsLabel** 暂时不知道什么用
### 1.3 demo
```
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
```
## 二 **RichText 和 Text.rich**
### 1.1 **Text简介**
> **RichText Text.rich：** 可以做出多种样式的文本绚丽多彩， 相当于 android 中的SpannableString
### 2.1 说明
    Text.rich 和 Text 源码都是通过  RichText 实现的
### 2.2 demo图片
<img src="https://user-gold-cdn.xitu.io/2019/5/6/16a8bba9c197bad0?w=1065&h=462&f=jpeg&s=71938" width="400" hegiht="200" align=center />

### demo代码
```
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
```
## 三。   **TextStyle**
> Text 的 样式

### 3.1 主要属性
- **inherit = true**  默认样式会继承层级最为接近的 **DefaultTextStyle**，为true 表示继承，false 表示完全重写
- **color** 字体颜色，注意： 如果有特殊的foreground，此值必须是null
- **fontSize** 字体大小 默认的是 14
- **fontWeight** 字体的粗细程度 FontWeight.w100 -- FontWeight.w900 . 默认是FontWeight.w400，FontWeight.w700 属于正常加粗
- **fontStyle** FontStyle.normal正常 FontStyle.italic斜体
- **letterSpacing** 单个字母或者汉字的距离，默认是1.0，负数可以拉近距离
- **wordSpacing** 单词之间添加的空间间隔，负数可以拉近距离
- **textBaseline** 对齐text的水平线: 
   - TextBaseline.ideographic用来对齐表意文字的水平线
   - TextBaseline.alphabetic 以标准的字母顺序为基线
- **height** 文本的高度 主要用于[TextSpan] 来设置不同的高度
- **foreground** text的前景色，与 color 不能同时设置
- **background** text的背景色
- **shadows**  将在文本下方绘制的[阴影]列表
- **decoration** 划线，
     - TextDecoration.none 没有
     - TextDecoration.underline 下划线
     - TextDecoration.overline 上划线
     - TextDecoration.lineThrough 中间的线（删除线）
- **decorationColor**   decoration划线的颜色
- **decorationStyle**   decoration划线的样式
    - TextDecorationStyle.solid 实线
    - TextDecorationStyle.double 画两条线
    - TextDecorationStyle.dotted  点线（一个点一个点的）
    - TextDecorationStyle.dashed  虚线（一个长方形一个长方形的线）
    - TextDecorationStyle.wavy 正玄曲线
- **debugLabel** 只在调试的使用
### 3.2 图片

![](https://user-gold-cdn.xitu.io/2019/5/6/16a8b3acd82e856c?w=1080&h=2034&f=jpeg&s=824002)
### 3.3 代码demo
```
class TextStyleDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Paint paintBlue = Paint();
    paintBlue.color = Colors.blue;
    Paint paintRed = Paint();
    paintRed.color = Colors.red;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("TextStyle"),centerTitle: true,),
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
                    "FontWeight.w400(默认)",
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "FontWeight.w700(正常加粗)",
                    style: TextStyle(fontWeight: FontWeight.w700),
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
```