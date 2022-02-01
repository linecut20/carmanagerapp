import 'package:carmanagerapp/screens/home_screen.dart';
import 'package:flutter/material.dart';
import './style.dart' as style;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'car management system',
      debugShowCheckedModeBanner: false,
      theme: style.customTheme,
      home: HomeScreen(),
    );
  }
}