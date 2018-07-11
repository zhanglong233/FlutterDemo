import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  @override
  FirstPageState createState() => new FirstPageState();
}

class FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      /*appBar: new AppBar(
        title: new Text(
          '首页',
          style: new TextStyle(
              color: Colors.white
          ),
        ),
        centerTitle: true
      ),*/
      body: new Center(
        child: new Text('首页'),
      ),
    );
  }
}