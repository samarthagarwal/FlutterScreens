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
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
      routes: _routes,
    );
  }
}

Map<String, WidgetBuilder> _routes = <String, WidgetBuilder>{
  "/login1": (BuildContext context) => LoginScreen1(),
  "/login2": (BuildContext context) => LoginScreen2(),
  "/login3": (BuildContext context) => LoginScreen3(),
  "/login4": (BuildContext context) => LoginScreen4(),
  "/login5": (BuildContext context) => LoginScreen5(
        avatarImage: 'assets/images/mountains.png',
        googleSignIn: () {},
        navigatePage: () {},
        onLoginClick: () {},
      ),
  "/login6": (BuildContext context) => LoginScreen6(
        navigatePage: () {},
        onLoginClick: () {},
      ),
};

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        SizedBox(
          height: 100,
        ),
        Center(
          child: Text(
            'Flutter Login Screen',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pushNamed("/login1");
          },
          child: Text(
            'Login Screen 1',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pushNamed("/login2");
          },
          child: Text(
            'Login Screen 2',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pushNamed("/login3");
          },
          child: Text(
            'Login Screen 3',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pushNamed("/login4");
          },
          child: Text(
            'Login Screen 4',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pushNamed("/login5");
          },
          child: Text(
            'Login Screen 5',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pushNamed("/login6");
          },
          child: Text(
            'Login Screen 6',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ]),
    );
  }
}
