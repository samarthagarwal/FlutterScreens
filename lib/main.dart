import 'package:flutter/material.dart';
import 'loaders/color_loader.dart';
import 'loaders/flip_loader.dart';
import 'loaders/flip_loader_2.dart';

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
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.indigo,
    Colors.pinkAccent,
    Colors.blue
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: new Padding(
          padding: const EdgeInsets.only(top: 100.0),
          child: new Column(
            children: <Widget>[
              Divider(height: 200.0, color: Colors.white,),
              ColorLoader(
                  colors: colors,
                  duration: Duration(milliseconds: 1200)
              ),
              Divider(height: 150.0, color: Colors.white,),
              FlipLoader2(),
              Divider(height: 150.0, color: Colors.white,),
              FlipLoader()
            ],
          ),
        ),
      ),
    );
  }
}
