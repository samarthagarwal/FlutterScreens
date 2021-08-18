import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterloginscreens/loaders/color_loader_2.dart';
import 'package:flutterloginscreens/loaders/color_loader_3.dart';
import 'package:flutterloginscreens/loaders/color_loader_4.dart';
import 'package:flutterloginscreens/loaders/dot_type.dart';

enum ToggleStatus { left, right, middle }
late ToggleStatus _toggleStatus;

class SlidingPageViewOne extends StatefulWidget {
  const SlidingPageViewOne({Key? key}) : super(key: key);

  @override
  _SlidingPageViewOneState createState() => _SlidingPageViewOneState();
}

class _SlidingPageViewOneState extends State<SlidingPageViewOne> {
  final PageController _pageController = PageController(initialPage: 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          "Slider Page View",
          style: TextStyle(fontFamily: "icomoon", fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.black,
        width: double.infinity,
        child: Stack(
          children: [
            PageView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                ColorLoader2(
                  color1: Colors.red[900]!,
                  color2: Colors.blue[900]!,
                  color3: Colors.black,
                ),
                ColorLoader3(dotRadius: 30, radius: 60),
                ColorLoader4(
                  dotIcon: Icon(CupertinoIcons.circle_fill),
                  dotOneColor: Colors.blue[900]!,
                  dotTwoColor: Colors.amber,
                  dotThreeColor: Colors.red[900]!,
                  dotType: DotType.icon,
                  duration: Duration(milliseconds: 600),
                ),
              ],
              controller: _pageController,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 5, 30, 30),
                child: ToggleSwitch(pageController: _pageController),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _toggleStatus = ToggleStatus.middle;
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
}

class ToggleSwitch extends StatefulWidget {
  ToggleSwitch({
    required this.pageController,
    this.valueChanged,
  });
  final PageController pageController;
  final ValueChanged<double>? valueChanged;

  @override
  _ToggleSwitchState createState() => _ToggleSwitchState();
}

class _ToggleSwitchState extends State<ToggleSwitch> {
  late double val;
  late ValueNotifier<double> valueListener;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Row(
      children: [
        Expanded(
          child: Container(
            height: height * 0.08,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue[900]!, Colors.red[900]!],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.red[900]!.withOpacity(0.3),
                  spreadRadius: 4,
                  blurRadius: 10,
                  offset: Offset(2, 2),
                ),
              ],
              borderRadius: BorderRadius.circular(30),
            ),
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Visibility(
                      visible: _toggleStatus != ToggleStatus.right,
                      child: DragTargetChild(
                          text: "Page 1",
                          color: _toggleStatus == ToggleStatus.middle
                              ? Colors.white
                              : Colors.white70),
                    ),
                    Visibility(
                      visible: _toggleStatus != ToggleStatus.left,
                      child: DragTargetChild(
                          text: "Page 3",
                          color: _toggleStatus == ToggleStatus.middle
                              ? Colors.white
                              : Colors.white70),
                    ),
                  ],
                ),
                AnimatedBuilder(
                  animation: valueListener,
                  builder: (context, child) {
                    val = valueListener.value * 2 - 1;
                    // if (valueListener.value <= 0.4)
                    //   val = -1.0;
                    // else if (valueListener.value >= 0.7) val = 1.0;
                    return Align(
                      alignment: Alignment(val, .5),
                      child: child,
                    );
                  },
                  child: GestureDetector(
                    onHorizontalDragUpdate: (details) {
                      valueListener.value = (valueListener.value +
                              details.delta.dx / context.size!.width)
                          .clamp(.0, 1.0);
                      if (valueListener.value <= 0.4) {
                        setState(() => _toggleStatus = ToggleStatus.right);
                        changeToggle(false);
                      }

                      if (valueListener.value >= 0.6) {
                        setState(() => _toggleStatus = ToggleStatus.left);
                        changeToggle(true);
                      }

                      if (valueListener.value >= 0.46 &&
                          valueListener.value <= 0.56) {
                        setState(() => _toggleStatus = ToggleStatus.middle);
                        _toggleMiddle();
                      }
                    },
                    child: draggableToggleSwitch(height, 1.2),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget draggableToggleSwitch(double height, double scale) => Transform.scale(
        scale: scale,
        child: Image.asset("assets/images/toggleIcon.png", fit: BoxFit.contain),
      );

  changeToggle(bool val) => widget.pageController.animateToPage(
        val ? 2 : 0,
        duration: Duration(milliseconds: 200),
        curve: Curves.fastLinearToSlowEaseIn,
      );

  _toggleMiddle() => widget.pageController.animateToPage(1,
      duration: Duration(milliseconds: 400), curve: Curves.decelerate);

  @override
  void initState() {
    super.initState();
    initialSliderValue();
    valueListener.addListener(notifyParent);
  }

  @override
  void dispose() {
    valueListener.dispose();
    super.dispose();
  }

  void notifyParent() {
    if (widget.valueChanged != null) {
      widget.valueChanged!(valueListener.value);
    }
  }

  initialSliderValue() {
    if (_toggleStatus == ToggleStatus.left)
      val = 1.0;
    else if (_toggleStatus == ToggleStatus.right)
      val = 0.0;
    else
      val = 0.5;

    valueListener = ValueNotifier(val);
  }
}

class DragTargetChild extends StatelessWidget {
  const DragTargetChild({required this.text, required this.color});
  final String? text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          text!,
          style: TextStyle(color: color, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
