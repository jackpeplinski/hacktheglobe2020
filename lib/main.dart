import 'package:flutter/material.dart';
import 'package:hacktheglobe2020/home.dart';

void main() => runApp(Home());

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => HomePage(),
      },
      theme: ThemeData(
        primaryColor: Colors.red,
        textTheme: TextTheme(
          display1: TextStyle(
              fontSize: 100,
              fontWeight: FontWeight.bold,
              color: Colors.redAccent),
          display2: TextStyle(
              fontSize: 100,
              fontWeight: FontWeight.bold,
              color: Colors.orangeAccent),
          display3: TextStyle(
              fontSize: 100,
              fontWeight: FontWeight.bold,
              color: Colors.greenAccent),
          display4: TextStyle(
              fontSize: 100, fontWeight: FontWeight.bold, color: Colors.black),
          body1: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
