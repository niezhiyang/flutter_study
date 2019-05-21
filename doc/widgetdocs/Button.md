**flutter控件练习demo地址**：[github](https://github.com/niezhiyang/flutter_study)
## button种类
所谓的 button 就是都有 onPressed 属性， 可以点击响应事件的 ， 有点击的效果 ， 如果 onPressed 设置为 null 的话，button 都是 disable 的，同时 button 有 disable 的样式 ， 按下时 有高亮显示
- MaterialButton 有主题的button，官网不推荐使用此控件，推荐使用它的子类，下面的就是他们的子类，默认大小是 88 * 36 的大小
    - RaisedButton  有阴影，圆角的button
    - FlatButton    没有阴影 没有圆角 没有边框 ，背景透明
    - OutlineButton  没有阴影 ， 有圆角边框的 
- IconButton 只有一个Icon的button
    - BackButton 一个 Icon 是 返回键头的IconButton，点击会调用 Navigator.maybePop 返回上一个路由 ， 默认长按提示是 back ，且不可去掉
    - CloseButton 一个 Icon 是 x（关闭）的IconButton，点击会调用 Navigator.maybePop 返回上一个路由 ，默认长按提示是 back ，且不可去掉
- RawMaterialButton 不适用当前Theme或者ButtonTheme的控件 ， 如果自定义，官方推荐使用这个
- PopupMenuButton 菜单，相当于 android 中的 PopupMenu 和 ios 中的 UIMenuController
- DropdownButton 下拉列表， 相当于 android 中的 Spinner 
## 一。   **MaterialButton**
> 默认的是一个最小宽度为88，高度为36,有圆角，有阴影，点击的时候高亮，有 onpress 属性的一个控件。可以响应用户点击事件。但是：官方不推荐使用这个，推荐使用它的子类 RaisedButton、FlatButton 和 OutlineButton，如果自定义 button 推荐使用 RawMaterialButton
### 1.1 属性
- **onPressed:** 按下之后松开的回调，也就是所谓的点击事件。其实是当用户手抬起来时的动作
- **onHighlightChanged:** onPressed!=null 的时候可以看出 相当于用户按下时（高亮） 或者 松开时（不高亮）的监听。 
- **textColor:**  里面文本的颜色
- **disabledTextColor:** 当状态为 disable的时候 文本的颜色，onpress=null 为disable<br>
**注意点** 在这里无效 在它子类有效（RaisedButton ，FlatButton ，OutlineButton ）
- **color:**  // 当是 enable （onpress != null） 背景色
- **disabledColor:** //onpress = null 的时候的颜色（不知道为什么测试不管用）<br>

**注意点** 在这里无效 在它子类有效（RaisedButton ，FlatButton ，OutlineButton ）

- **highlightColor:** 当用户 按下高亮时 的颜色
- **elevation:**  Z轴阴影 默认是2 ，当 enable 的时候的阴影
- **highlightElevation:** 高亮时的阴影 默认是 8  button 被按下的时候
- **disabledElevation:** 当 disabled （onpress = null） 的阴影   默认是0 ，测试的时候 阴影还是 为0.0,也就是说不管用
<br>
 **注意点** 在这里无效 在它子类有效（RaisedButton ，FlatButton ，OutlineButton ）

- **minWidth:** 最小的宽度 默认是 88 。 在 ButtonTheme 规定的
- **height:**  高度， 默认是 36 也是在 ButtonTheme 规定的
- **child:** 包括的子控件
- **shape** 边框样式<br>**注意点** 在这里无效 在它子类有效（RaisedButton ，FlatButton ，OutlineButton ）
```
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
              shape:  Border.all(color: Color(0xFFFF0000),style: BorderStyle.solid,width: 2),
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

```
### 1.2 **RaisedButton**
> **RaisedButton：** 属性基本上和上面的父类一样，The [elevation], [highlightElevation], [disabledElevation], 和
[clipBehavior] 必须非空.
#### 1.2.1 构造方法
- RaisedButton()
- RaisedButton.icon(onPressed,icon,label)// 其实主要是为了让用户弄成左边一个icon 右面一个文字
当然了 这两个都是 Wight，所以都可以
#### 1.2.2 属性
在上面咱们知道 disabledTextColor、disabledColor、disabledElevation 和 shape 在这里设置才有效。现在主要讲一下 shape （边框）
 
### 1.3 **FlatButton**
> **FlatButton：** 扁平按钮，一般没有阴影，没有边框，且大部分用在 toolbar，dialogs ， 或者 其他内容中
**注意点**: 一定要设置onPress属性，否则他就是不可点击的

#### 1.3.1 构造方法

- FlatButton()
- FlatButton.icon(onPressed,icon,label)// 其实主要是为了让用户弄成左边一个icon 右面一个文字
当然了 这两个都是 Wight，所以都可以

### 1.4 **OutlineButton**

> **OutlineButton：** 默认有细灰色圆角边框，无阴影，且背景透明，当按下的时候，有默认highlightElevation 和 highColor 。

#### 1.3.1 构造方法
- OutlineButton()
- OutlineButton.icon(onPressed,icon,label)// 其实主要是为了让用户弄成左边一个icon 右面一个文字
当然了 这两个都是 Wight，所以都可以

#### 1.3.2 独有的属性
- highlightedBorderColor  // 按钮高亮时的边框颜色
- disabledBorderColor: // 按钮不可点击时的边框颜色

## 二。   **IconButton**
> 一般用在AppBar.actions 中，当然其他地方也可以使用， [icon] 属性必须指定，一般都 Icon 或者 ImageIcon 。 响应点击的时候，是一个大圆

### 2.1 属性
- **iconSize = 24.0**icon的大小
- **padding = const EdgeInsets.all(8.0)** 围绕在 icon 周围的  padding ， 周围的padding也可以响应点击事件，手势事件
- **alignment = Alignment.center**icon 在 IconButton 中的位置
- **icon**必须的参数 一般是 Icon 或者是 ImageIcono
- **color**icon的颜色 。 注意 不是背景色， 就是icon的颜色
- **highlightColor** 高亮时的背景颜色
- **splashColor**按下瞬间的颜色 加入从手指按下之后 先是 splashColor然后再是 highlightColor
- **disabledColor** 当disable的时候 icon 颜色
- **onPressed** 点击事件
- **tooltip**  长按的提示

## 三 PopupMenuButton
> PopupMenuButton 相当于 android 中的 PopupMenu 和 ios 中的 UIMenuController , 
### 3.1 属性
- **itemBuilder** 每个条目
- **initialValue** // 初始的value ， 就是打开的时候， 在这个value 里面会有不同的样式，让你知道当前值
- **onSelected**选择时的回调
- **onCanceled**点击返回键，或者是点击外部， popupmenu关闭时的回调
- **tooltip** 默认有长按tip 是 
- **elevation = 8.0** 弹出来的时候的阴影高度
- **padding = const EdgeInsets.all(8.0)**
- **child** icon 和 child 不能同时设置， 否则报错
- **icon** icon 和 child 不能同时设置， 否则报错
- **offset = Offset.zero** 根据当前控件，向右向下平移。默认是跟当前控件的左上角对齐
### 3.2 注意点
 icon 和 child 不能同时设置， 否则报错，如果都没有设置，flutter会根据不同的平台 给一个icon ，android 中是三个点，child 不要设置有（onpress属性）点击事件的 控件,比如 FlatButton 等等，因为影响 PopupMenuButton的点击事件
 
 ## 四 DropdownButton
 > DropdownButton 下拉列表