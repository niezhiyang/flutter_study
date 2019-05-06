### **简介**
> Scaffold 实现了基本的Material Design布局结构

在Material设计中定义的单个界面上的各种布局元素，在 Scaffold 中都有支持，比如 左边栏（Drawers）、snack bars、以及 （底部弹窗）bottom sheets。(底部导航栏)BottomNavigationBar



### **基本用法**

Scaffold 有下面几个主要属性：

- appBar：显示在界面顶部的一个 AppBar

- body：当前界面所显示的主要内容 Widget

- floatingActionButton：Material设计中所定义的 FAB，界面的主要功能按钮

- floatingActionButtonLocation：floatingActionButton 的位置 

- floatingActionButtonAnimator：floatingActionButton 的动画 

- drawer：左边侧边栏控件

- endDrawer：右边侧边栏控件

- backgroundColor： 内容的背景颜色，默认使用的是 ThemeData.scaffoldBackgroundColor 的值

- bottomNavigationBar： 显示在页面底部的导航栏

- bottomSheet： 底部弹出来的东西（基本上没用）

- persistentFooterButtons：固定在下方显示的按钮，比如对话框下方的确定、取消按钮 (基本上没用)

- resizeToAvoidBottomPadding：控制界面内容 body 是否重新布局来避免底部被覆盖了，比如当键盘显示的时候，重新布局避免被键盘盖住内容。默认值为 true。

### **Demo**
```
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScaffoldDemo(),
    );
  }
}


class ScaffoldDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _appBar(),
      body: _body(),
      floatingActionButton: new FloatingActionButton(
        tooltip: 'Add', // used by assistive technologies
        child: new Icon(Icons.add),
        onPressed: null,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      drawer: _drawer(context),
      endDrawer: Drawer(child: Text("右抽屉")),
      bottomNavigationBar: _BottomNavigationBar(),
    );
  }

  AppBar _appBar() {
    return new AppBar(
      // 如果有 侧边栏  右边是默认的事条目，点击默认打开 左侧边栏。 如果没有侧边栏，就显示返回箭头
      title: new Text('Example title'),
      actions: <Widget>[
        new IconButton(
          icon: new Icon(Icons.search),
          tooltip: 'Search', // 长按的一个提示
          onPressed: null,
        ),
        new IconButton(
          icon: new Icon(Icons.access_time),
          tooltip: 'time',
          onPressed: null,
        ),
      ],
    );
  }

  Drawer _drawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
            ),
            child: Center(
              child: SizedBox(
                width: 60.0,
                height: 60.0,
                child: CircleAvatar(
                  child: Text('头像'),
                ),
              ),
            ),
          ),
          ListTile(
            title: Text('Item 1'),
            leading: new CircleAvatar(
              child: new Icon(Icons.school),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Item 2'),
            leading: new CircleAvatar(
              child: new Text('B2'),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Item 3'),
            leading: new CircleAvatar(
              child: new Icon(Icons.list),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Builder _body() {
    return Builder(builder: (BuildContext context) {
      return Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('显示snackbar （Text 没有 onPressed 属性）'),
              onPressed: () {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text('我是snackbar'),
                ));
              },
            ),
            RaisedButton(
              child: Text('显示BottomSheet （Text 没有 onPressed 属性）'),
              onPressed: () {
                Scaffold.of(context).showBottomSheet((BuildContext context) {
                  return ListView(
                    padding: EdgeInsets.zero,
                    children: <Widget>[
                      ListTile(
                        title: Text('Item 1'),
                        leading: new CircleAvatar(
                          child: new Icon(Icons.school),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        title: Text('Item 2'),
                        leading: new CircleAvatar(
                          child: new Text('B2'),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        title: Text('Item 3'),
                        leading: new CircleAvatar(
                          child: new Icon(Icons.list),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  );
                });
              },
            ),
          ],
        ),
      );
    });
  }

}

// BottomNavigationBar 默认的实例
class _BottomNavigationBar extends StatefulWidget {
  const _BottomNavigationBar() : super();
  @override
  State<StatefulWidget> createState() => _BottomNavigationBarFullDefault();
}


// BottomNavigationBar 默认的实例,有状态
class _BottomNavigationBarFullDefault extends State {
  int _currentIndex = 1;

  void _onItemTapped(int index) {
    if(mounted) {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed, // BottomNavigationBarType 中定义的类型，有 fixed 和 shifting 两种类型
      iconSize: 24.0, // BottomNavigationBarItem 中 icon 的大小
      currentIndex: _currentIndex, // 当前所高亮的按钮index
      onTap: _onItemTapped, // 点击里面的按钮的回调函数，参数为当前点击的按钮 index
      fixedColor:  Colors.blue, // 如果 type 类型为 fixed，则通过 fixedColor 设置选中 item 的颜色
      items: <BottomNavigationBarItem> [

        BottomNavigationBarItem(
            title:  Text("主页"), icon:  Icon(Icons.home)),
        BottomNavigationBarItem(
            title:  Text("发现"), icon:  Icon(Icons.search)),
        BottomNavigationBarItem(
            title:  Text("我的"), icon:  Icon(Icons.image)),

      ],
    );
  }
}

```

### **注意点**

- 当有 导航栏的时候 appbar 左边默认的是条目，并且点开能打开导航栏。也可以手动设置icon
- build(BuildContext context)在 Scaffold.of(context)之前时，会报错
，需要 Builder(builder: (BuildContext context) {})包裹起来才能调用
或者 final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>(); 来吊起来
- BottomNavigationBar 默认就是有状态的自己点击，自己就可以改变状态
- 必须引入import 'package:flutter/material.dart'，并且根必须是MaterialApp，因为他就属于MaterialApp中的东西

### **使用ScaffoldState**
ScaffoldState 可以代替打开侧边栏和snackbar<br>
_scaffoldKey.currentState.openDrawer();默认打开左边侧边栏<br>
_scaffoldKey.currentState.showSnackBar
```
import 'package:flutter/material.dart';

class ScaffoldStateDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ScaffoldStateDemo();
}

class _ScaffoldStateDemo extends State with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("ScaffoldStateDemo"),
      ),
      body: RaisedButton(
        child: Text('显示snackbar'),
        onPressed: _showSnackBar,
      ),
    );
  }

  _showSnackBar() {
    _scaffoldKey.currentState
        .showSnackBar(SnackBar(content: Text("通过ScaffoldState打开的")));
  }
}
```
