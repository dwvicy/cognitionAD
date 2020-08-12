import 'package:cognitionAD/screens/block_game.dart';
import 'package:cognitionAD/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:cognitionAD/screens/react_screen.dart';

void main() {
  runApp(CognitionAD());
}

class CognitionAD extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {'/react': (context) => ColorMatch(), 'block': (context) => BlockGame()},
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
