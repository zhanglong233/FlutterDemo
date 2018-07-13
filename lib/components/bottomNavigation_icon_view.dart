/**
 *  底部导航栏样式封装
 * */

import 'package:flutter/material.dart';

class BottomNavigationIconView {
  final _icon;
  final _color;
  final BottomNavigationBarItem item;


  BottomNavigationIconView({
    Widget icon,
    Widget title,
    Widget color
  }):_icon = icon,
     _color = color,
     item = new BottomNavigationBarItem(
         icon: icon,
         title: title
     );

  FadeTransition transition(BottomNavigationBarType type,BuildContext context){

    return null;
  }
}

