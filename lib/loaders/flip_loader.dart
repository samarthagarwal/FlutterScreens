import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

class FlipLoader extends StatefulWidget {
  Color loaderBackground;
  Color iconColor;
  IconData icon;

  FlipLoader({this.loaderBackground = Colors.redAccent, this.iconColor = Colors.white, this.icon = Icons.sync});
  
  
  @override
  _FlipLoaderState createState() => _FlipLoaderState(this.loaderBackground, this.iconColor, this.icon);
}

class _FlipLoaderState extends State<FlipLoader>
    with SingleTickerProviderStateMixin {
  
  AnimationController controller;
  Animation<double> rotationHorizontal;
  Animation<double> rotationVertical;
  Color loaderColor;
  Color iconColor;
  IconData icon;
  double verticalRotation = 0.0;
  double horizontalRotation = 0.0;

  _FlipLoaderState(this.loaderColor, this.iconColor, this.icon);

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        duration: const Duration(milliseconds: 4000), vsync: this);
    rotationHorizontal = Tween<double>(begin: -1.0, end: 1.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(0.0, 0.50, curve: Curves.linear)));
    rotationVertical = Tween<double>(begin: -1.0, end: 1.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(0.50, 1.0, curve: Curves.linear)));


    controller.addStatusListener((status){
      if (status == AnimationStatus.completed) {
        setState(() {
          controller.repeat();
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
              ..rotateX(sin(pi * rotationVertical.value))
              ..rotateY(sin(pi * rotationHorizontal.value)),
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: new BorderRadius.all(const Radius.circular(8.0)),
                color: loaderColor,
              ),
              width: 40.0,
              height: 40.0,
              child: new RotationTransition(
                turns: rotationHorizontal.value == 1.0 ? rotationVertical : rotationHorizontal,
                child: Icon(
                  icon,
                  color: iconColor,
                  size: 20.0,
                ),
              )
            ),
          ),
        );
      },
    );
  }
}
