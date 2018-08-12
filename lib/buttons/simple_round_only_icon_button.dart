import 'package:flutter/material.dart';

class SimpleRoundOnlyIconButton extends StatelessWidget {
  final Color backgroundColor;
  final Icon icon;
  final Color iconColor;
  final Alignment iconAlignment;
  final Function onPressed;

  SimpleRoundOnlyIconButton(
      {this.backgroundColor = Colors.redAccent,
      this.icon,
      this.iconColor,
      this.iconAlignment = Alignment.center,
      this.onPressed});

  MainAxisAlignment getMainAxisAlignment() {
    if (this.iconAlignment == Alignment.center) {
      return MainAxisAlignment.center;
    } else if (this.iconAlignment == Alignment.centerLeft) {
      return MainAxisAlignment.start;
    } else if (this.iconAlignment == Alignment.centerRight) {
      return MainAxisAlignment.end;
    }
    return MainAxisAlignment.center;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: FlatButton(
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
              splashColor: this.backgroundColor,
              color: this.backgroundColor,
              child: new Row(
                mainAxisAlignment: getMainAxisAlignment(),
                children: <Widget>[
                  iconAlignment == Alignment.center
                      ? new Transform.translate(
                          offset: Offset(0.0, 0.0),
                          child: new Container(
                            padding: const EdgeInsets.only(
                                left: 5.0, right: 5.0, top: 10.0, bottom: 10.0),
                            child: FlatButton(
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(28.0)),
                              splashColor: backgroundColor,
                              color: backgroundColor,
                              child: Icon(
                                icon.icon,
                                color: iconColor == null ? Colors.white : iconColor,
                              ),
                              onPressed: () => {},
                            ),
                          ),
                        )
                      : Container(),
                  iconAlignment == Alignment.centerLeft
                      ? new Transform.translate(
                          offset: Offset(-10.0, 0.0),
                          child: new Container(
                            padding: const EdgeInsets.only(
                                left: 5.0, right: 5.0, top: 10.0, bottom: 10.0),
                            child: FlatButton(
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(28.0)),
                              splashColor: Colors.white,
                              color: Colors.white,
                              child: Icon(
                                icon.icon,
                                color: iconColor == null ? Colors.white : iconColor,
                              ),
                              onPressed: () => {},
                            ),
                          ),
                        )
                      : Container(),
                  iconAlignment == Alignment.centerRight ||
                          iconAlignment == Alignment.centerLeft
                      ? Expanded(
                          child: Container(),
                        )
                      : Container(),
                  iconAlignment == Alignment.centerRight
                      ? new Transform.translate(
                          offset: Offset(10.0, 0.0),
                          child: new Container(
                            padding: const EdgeInsets.only(
                                left: 5.0, right: 5.0, top: 10.0, bottom: 10.0),
                            child: FlatButton(
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(28.0)),
                              splashColor: Colors.white,
                              color: Colors.white,
                              child: Icon(
                                icon.icon,
                                color: this.iconColor,
                              ),
                              onPressed: () => {},
                            ),
                          ),
                        )
                      : Container()
                ],
              ),
              onPressed: () => onPressed,
            ),
          ),
        ],
      ),
    );
  }
}
