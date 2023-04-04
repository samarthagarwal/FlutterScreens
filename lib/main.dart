import 'package:flutter/material.dart';
import 'package:flutter_login_screens/login_screen_2.dart';
import 'package:flutter_login_screens/login_screen_3.dart';
import 'package:flutter_login_screens/login_screen_4.dart';

import 'login_screen_1.dart';
import 'login_screen_5.dart';
import 'login_screen_6.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Login Screen 1',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> pages = [
    LoginScreen1(),
    LoginScreen2(),
    LoginScreen3(),
    LoginScreen4(),
    LoginScreen5(
      avatarImage: 'assets/images/mountains.png',
      googleSignIn: () {},
      navigatePage: () {},
      onLoginClick: () {},
    ),
    LoginScreen6(
      navigatePage: () {},
      onLoginClick: () {},
    ),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
        itemCount: pages.length,
        itemBuilder: (context, index) {
          return pages[index];
        },
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }

  Widget buildPage(Color color, String text) {
    return Container(
      color: color,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 50.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
