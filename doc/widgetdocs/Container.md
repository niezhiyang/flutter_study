**flutter控件练习demo地址**：[github](https://github.com/niezhiyang/flutter_study)
## 一 。Container
### 1.1 **简介**
> Container 一个方便的 widget，它组合了常见的绘画、定位和大小的 widget，在flutter中非常常见。颜色，边框，填充形状，阴影，渐变色，背景图片。
"""
### 1.2 绘制流程
1. Container 首先会使用 padding 来围绕在 child 周围（也包括  decoration 中存在的边框）。
2. 添加额外的约束限制（将宽度和高度合并为约束，如果宽高不为 null）
3. 最后用 margin 包裹住

### 1.3 绘制过程
1. 首先会绘制给定的 transform 
2. 之后绘制 decoration 来绘制边框
3. 然后绘制 child
4. 最后绘制 foregroundDecoration （前景装饰），同时填充该区域

### 1.4 布局大小行为
由于 Container 结合了许多其他 widget，每个 widget 都有自己的布局行为，因此 Container 的布局行为有点复杂 。有的时候跟随自己。有的时候跟随 child。有的时候跟随 父亲。简单说，就是如果 Container 没有 child，没有 height，没有 width，没有约束，并且父窗口提供无限制约束，则 Container 会尝试尽可能小。
#### 1.4.1 总结来说按照顺序
1. 先遵循对齐（alignment属性）
2. 以 child 的宽高也约束。来约束自己，就是适配 child 的约束，可以认为是 android 上的 wrap_content
3. 足够小的来适应 Container 的父布局

#### 1.4.2 更确切的按下面的走
1. 如果 Container 没有 child ，没有 height，没有 width，没有  constraints (约束)，并且父节点提供无限制约束，则 Container 尝试尽可能小 。 也就是说是看不见的。
2. 如果 Container 没有 child 且 没有 alignment (对齐)，但提供了 height，width 或 constraints(约束)，则在给定这些 constraints(约束)和父节点  constraints(约束)的组合的情况下，Container会尽可能小。
3. 如果 Container 没有 child，没有 height，没有 width，没有  constraints (约束)，没有 alignment (对齐)，但是父节点提供了有界约束，那么Container会扩展以适应父节点提供的约束。
4. 如果 Container 具有 alignment (对齐)，并且父节点提供无限制约束，则Container 会尝试围绕 child 调整自身大小,也就是所谓的跟 child 一样大
5. 如果 Container 具有 alignment （对齐），并且父窗口提供有界约束，则 Container 则会跟父节点一样大，然后根据 alignment （对齐方式）将 child 放到其自身内部
6. 如果 Container具有 child 但没有 height，没有 width，没有约束，也没有 alignment (对齐)，并且 Container 将 constraints(约束)从父级传递给 child 并调整自己大小以适应 child
7. **额外说明：** margin 和 padding 属性也会影响其布局。

### 1.5 属性
#### 1.5.1 alignment
在 Container 里面 child 的对齐方式  , 如果 child 为 null ，则 忽略 这个属性 。取值 Alignment( x , y)，同样也有几个常亮来表示，这几个常亮，足以在项目中完成
- Alignment topLeft = Alignment(-1.0, -1.0) ,左上角
- Alignment topCenter = Alignment(0.0, -1.0)  中上
- Alignment topRight = Alignment(1.0, -1.0);右上角
- Alignment centerLeft = Alignment(-1.0, 0.0);左中
- Alignment center = Alignment(0.0, 0.0) 正中心
- Alignment centerRight = Alignment(1.0, 0.0);中左
- Alignment bottomLeft = Alignment(-1.0, 1.0);左下
- Alignment bottomCenter = Alignment(0.0, 1.0) 中下
-  Alignment bottomRight = Alignment(1.0, 1.0) 右下

#### 1.5.2 padding
内边距
- EdgeInsets.all(double value); 上下左右都有的边距
- EdgeInsets.only({
      this.left = 0.0,
      this.top = 0.0,
      this.right = 0.0,
      this.bottom = 0.0,
    }) : 单独设置每个的边距
- EdgeInsets.fromLTRB(this.left, this.top, this.right, this.bottom) ： 单独设置每个的边距。
- EdgeInsets.symmetric({
      double vertical = 0.0,
      double horizontal = 0.0,
    })， 相当于 水平的 左右边距都是 vertical。 垂直的 上下边距都是 horizontal
#### 1.5.3 color 、 width 和 height
Container 的背景色。color属性 不能与  decoration 不能共存
#### 1.5.4 margin 
外边距 与 padding 取值一样
#### 1.5.5 decoration
 绘制在 child 后面装饰品 设置边框、背景色、背景图片、圆角等属性，不能与 color 属性共存。
 下面是 BoxDecoration 的属性
#### 1.5.5.1 BoxDecoration 讲解
- color, 背景颜色
- image, 背景图片   背景图片是在 color上面的
- border, 边框      Border.all(color: Colors.blueAccent, width: 2)
- borderRadius, 边框弧度  BorderRadius.all(Radius.circular(20)), 
- boxShadow,   阴影  此阴影数组是在 控件 Container 外面的阴影
- gradient, 渐变  // LinearGradient 线性渐变
                                 // SweepGradient  波浪纹渐变
                                 // RadialGradient 放射线渐变
- shape = BoxShape.rectangle,形状 BoxShape.circle(圆形) 和  BoxShape.rectangle(长方形) ， 当是 圆形的时候 不能设置 borderRadius 属性
#### 1.5.6 foregroundDecoration
 绘制在 child 前面装饰品 设置边框、背景色、背景图片、圆角等属性，可以与 color 属性共存。 但是会遮盖住 child 和 背景色
#### 1.5.7 constraints
Container 的约束。相当于规定 Container 的maxHeight,maxWidth，minHeight，minWidth
。 如果 Container 的 width 大于 此 maxWidth，那么大小按 maxWidth 来算。其他的也是如此
#### 1.5.8 transform 矩阵变换  和 child




