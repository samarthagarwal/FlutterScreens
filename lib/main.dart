import 'package:flutter/material.dart';
import 'package:flutter_login_screens/misc/rating.dart';

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
  List<int> _ratings = [
    4,
    2,
    3,
    4,
    3,
    5,
    2,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Divider(
                height: 50.0,
                color: Colors.white,
              ),
////            ColorLoader(colors: colors, duration: Duration(milliseconds: 1200)),
////            Divider(
////              height: 20.0,
////              color: Colors.white,
////            ),
////            ColorLoader3(
////              radius: 15.0,
////              dotRadius: 6.0,
////            ),
////            ColorLoader3(
////              radius: 20.0,
////              dotRadius: 5.0,
////            ),
////            Divider(height: 20.0, color: Colors.white),
////            ColorLoader2(),
////            Divider(
////              height: 50.0,
////              color: Colors.white,
////            ),
////            ColorLoader4(),
////            Divider(
////              height: 45.0,
////              color: Colors.white,
////            ),
////            ColorLoader4(
////              dotOneColor: Colors.pink,
////              dotTwoColor: Colors.amber,
////              dotThreeColor: Colors.deepOrange,
////              dotType: DotType.square,
////              duration: Duration(milliseconds: 1200),
////            ),
////            Divider(
////              height: 45.0,
////              color: Colors.white,
////            ),
////            ColorLoader4(
////              dotOneColor: Colors.pink,
////              dotTwoColor: Colors.amber,
////              dotThreeColor: Colors.deepOrange,
////              duration: Duration(seconds: 2),
////            ),
////            Divider(
////              height: 50.0,
////              color: Colors.white,
////            ),
////            ColorLoader4(
////              dotOneColor: Colors.indigoAccent,
////              dotTwoColor: Colors.teal,
////              dotThreeColor: Colors.pink,
////              dotType: DotType.diamond,
////              duration: Duration(milliseconds: 1500),
////            ),
////            Divider(
////              height: 45.0,
////              color: Colors.white,
////            ),
////            ColorLoader5(
////                dotOneColor: Colors.redAccent,
////                dotTwoColor: Colors.blueAccent,
////                dotThreeColor: Colors.green,
////                dotType: DotType.circle,
////                dotIcon: Icon(Icons.adjust),
////                duration: Duration(seconds: 1),
////              )

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Rating(
                    initialRating: _ratings[0],
                    size: 24.0,
                    color: Colors.redAccent,
                    onRated: (int value) {
                      setState(() {
                        _ratings[0] = value;
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      _ratings[0].toString(),
                      style: TextStyle(
                        fontSize: 24.0,
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Rating(
                    initialRating: _ratings[1],
                    size: 36.0,
                    color: Colors.blueAccent,
                    onRated: (int value) {
                      setState(() {
                        _ratings[1] = value;
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      _ratings[1].toString(),
                      style: TextStyle(
                        fontSize: 24.0,
                      ),
                    ),
                  )
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Rating(
                    initialRating: _ratings[2],
                    size: 48.0,
                    color: Colors.amber,
                    onRated: (int value) {
                      setState(() {
                        _ratings[2] = value;
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      _ratings[2].toString(),
                      style: TextStyle(
                        fontSize: 24.0,
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Rating(
                    initialRating: _ratings[4],
                    size: 36.0,
                    color: Colors.green,
                    onRated: (int value) {
                      setState(() {
                        _ratings[4] = value;
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      _ratings[4].toString(),
                      style: TextStyle(
                        fontSize: 24.0,
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Rating(
                    initialRating: _ratings[5],
                    size: 18.0,
                    color: Colors.deepPurple,
                    onRated: (int value) {
                      setState(() {
                        _ratings[5] = value;
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      _ratings[5].toString(),
                      style: TextStyle(
                        fontSize: 24.0,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
