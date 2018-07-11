import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SecondPageState();
  }
}

class SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
            '消息',
            style: new TextStyle(
              color: Colors.white
            )
        ),
        centerTitle: true,
      ),
      body: new Center(
        child: new Text('消息'),
      ),
    );
  }
}