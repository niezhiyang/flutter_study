import 'package:flutter/material.dart';

class SliverAppBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            //leading, // 如果省略了 leading ，但 AppBar 在带有 Drawer 的 Scaffold 中，则会插入一个 button 以打开 Drawer。如果没有Drawer ， 默认的是个返回箭头
            //title, // 标题
            //actions, // 右边的icon， 一般的是icon 或者是文字
            //bottom,         //底部内容区域  通常是个 tabbar
            //elevation, //阴影,纸墨设计中控件的 z 坐标顺序，默认值为 4，对于可滚动的 SliverAppBar，当 SliverAppBar 和内容同级的时候，该值为 0， 当内容滚动 SliverAppBar 变为 Toolbar 的时候，修改 elevation 的值
            //brightness,   // 状态栏 两种  Brightness.light,   白底黑字 Brightness.dark:黑底白字
            //centerTitle,     //标题是否居中, 标题是否居中显示，默认值根据不同的操作系统，显示方式不一样
            primary: true,// 预留状态栏

            forceElevated: false, //展开flexibleSpace之后是否显示阴影

            automaticallyImplyLeading: true,   // 如果有 leading 这个不会管用 ,相当于忽略这个参数 ； 如果没有leading ，当有侧边栏的时候， false：不会显示默认的图片，true 会显示 默认图片，并响应打开侧边栏的事件

//            titleSpacing: NavigationToolbar.kMiddleSpacing,//flexibleSpace 和 title 的距离 默认是重合的

            expandedHeight: 200.0,//200.0, 可滚动视图的高度  伸缩区域大小

            snap: true,//与floating结合使用
            floating: true, //是否随着滑动隐藏标题,滑动到最上面，再snap滑动是否隐藏导航栏的文字和标题等的具体内容，为true是隐藏，为false是不隐藏
//            title: _title(),
            pinned: false,  //是否固定在顶部,往上滑，导航栏可以隐藏
            leading:Icon(Icons.menu),
            flexibleSpace:
            FlexibleSpaceBar(
              //可以展开区域，通常是一个FlexibleSpaceBar
              centerTitle: true,
              title: _title(),
              background: Image.asset(
                "images/header_bg.jpg",
                fit: BoxFit.fill,
              ),
            ),
          )
        ];
      },
      body: Center(
        child: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            if (index.isOdd) return  Divider();
            return ListItem(index/2);
          },
          itemCount: 40,
        ),
          ),
    ));
  }

  _title() {
    return Text("标题",
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ));
  }

  Widget ListItem(var index) {
    return new ListTile(
      title:  Center(child: Text(
        "条目$index",
        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
      ),),
    );
  }
}
