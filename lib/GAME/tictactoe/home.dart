import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// void main() {
//   runApp(MyApp());
// }

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool ohTurn = true;

  List<String> displayExOh = ['', '', '', '', '', '', '', '', ''];
  var myTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 30,
  );
  int ohScore = 0;
  int exScore = 0;
  int filledBoxes = 0;

  static var myNewFont = GoogleFonts.pressStart2p(
      textStyle: TextStyle(
    color: Colors.black,
    letterSpacing: 3,
  ));
  static var myNewFontWhite = GoogleFonts.pressStart2p(
      textStyle:
          TextStyle(color: Colors.white, letterSpacing: 1, fontSize: 14));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(padding: const EdgeInsets.only(top: 40)),
                        Text(
                          'Player O',
                          style: myNewFontWhite,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          ohScore.toString(),
                          style: myNewFontWhite,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(padding: const EdgeInsets.only(top: 40)),
                        Text(
                          'Player X',
                          style: myNewFontWhite,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          exScore.toString(),
                          style: myNewFontWhite,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              color: Colors.red,
            ),
          ),
          SizedBox(
            height: 80,
          ),
          Expanded(
            flex: 3,
            child: GridView.builder(
                padding: EdgeInsets.all(30),
                // addRepaintBoundaries: true,
                itemCount: 9,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 2.0,
                    crossAxisSpacing: 2.0,
                    crossAxisCount: 3),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      _tapped(index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0x665ac18e),
                                Color(0x995ac18e),
                                Color(0xcc5ac18e),
                                Color(0xff5ac18e),
                              ]),
                          border: Border.all(
                              color: Colors.black,
                              style: BorderStyle.solid,
                              width: 2.0)),
                      child: Center(
                        child: Text(
                          displayExOh[index],
                          style: TextStyle(color: Colors.white, fontSize: 40),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          SizedBox(
            height: 80,
          ),
          Expanded(
            child: Column(
              children: [
                Text('DESIGNED_BY -> Ali',
                    style: TextStyle(
                        fontStyle: FontStyle.italic, color: Colors.white))
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (ohTurn && displayExOh[index] == '') {
        displayExOh[index] = 'O';
        filledBoxes += 1;
      } else if (!ohTurn && displayExOh[index] == '') {
        displayExOh[index] = 'X';
        filledBoxes += 1;
      }

      ohTurn = !ohTurn;
      _checkwinner();
    });
  }

  void _checkwinner() {
    if (filledBoxes == 9) {
      _showDrawDialog();
    }
    if (displayExOh[0] == displayExOh[1] &&
        displayExOh[0] == displayExOh[2] &&
        displayExOh[0] != '') {
      _showWinDialog(displayExOh[0]);
    }

    if (displayExOh[3] == displayExOh[4] &&
        displayExOh[3] == displayExOh[5] &&
        displayExOh[3] != '') {
      _showWinDialog(displayExOh[3]);
    }

    if (displayExOh[6] == displayExOh[7] &&
        displayExOh[6] == displayExOh[8] &&
        displayExOh[6] != '') {
      _showWinDialog(displayExOh[6]);
    }

    if (displayExOh[0] == displayExOh[3] &&
        displayExOh[0] == displayExOh[6] &&
        displayExOh[0] != '') {
      _showWinDialog(displayExOh[0]);
    }

    if (displayExOh[1] == displayExOh[4] &&
        displayExOh[1] == displayExOh[7] &&
        displayExOh[1] != '') {
      _showWinDialog(displayExOh[1]);
    }

    if (displayExOh[2] == displayExOh[5] &&
        displayExOh[2] == displayExOh[8] &&
        displayExOh[2] != '') {
      _showWinDialog(displayExOh[2]);
    }

    if (displayExOh[6] == displayExOh[4] &&
        displayExOh[6] == displayExOh[2] &&
        displayExOh[6] != '') {
      _showWinDialog(displayExOh[6]);
    }

    if (displayExOh[0] == displayExOh[4] &&
        displayExOh[0] == displayExOh[8] &&
        displayExOh[0] != '') {
      _showWinDialog(displayExOh[0]);
    }
    // if (filledBoxes == 9) {
    //   _showDrawDialog();
    // }
  }

  void _showDrawDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return Container(
            child: AlertDialog(
              title: Text('REMATCH'),
              actions: [
                FlatButton(
                  onPressed: () {
                    _clearBoard();
                    Navigator.of(context).pop();
                  },
                  child: Text('Play Again'),
                )
              ],
            ),
          );
        });
  }

  void _showWinDialog(String winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('WINNER is ' + winner),
            actions: [
              FlatButton(
                onPressed: () {
                  _clearBoard();
                  Navigator.of(context).pop();
                },
                child: Text('Play Again'),
              )
            ],
          );
        });
    if (winner == 'O') {
      ohScore += 1;
    } else if (winner == 'X') {
      exScore += 1;
    }
  }

  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayExOh[i] = '';
      }
    });
    filledBoxes = 0;
  }
}
