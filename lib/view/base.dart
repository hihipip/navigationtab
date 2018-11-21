import 'package:flutter/material.dart';

//Custom AppBar
//https://gist.github.com/fabiomsr/706f381f6aab59b3e5f741b8f66abf84
class MyAppBar extends AppBar{
  MyAppBar({Key key,String title}) : super(
    key:key,
    title:Text(title),
    backgroundColor:Colors.deepOrange,
  );
}