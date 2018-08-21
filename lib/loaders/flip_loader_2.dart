import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

class FlipLoader2 extends StatefulWidget {
  @override
  _FlipLoader2State createState() => _FlipLoader2State();
}

class _FlipLoader2State extends State<FlipLoader2>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> rotationHorizontal;
  Animation<double> rotationVertical;
  double verticalRotation = 0.0;
  double horizontalRotation = 0.0;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    rotationHorizontal = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(0.0, 0.50, curve: Curves.fastOutSlowIn)));
    rotationVertical = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(0.50, 1.0, curve: Curves.fastOutSlowIn)));

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          controller.reverse();
        });
      }
      if (status == AnimationStatus.dismissed) {
        setState(() {
          controller.forward();
        });
      }
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return new AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget child) {
        return Container(
          child: new Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.006)
              ..rotateX((pi * rotationVertical.value))
              ..rotateY((pi * rotationHorizontal.value)),
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: new BorderRadius.all(const Radius.circular(8.0)),
                color: Colors.blueAccent,
              ),
              width: 40.0,
              height: 40.0,
              child: new Center(
                child: Icon(
                  Icons.wifi, color: Colors.white
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
