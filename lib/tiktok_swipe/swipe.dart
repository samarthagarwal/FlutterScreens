import 'package:flutter/material.dart';

void main() => runApp(Swipe());

class Swipe extends StatelessWidget {
  final controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: PageView(
          scrollDirection: Axis.vertical,
          controller: controller,
          children: [
            Container(
              color: Colors.orange.shade100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Swipe Up!",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 50),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.red.shade200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Swipe Up!",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 50),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.red.shade300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Swipe Up!",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 50),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.red.shade400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Swipe Up!",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 50),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.green.shade300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Swipe Up!",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 50),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.green.shade600,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Swipe Up!",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 50),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.green.shade900,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Swipe Up!",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 50),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.blue.shade200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Swipe Up!",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 50),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.blue.shade600,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Swipe Up!",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 50),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.blue.shade900,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Swipe Up!",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 50),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
