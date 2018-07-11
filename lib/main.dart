import 'package:flutter/material.dart';

import './screen/firstPage.dart';
import './screen/secondPage.dart';
import './screen/thirdPage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        //primarySwatch: Colors.blue,
        brightness: Brightness.light,
        primaryColor: Colors.green,
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
  int page = 0;

  @override
  void initState() {
    super.initState();
    pageController = new PageController(initialPage: this.page);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.green,
      appBar: new AppBar(
        title: new Text(
            '首页',
          style: new TextStyle(
            color: Colors.white
          ),
        ),
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
      body: new PageView(
        children: <Widget>[
          new FirstPage(),
          new SecondPage(),
          new ThirdPage()
        ],
        controller: pageController,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: [
          new BottomNavigationBarItem(
              //backgroundColor: Colors.green,
              icon: new Icon(
                Icons.home,
                color: Colors.green,
              ),
              title: new Text(
                  '首页',
                style: new TextStyle(
                  color: Colors.green
                ),
              )),
          new BottomNavigationBarItem(
              icon: new Icon(
                Icons.message,
                color: Colors.green,
              ),
              title: new Text(
                '消息',
                style: new TextStyle(
                    color: Colors.green
                ),
              )),
          new BottomNavigationBarItem(
              icon: new Icon(
                Icons.cloud,
                color: Colors.green,
              ),
              title: new Text(
                '我的',
                style: new TextStyle(
                    color: Colors.green
                ),
              )),
        ],
        type: BottomNavigationBarType.shifting,
        onTap: onTap,
        currentIndex: page,
      ),
    );
  }

  void onTap(int index){
    pageController.animateToPage(
        index,
        duration: new Duration(milliseconds: 300),
        curve: Curves.ease);
  }

  void onPageChanged(int page){
    this.setState((){
      this.page = page;
    });
  }

}


class BottomNavItem extends StatelessWidget {
  const BottomNavItem({
    Key key,
    this.color: const Color(0xFF2DBD3A),
    this.child,
  }) : super(key: key);

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: color,
      child: child,
    );
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
