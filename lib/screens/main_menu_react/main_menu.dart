import 'package:cognitionAD/constants/colors.dart';
import 'package:cognitionAD/models/modes.dart';
import 'package:cognitionAD/screens/user_stats/user_stats.dart';
import 'package:flutter/material.dart';
import 'package:cognitionAD/screens/play_screen/play_screen.dart';
import 'package:cognitionAD/global_bloc.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:cognitionAD/models/highscore.dart';

import 'package:provider/provider.dart';

class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  // final PageController viewController = PageController(viewportFraction: 0.8, initialPage: 0);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 120);

    return Scaffold(
      backgroundColor: AppTheme.white,
      // drawer: Drawer(
      //   elevation: 10,
      //   child: ListView(
      //     children: <Widget>[

      //     ],
      //   ),
      // ),
      // appBar: AppBar(
      //   backgroundColor: Colors.deepPurpleAccent,
      //   elevation: 0,
      //   title: Text(
      //     "FLX",
      //     style: TextStyle(
      //       color: Colors.black,
      //       fontSize: 24,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      //   centerTitle: true,
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/');
                    },
                    icon: Icon(Icons.arrow_back_ios),
                    color: Colors.yellow[700],
                  ),
                ),
                Text(
                  "React",
                  style: Style.bigHead,
                ),
              ]),
            ),
            Container(
              height: itemHeight,
              child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 10,
                  children: [
                    ModeCard(Modes.Visual),
                    ModeCard(Modes.Vibrate),
                    // ModeCard(Modes.Sound),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: GestureDetector(
                    //     child: Card(
                    //       elevation: 8.0,
                    //       color: AppTheme.ello,
                    //       child: Container(
                    //           decoration: BoxDecoration(
                    //               borderRadius: BorderRadius.all(Radius.circular(40))),
                    //           child: Center(
                    //             child: Text("Personal Stats",
                    //                 textAlign: TextAlign.center,
                    //                 style: TextStyle(
                    //                     color: Colors.black,
                    //                     fontSize: 30,
                    //                     fontWeight: FontWeight.bold)),
                    //           )),
                    //     ),
                    //     onTap: () {
                    //       Navigator.push(
                    //         context,
                    //         MaterialPageRoute(builder: (context) => StatsAnimation()),
                    //       );
                    //     },
                    //   ),
                    // )
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}

//   void dispose() {
//     super.dispose();
//     viewController.dispose();
//   }
// }

class ModeCard extends StatefulWidget {
  Modes mode;
  String modeName;
  String animationPath;

  ModeCard(this.mode) {
    switch (mode) {
      case Modes.Visual:
        modeName = "Visual Mode";
        // animationPath = "assets/animation/tap_animation.flr";
        break;
      case Modes.Vibrate:
        modeName = "Vibrate Mode";
        // animationPath = "assets/animation/vibrate_animation.flr";
        break;
      case Modes.Sound:
        modeName = "Sound Mode";
        // animationPath = "assets/animation/sound_animation.flr";
        break;
    }
  }

  @override
  _ModeCardState createState() => _ModeCardState();
}

class _ModeCardState extends State<ModeCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Card(
        elevation: 8.0,
        color: AppTheme.ello,
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(40))),
          child: InkWell(
            onTap: () {
              if (widget.mode == Modes.Visual) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlayScreen(
                      Modes.Visual,
                    ),
                  ),
                );
              } else if (widget.mode == Modes.Vibrate) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlayScreen(
                      Modes.Vibrate,
                    ),
                  ),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlayScreen(
                      Modes.Sound,
                    ),
                  ),
                );
              }
            },
            splashColor: Colors.indigo,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    widget.modeName,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  // Container(
                  //   height: 300,
                  //   child: FlareActor(
                  //     widget.animationPath,
                  //     color: Colors.black,
                  //     alignment: Alignment.center,
                  //     fit: BoxFit.contain,
                  //     animation: "animate",
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
