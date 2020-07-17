import 'package:cognitionAD/constants/colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var height1 = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
     elevation: 0,
      ),
      body: Center(
        child: Column(
                  children: [
                    Text(
            'CognitionAD',
            style: Style.bigHead,
            textAlign: TextAlign.center,
          ),
        
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('Level 1',
            style: Style.smolHead,
            ),
          ),
         
                  ]
        ),
      ),
    
    );
  }
}
