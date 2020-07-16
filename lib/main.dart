import 'package:cognitionAD/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(CognitionAD());
}

class CognitionAD extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       
      home: HomePage(),
    );
  }
}

