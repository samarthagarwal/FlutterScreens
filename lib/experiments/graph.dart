import 'package:flutter/material.dart';
import 'dart:math';
import 'package:vector_math/vector_math.dart' as Vector;

class Graph extends StatefulWidget {
  @override
  _GraphState createState() => _GraphState();
}

class _GraphState extends State<Graph> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 3143));
    animation = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: controller, curve: Interval(0.0, 1.0)));

    controller.addListener(() {
      setState(() {});
    });

    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint(
          painter: GraphPaint(controller.value),
          child: Container(height: 200.0, color: Colors.black12),
        ),

        Positioned(
          left: MediaQuery.of(context).size.width - 5,
          top: sin((controller.value * 360 - MediaQuery.of(context).size.width) % 360 * Vector.degrees2Radians) * 0.9 * 100 + 100,
          child: Container(
            width: 10.0,
            height: 10.0,
            decoration: BoxDecoration(
              color: Colors.redAccent,
              shape: BoxShape.circle
            ),
          ),
        )
      ],
    );
  }
}

class GraphPaint extends CustomPainter {
  double time;

  GraphPaint(this.time);

  @override
  void paint(Canvas canvas, Size size) {
    Paint p1 = new Paint()
      ..color = Colors.deepOrangeAccent
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    for (int i = 0; i <= size.width; i+=1) {
      canvas.drawLine(
          new Offset(i.toDouble(),
              (sin((time * 360 - i) % 360 * Vector.degrees2Radians) * 0.9 * size.height/2 + size.height/2)),
          new Offset(i.toDouble(),
              (sin((time * 360 - i) % 360 * Vector.degrees2Radians) * 0.9 * size.height/2 + size.height/2)),
          p1);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
