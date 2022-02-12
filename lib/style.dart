import 'package:flutter/material.dart';

final customTheme = ThemeData(
  primarySwatch: Colors.blue,
  textTheme: TextTheme(
    headline5: TextStyle(
      color: Colors.white
    ),
    bodyText2: TextStyle(
      color: Colors.white
    )
  ),
  scaffoldBackgroundColor: Colors.black,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.black,
    unselectedItemColor: Colors.white,
    selectedItemColor: Colors.blueGrey
  )
);