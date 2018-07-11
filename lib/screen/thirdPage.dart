import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget {
  @override
  ThirdPageState createState() => new ThirdPageState();
}

class ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      /*appBar: new AppBar(
        title: new Text(
            '我的',
          style: new TextStyle(
            color: Colors.white
          ),
        ),
        centerTitle: true,
      ),*/
      body: new Center(
        child: new Text('我的'),
      ),
    );
  }
}