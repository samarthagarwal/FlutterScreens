import 'dart:math';
import 'package:flutter/material.dart';

class SlideListView extends StatefulWidget {
  final Widget? view1;
  final Widget? view2;
  final String? defaultView;
  final Duration duration;
  final bool enabledSwipe;
  final Color floatingActionButtonColor;
  final bool showFloatingActionButton;
  final AnimatedIconData floatingActionButtonIcon;

  SlideListView({
    this.view1,
    this.view2,
    this.defaultView = "slides",
    this.floatingActionButtonColor = Colors.blue,
    this.showFloatingActionButton = true,
    this.enabledSwipe = false,
    this.floatingActionButtonIcon = AnimatedIcons.view_list,
    this.duration = const Duration(
      milliseconds: 400,
    ),
  });

  @override
  _SlideListViewState createState() => _SlideListViewState();
}

class _SlideListViewState extends State<SlideListView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  PageController _mainPageController = PageController();
  double currentPageValue = 0.0;
  double _viewportFraction = 0.95;
  String _currentView = "slides";

  @override
  void initState() {
    super.initState();
    currentPageValue = 0.0;
    _viewportFraction = 0.95;
    if (widget.defaultView == null) {
      _currentView = "slides";
    } else {
      _currentView = "list";
    }
    _mainPageController = PageController(initialPage: 0, viewportFraction: 1.0);
    _mainPageController.addListener(() {
      setState(() {
        currentPageValue = _mainPageController.page!;
      });
    });
    _animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
            physics: widget.enabledSwipe
                ? AlwaysScrollableScrollPhysics()
                : NeverScrollableScrollPhysics(),
            controller: _mainPageController,
            onPageChanged: (int newPage) {
              if (newPage == 0) {
                _currentView = "slides";
              } else {
                _currentView = "list";
              }
            },
            itemCount: 2,
            itemBuilder: (ctx, index) {
              if (index == 0) {
                return Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.0005)
                    ..rotateY((currentPageValue - index) * sqrt(2)),
                  origin: currentPageValue <= index
                      ? Offset(0, 0)
                      : Offset(
                          MediaQuery.of(ctx).size.width * _viewportFraction, 0),
                  child: widget.view1,
                );
              } else {
                // the following code won't work as long as itemCount is set to 1
                return Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.0005)
                    ..rotateY((currentPageValue - index) * sqrt(2)),
                  origin: currentPageValue <= index
                      ? Offset(0, 0)
                      : Offset(
                          MediaQuery.of(ctx).size.width * _viewportFraction, 0),
                  child: widget.view2,
                );
              }
            },
          ),
          if (widget.showFloatingActionButton)
            Positioned(
              bottom: 8.0,
              right: 8.0,
              child: CircleAvatar(
                backgroundColor: widget.floatingActionButtonColor,
                child: IconButton(
                  icon: AnimatedIcon(
                    icon: widget.floatingActionButtonIcon,
                    progress: _animationController,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    if (_currentView == "slides") {
                      _animationController.forward();

                      _mainPageController.animateToPage(1,
                          duration: widget.duration, curve: Curves.easeIn);
                    } else {
                      _animationController.reverse();
                      _mainPageController.animateToPage(0,
                          duration: widget.duration, curve: Curves.easeIn);
                    }
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}
