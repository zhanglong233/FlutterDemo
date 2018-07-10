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
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        //primaryColor: Color(0xFF00796B),
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

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{

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
      /*bottomNavigationBar: new BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: new Icon(Icons.home), title: new Text('首页')),
          BottomNavigationBarItem(icon: new Icon(Icons.message), title: new Text('消息')),
          BottomNavigationBarItem(icon: new Icon(Icons.cloud), title: new Text('我的')),
        ],
      ),*/
    );
  }

}
