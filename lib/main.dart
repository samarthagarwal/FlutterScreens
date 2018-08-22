import 'package:flutter/material.dart';
import 'loaders/color_loader.dart';
import 'loaders/flip_loader.dart';

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
              Divider(
                height: 150.0,
                color: Colors.white,
              ),
              ColorLoader(
                  colors: colors, duration: Duration(milliseconds: 1200)),
              Divider(
                height: 100.0,
                color: Colors.white,
              ),
              FlipLoader(
                  loaderBackground: Colors.red,
                  iconColor: Colors.white,
                  icon: Icons.email,
                  animationType: "full_flip"),
              Divider(height: 100.0, color: Colors.white),
              FlipLoader(
                loaderBackground: Colors.blueAccent,
                iconColor: Colors.orangeAccent,
                icon: Icons.subway,
                animationType: "half_flip",
                rotateIcon: true,
              ),
              Divider(height: 100.0, color: Colors.white),
              FlipLoader(
                loaderBackground: Colors.green,
                iconColor: Colors.white,
                icon: Icons.wifi,
                animationType: "half_flip",
                shape: "circle",
                rotateIcon: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
