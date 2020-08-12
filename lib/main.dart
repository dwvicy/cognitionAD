import 'package:cognitionAD/constants/colors.dart';
import 'package:cognitionAD/global_bloc.dart';
import 'package:cognitionAD/screens/block_game.dart';
import 'package:cognitionAD/screens/home_screen.dart';
import 'package:cognitionAD/screens/main_menu_react/main_menu.dart';
import 'package:cognitionAD/screens/memory_game.dart';
import 'package:cognitionAD/screens/user_stats/user_stats.dart';
import 'package:flutter/material.dart';
import 'package:cognitionAD/screens/react_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(CognitionAD());
}

class CognitionAD extends StatefulWidget {
  @override
  _CognitionADState createState() => _CognitionADState();
}

class _CognitionADState extends State<CognitionAD> {
  GlobalBloc globalBloc;

  void initState() {
    globalBloc = GlobalBloc();
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<GlobalBloc>.value(
        value: globalBloc,
        child: MaterialApp(
          routes: {
            '/react': (context) => MainMenu(),
            '/block': (context) => BlockGame(),
            '/stats': (context) => UserStats(),
            '/statAnim': (context) => StatsAnimation(),
            '/memory': (context) => Home()
          },
          theme: ThemeData(
            // primarySwatch: AppTheme.ello,
            // accentColor: AppTheme.blue,
            fontFamily: 'Josefin',
          ),
          debugShowCheckedModeBanner: false,
          home: HomePage(),
        ));
  }
}
