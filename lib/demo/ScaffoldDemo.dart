import 'package:flutter/material.dart';


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
      // 如果有 侧边栏  左边是默认的是条目，点击默认打开 左侧边栏。 如果没有侧边栏，就显示返回箭头
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
    if (mounted) {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      // BottomNavigationBarType 中定义的类型，有 fixed 和 shifting 两种类型
      iconSize: 24.0,
      // BottomNavigationBarItem 中 icon 的大小
      currentIndex: _currentIndex,
      // 当前所高亮的按钮index
      onTap: _onItemTapped,
      // 点击里面的按钮的回调函数，参数为当前点击的按钮 index
      fixedColor: Colors.blue,
      // 如果 type 类型为 fixed，则通过 fixedColor 设置选中 item 的颜色
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(title: Text("主页"), icon: Icon(Icons.home)),
        BottomNavigationBarItem(title: Text("发现"), icon: Icon(Icons.search)),
        BottomNavigationBarItem(title: Text("我的"), icon: Icon(Icons.image)),
      ],
    );
  }
}
