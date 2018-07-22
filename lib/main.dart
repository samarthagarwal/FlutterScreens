import 'package:flutter/material.dart';
import 'login_screen_1.dart';
import 'login_screen_2.dart';
import 'login_screen_3.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Login Screen 1',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: new SingleChildScrollView(
//        child: LoginScreen1(
//          primaryColor: Color(0xFF4aa0d5),
//          backgroundColor: Colors.white,
//          backgroundImage: new AssetImage("assets/images/full-bloom.png"),
//        ),
//        child: LoginScreen2(
//          backgroundColor1: Color(0xFF444152),
//          backgroundColor2: Color(0xFF6f6c7d),
//          highlightColor: Color(0xfff65aa3),
//          foregroundColor: Colors.white,
//          logo: new AssetImage("assets/images/full-bloom.png"),
//        ),
          child: LoginScreen3()
      ),
    );
  }
}


