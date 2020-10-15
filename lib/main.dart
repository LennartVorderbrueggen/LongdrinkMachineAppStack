import 'package:flutter/material.dart';
import 'UI/MainPage/MainPage.dart';

void main() => runApp(new MaterialApp(
  theme: ThemeData(
    primaryColor: Colors.green,
    accentColor: Colors.yellow,
    fontFamily: 'Georgia',
  ),
  home: MainPage()
)
);

