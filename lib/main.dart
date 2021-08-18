import 'package:flutter/material.dart';
import 'package:flutterloginscreens/Examples/buttons.dart';
import 'package:flutterloginscreens/buttons/simple_round_button.dart';
import 'package:flutterloginscreens/buttons/simple_round_icon_button.dart';
import 'package:flutterloginscreens/buttons/simple_round_only_icon_button.dart';
import 'package:flutterloginscreens/experiments/graph.dart';
import 'package:flutterloginscreens/misc/rating.dart';
import 'misc/slide_list_view.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: SlideListView(
          view1: buildPage(Colors.red, "Page 1"),
          view2: buildPage(Colors.green, "Page 2"),
          floatingActionButtonColor: Colors.yellow[800]!,
          floatingActionButtonIcon: AnimatedIcons.view_list,
          showFloatingActionButton: true,
          defaultView: "slides",
          duration: Duration(
            milliseconds: 800,
          ),
        ),
      ),
    );
  }

  Container buildPage(Color color, String text) {
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
