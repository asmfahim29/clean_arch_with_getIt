import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'CircularStd',
    appBarTheme: appBarTheme(),
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    color: Colors.lightBlueAccent,
    elevation: 0,
    centerTitle: true,
    iconTheme: IconThemeData(color: Color(0xff8B8B8B)),
    titleTextStyle: TextStyle(color: Color(0xff8B8B8B), fontSize: 18),
  );
}
