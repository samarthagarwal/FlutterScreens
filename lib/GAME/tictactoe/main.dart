import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'home.dart';
import 'level2.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "home",
    routes: {
      "home": (context) => HomePage(),
      "level2": (context) => LevelSec(),
      // "login": (context) => LoginScreen(),
      // "home": (context) => Myhome(),
      // "sup": (context) => Sup(),
    },
  ));
}
