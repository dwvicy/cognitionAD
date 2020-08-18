import 'package:cognitionAD/constants/colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> names = ["Reaction Time", "Odd Color", "Memory Game"];
  List<IconData> icons = [Icons.touch_app, Icons.color_lens, Icons.memory];
  List<Color> colors = [AppTheme.ello, AppTheme.red, AppTheme.blue];

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    var height1 = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'CognitionAD',
                style: Style.bigHead,
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Level 1',
                  style: Style.smolHead,
                ),
              ),
              Container(color: Colors.transparent, height: 40, width: 20),
              Expanded(
                child: Container(
                  height: 100,
                  child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          switch (index % 10) {
                            case 0:
                              Navigator.pushNamed(context, '/react');

                              break;
                            case 1:
                              Navigator.pushNamed(context, '/block');
                              break;

                            case 2:
                              Navigator.pushNamed(context, '/memory');
                              break;
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              child: Center(
                                  child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Icon(
                                        icons[index],
                                        size: 50,
                                      ),
                                    ),
                                    Text(
                                      names[index],
                                      textAlign: TextAlign.center,
                                      style: Style.smolHead,
                                    ),
                                  ])),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(40)),
                                  color: colors[index],
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                      color: Colors.black54,
                                      blurRadius: 2,
                                      offset: Offset(0, 1.5),
                                    ),
                                  ]),
                              height: 155,
                              width: 155),
                        ),
                      );
                    },
                    padding: EdgeInsets.all(10),
                  ),
                ),
              ),
              // GestureDetector(
              //   child: Container(
              //     child: Center(child: Text('Start', style: Style.bigHead)),
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.all(Radius.circular(30)),
              //         color: AppTheme.white,
              //         boxShadow: <BoxShadow>[
              //           BoxShadow(
              //             color: Colors.black54,
              //             blurRadius: 2,
              //             offset: Offset(0, 1.5),
              //           ),
              //         ]),
              //     width: 247,
              //     height: 85,
              //   ),
              // ),
            ]),
      ),
    );
  }
}
