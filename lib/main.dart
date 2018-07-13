import 'package:flutter/material.dart';

import './screen/firstPage.dart';
import './screen/secondPage.dart';
import './screen/thirdPage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      //退到后台时显示的标题
      title: 'Flutter Demo',
      theme: new ThemeData(
        //primarySwatch: Colors.blue,
        brightness: Brightness.light,
        primaryColor: const Color(0xff1296db),
        accentColor: Colors.deepOrangeAccent
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  PageController pageController;
  int _tabIndex  = 0;//tab角标
  var tabBottomImages;//底部导航栏图标
  var tabBottomTitles;//底部导航栏标题
  var _bodys;//底部导航对应的页面
  var _titles;//底部导航对应的页面标题

  /*
   * 根据image路径获取图片
   * 这个图片的路径需要在 pubspec.yaml 中去定义
   */
  Image getTabBottomImageSource(path){
    return new Image.asset(path,width: 25.0,height: 25.0);
  }

  /*
   * 根据索引获得对应的normal或是select的icon
   */
  Image getTabBottomIcon(int curIndex){
    if (curIndex == _tabIndex){
      return tabBottomImages[curIndex][1];
    }
    return tabBottomImages[curIndex][0];
  }

  /*
   * 获取bottomTab的颜色和文字
   */
  Text getTabBottomTitle(int curIndex){
    if (curIndex == _tabIndex){
      return new Text(tabBottomTitles[curIndex],
        style: new TextStyle(color: const Color(0xff1296db))
      );
    }
    return new Text(tabBottomTitles[curIndex],
      style: new TextStyle(color: const Color(0xff8a8a8a))
    );
  }

  /*
  *  获取bottomTab对应的页面标题
  */
  Text getPageTitle(int curIndex){
    if(curIndex == _tabIndex){
      return new Text(_titles[curIndex],
        style: new TextStyle(color: Colors.white),
      );
    }
    return null;
  }

  /*
   * 初始化底部导航栏参数
   */
  void initData(){
    tabBottomImages = [
      [
        getTabBottomImageSource('images/icon_bottom_home_normal.png'),
        getTabBottomImageSource('images/icon_bottom_home_select.png')
      ],
      [
        getTabBottomImageSource('images/icon_bottom_message_normal.png'),
        getTabBottomImageSource('images/icon_bottom_message_select.png')
      ],
      [
        getTabBottomImageSource('images/icon_bottom_persion_normal.png'),
        getTabBottomImageSource('images/icon_bottom_persion_select.png')
      ],
    ];
    tabBottomTitles = [
      '首页','消息','我的'
    ];
    _bodys = [
      new FirstPage(),
      new SecondPage(),
      new ThirdPage()
    ];
    _titles = [
      '首页','消息','我的'
    ];
  }




  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //调用初始化数据方法
    initData();

    return new Scaffold(
      backgroundColor: Colors.green,
      appBar: new AppBar(
        title: getPageTitle(_tabIndex),
        centerTitle: true,
      ),
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            new Container(
                //width: 20.0,
                height: 280.0,
                color: Colors.grey,
              child: new Center(
                //child: new Text('QQ:1274029513'),
                child: new CircleAvatar(
                  //backgroundImage:new NetworkImage("https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=3463668003,3398677327&fm=58"),
                  backgroundColor: Colors.green,
                  child: new Text("P"),//可以在图片上添加文字等等
                ),
              )
            ),
          ],
        ),
      ),
      body: _bodys[_tabIndex],
      bottomNavigationBar: new BottomNavigationBar(
        items: [
          new BottomNavigationBarItem(
              //backgroundColor: Colors.green,
              icon: getTabBottomIcon(0),
              title: getTabBottomTitle(0)
          ),
          new BottomNavigationBarItem(
              icon: getTabBottomIcon(1),
              title: getTabBottomTitle(1)
          ),
          new BottomNavigationBarItem(
              icon: getTabBottomIcon(2),
              title: getTabBottomTitle(2)
          )
        ],
        //设置显示的模式shifting/fixed
        type: BottomNavigationBarType.fixed,
        //tabBottom的点击监听
        onTap: onTap,
        //设置当前索引
        currentIndex: _tabIndex,
      ),
    );
  }

  void onTap(int index){
    setState(() {
      _tabIndex = index;
    });
  }

}



/*class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{

  //tabbar的控制器
  TabController controller;

  @override
  void initState() {
    controller = new TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new TabBarView(
        controller: controller,
        children: <Widget>[
          new FirstPage(),
          new SecondPage(),
          new ThirdPage()
        ],
      ),
      bottomNavigationBar: new Material(
        color: Colors.blue,
        child: new TabBar(
          controller: controller,
          tabs: <Tab>[
            new Tab(text: '首页',icon: new Icon(Icons.home)),
            new Tab(text: '消息',icon: new Icon(Icons.message)),
            new Tab(text: '我的',icon: new Icon(Icons.cloud))
          ],
        ),
      ),
      *//*bottomNavigationBar: new BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: new Icon(Icons.home), title: new Text('首页')),
          BottomNavigationBarItem(icon: new Icon(Icons.message), title: new Text('消息')),
          BottomNavigationBarItem(icon: new Icon(Icons.cloud), title: new Text('我的')),
        ],
      ),*//*
    );
  }

}*/
