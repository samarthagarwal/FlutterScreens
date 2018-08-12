import 'package:flutter/material.dart';
import '../buttons/simple_round_button.dart';
import '../buttons/simple_round_icon_button.dart';
import '../buttons/simple_round_only_icon_button.dart';

class ButtonExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.only(top: 30.0),
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      child: new Column(
        children: <Widget>[
          SimpleRoundButton(
            backgroundColor: Colors.redAccent,
            buttonText: Text("LOGIN", style: TextStyle(
                color: Colors.white
            ),),
            textColor: Colors.white,
          ),

          SimpleRoundIconButton(
            backgroundColor: Colors.orangeAccent,
            buttonText: Text("SEND EMAIL", style: TextStyle(
                color: Colors.white
            ),),
            textColor: Colors.white,
            icon: Icon(Icons.email),
          ),

          SimpleRoundIconButton(
            backgroundColor: Colors.pinkAccent,
            buttonText: Text("LISTEN TO MUSIC", style: TextStyle(
                color: Colors.white
            ),),
            textColor: Colors.white,
            icon: Icon(Icons.headset_mic),
            iconAlignment: Alignment.centerRight,
          ),

          SimpleRoundIconButton(
            backgroundColor: Colors.deepOrangeAccent,
            buttonText: Text("SHARE ON SOCIAL", style: TextStyle(
                color: Colors.white
            ),),
            textColor: Colors.white,
            icon: Icon(Icons.share),
          ),

          SimpleRoundOnlyIconButton(
            backgroundColor: Colors.lightGreen,
            icon: Icon(Icons.share),
            iconAlignment: Alignment.center,
          ),

          new Row(
            children: <Widget>[
              new Container(
                width: MediaQuery.of(context).size.width * 0.5,
                child: SimpleRoundOnlyIconButton(
                  backgroundColor: Colors.blueAccent,
                  icon: Icon(Icons.phone),
                  iconAlignment: Alignment.center,
                ),
              ),

              new Container(
                width: MediaQuery.of(context).size.width * 0.5,
                child: SimpleRoundOnlyIconButton(
                  backgroundColor: Colors.redAccent,
                  icon: Icon(Icons.message),
                  iconAlignment: Alignment.center,
                ),
              ),

            ],
          ),

          SimpleRoundOnlyIconButton(
            backgroundColor: Colors.green,
            icon: Icon(Icons.message),
            iconColor: Colors.redAccent,
            iconAlignment: Alignment.centerRight,
          ),

          SimpleRoundOnlyIconButton(
            backgroundColor: Colors.redAccent,
            icon: Icon(Icons.details),
            iconColor: Colors.redAccent,
            iconAlignment: Alignment.centerLeft,
          ),


          new Row(
            children: <Widget>[
              new Container(
                width: MediaQuery.of(context).size.width * 0.66,
                child: SimpleRoundIconButton(
                  backgroundColor: Colors.deepOrangeAccent,
                  buttonText: Text("PLAY", style: TextStyle(
                      color: Colors.white
                  ),),
                  textColor: Colors.white,
                  icon: Icon(Icons.play_arrow),
                  iconAlignment: Alignment.centerRight,
                ),
              ),

              new Container(
                width: MediaQuery.of(context).size.width * 0.33,
                child: SimpleRoundButton(
                  backgroundColor: Colors.greenAccent,
                  buttonText: Text("OK", style: TextStyle(
                      color: Colors.green
                  ),),
                  textColor: Colors.white,
                ),
              ),
            ],
          ),


        ],
      ),
    );
  }
}
