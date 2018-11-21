import 'package:flutter/material.dart';

enum TabItem { red,green,blue }

//單例模式
class TabHelper{
  static final TabHelper _obj = new TabHelper._internal();
  factory TabHelper(){
    return _obj;
  }
  TabHelper._internal();

  List<String> strings=["String1","String2","String3"];

  static String getDescription(TabItem item){
    switch(item){
      case TabItem.red:
        return "TabItem.red";
      case TabItem.blue:
        return "TabItem.blue";
      case TabItem.green:
        return "TabItem.green";
      default :
        return "Noting";
    };
  }
  static Color getColor(TabItem item){
    switch(item){
      case TabItem.red:
        return Colors.redAccent;
      case TabItem.blue:
        return Colors.blueAccent;
      case TabItem.green:
        return Colors.greenAccent;
      default :
        return Colors.black;
    }
  }
}