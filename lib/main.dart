import 'package:flutter/material.dart';
import 'package:flutter_login_screens/login_screen_2.dart';
import 'package:flutter_login_screens/login_screen_3.dart';
import 'package:flutter_login_screens/login_screen_4.dart';
import 'package:flutter_login_screens/misc/rating.dart';
import 'package:flutter_login_screens/misc/slide_list_view.dart';

import 'Examples/buttons.dart';
import 'experiments/graph.dart';
import 'loaders/load_view.dart';
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
  "/buttonExample": (context) => ButtonExample(),
  "/loaderExample": (context) => LoaderWidgetPreview(),
  "/graphExample": (context) => Scaffold(
      appBar: AppBar(title: Text("Graph Example")),
      body: Center(child: Graph())),
  "/misc": (context) => Scaffold(
        appBar: AppBar(title: Text("Misc")),
        body: Center(
          child: Column(
            children: [
              SelectableText("https://pub.dev/packages/flutter_rating_bar"),
              Expanded(
                ///todo::
                child: SlideListView(
                  view1: Container(
                    color: Colors.red,
                  ),
                  view2: Container(
                    color: Colors.green,
                  ),
                ),
              )
            ],
          ),
        ),
      )
};

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("flutter_screens"),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          for (final route in _routes.keys)
            ListTile(
              title: Text(route.replaceAll("/", "")),
              onTap: () => Navigator.pushNamed(context, route),
            ),
        ],
      ),
    );
  }
}
