**flutter控件练习demo地址**：[github](https://github.com/niezhiyang/flutter_study)
## 一 Center
将其子widget居中显示在自身内部的widget。一般咱们想要的效果就是在一个父控件的正中间。也就是不要大小因子。直接让 Center 的大小是父控件的大小。
- 如果它的尺寸受到约束且 widthFactor 和 heightFactor 为null，则此窗口小部件将尽可能大
- 如果它的尺寸不受约束且相应的 widthFactor 和 heightFactor 为null，则此 widget 将匹配 child 大小。也就是child 大小
- 如果 widthFactor 和 heightFactor (大小因子)不为null，则此 widget 相应大小是 child 和大小因子的乘积 。 比如 如果 widthFactor 为2.0，则此 widget 的宽度将始终是 child 宽度的两倍。
### 1.1 让 RaisedButton 在 Scaffold 中间的代码
```
class CenterDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Container"), centerTitle: true),
      body: Center(
        child:
            RaisedButton.icon(icon: Icon(Icons.ac_unit), label: Text("child")),
      ),
    );
  }
}
```

## 二 Padding
一个widget, 会给其子widget添加指定的填充。相当于 Container + padding 他们两个没有什么大的却别
```
 Container(
            color: Colors.red,
            child: Padding(
              // 不能为空
              padding: EdgeInsets.all(10.0),
              child: Container(
                height: 50.0,
                width: 50.0,
                color: Colors.blueAccent,
              ),
            ),
          )
```  

## 三 Align
一个 widget，它可以将其子 widget 对齐，并可以根据子 widget 的大小自动调整大小 , 相当于 Container + alignment
 。 这个布局特性，跟 Center 一样
- 如果它的尺寸受到约束且 widthFactor 和 heightFactor 为null，则此窗口小部件将尽可能大
- 如果它的尺寸不受约束且相应的 widthFactor 和 heightFactor 为null，则此 widget 将匹配 child 大小。也就是child 大小
- 如果 widthFactor 和 heightFactor (大小因子)不为null，则此 widget 相应大小是 child 和大小因子的乘积 。 比如 如果 widthFactor 为2.0，则此 widget 的宽度将始终是 child 宽度的两倍。
```
Container(
            width: 100,
            height: 100,
            color: Colors.red,
            child: Align(
              alignment: Alignment.topRight,
              child: Icon(Icons.ac_unit),
            ),
          )
```


