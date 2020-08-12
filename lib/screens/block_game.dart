import 'package:cognitionAD/constants/colors.dart';
import 'package:cognitionAD/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math' as math;
import 'package:shared_preferences/shared_preferences.dart';

class BlockGame extends StatefulWidget {
  BlockGame({Key key}) : super(key: key);

  @override
  _BlockGameState createState() => _BlockGameState();
}

class _BlockGameState extends State<BlockGame> {
  bool _gameOver = false;

  int _seconds = 60;
  int _level = 1;
  int _bestLevel = 1;

  int _crossAxisCount = 3;

  int _diffIndex;
  Color _diffColor;
  Color _color;

  @override
  void initState() {
    super.initState();

    _updateData();
  }

  void _updateData() async {
    final crossAxisCount = math.min(10, ((_level + 5) / 2).floor());

    final rand = math.Random();
    final diffIndex = rand.nextInt(crossAxisCount * crossAxisCount);
    Color color = Color((math.Random().nextDouble() * 0xFFFFFF).toInt() << 0).withOpacity(1);
    Color diffColor = Color((math.Random().nextDouble() * 0xFFFFFF).toInt() << 0).withOpacity(1);

    (diffColor != color)
        ? diffColor = Color((math.Random().nextDouble() * 0xFFFFFF).toInt() << 0).withOpacity(1)
        : diffColor = Color((math.Random().nextDouble() * 0xFFFFFF).toInt() << 0).withOpacity(1);

    var prefs = await SharedPreferences.getInstance();
    var bestLevel = prefs.getInt('BEST') ?? 1;

    if (bestLevel < _level) {
      await prefs.setInt('BEST', _level);
      bestLevel = _level;
    }

    setState(() {
      _diffIndex = diffIndex;
      _color = color;

      _diffColor = diffColor;
      _crossAxisCount = crossAxisCount;
      _bestLevel = bestLevel;
    });
  }

  void _setGameOver() {
    setState(() {
      _seconds = 0;
      _gameOver = true;
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(title: Text('Game Over', style: Style.bigHead), actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                    color: AppTheme.blue,
                    onPressed: () {
                      Navigator.pop(context);
                      _restart();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Play Again', style: Style.smolHead),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                    color: AppTheme.ello,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) => HomePage()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Play Another', style: Style.smolHead),
                    )),
              )
            ]);
          });
    });
  }

  void _restart() {
    setState(() {
      _gameOver = false;
      _level = 1;
      _seconds = 60;
    });

    _updateData();
  }

  void _setTimer() {
    Timer.periodic(
      Duration(seconds: 1),
      (Timer t) {
        if (_seconds <= 0) {
          t.cancel();
          _setGameOver();
        } else {
          setState(() {
            _seconds = _seconds - 1;
          });
        }
      },
    );
  }

  void _onTimePressed() {
    if (_gameOver) {
      _restart();
    } else {
      _setGameOver();
    }
  }

  void _onColorPressed(int index) {
    if (!_gameOver && index == _diffIndex) {
      if (_level == 1) {
        _setTimer();
      }
      _updateData();
      setState(() {
        _level = _level + 1;
      });
    }
  }

  Widget _buildToolbar() {
    return Container(
      height: 100,
      padding: EdgeInsets.symmetric(horizontal: 8),
      alignment: Alignment.center,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(
            child: InkWell(
              onTap: _onTimePressed,
              child: Container(
                height: 80,
                margin: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: AppTheme.red,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                alignment: Alignment.center,
                child: _gameOver
                    ? Icon(
                        Icons.refresh,
                        color: Colors.white,
                        size: 36,
                      )
                    : Text(_seconds.toString(), style: Style.smolHead),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              height: 80,
              margin: EdgeInsets.symmetric(horizontal: 8),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppTheme.ello,
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: Container(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text('Level', style: Style.smollyWhite),
                          Text(_level.toString(), style: Style.smollyWhite),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text('Best', style: Style.smollyWhite),
                          Text(
                            _bestLevel.toString(),
                            style: Style.smollyWhite,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSquare() {
    return SizedBox(
      height: MediaQuery.of(context).size.width,
      child: GridView.count(
        physics: ScrollPhysics(),
        padding: EdgeInsets.all(2),
        crossAxisCount: _crossAxisCount,
        children: List.generate(
          _crossAxisCount * _crossAxisCount,
          (index) => _buildColorBox(index),
        ),
      ),
    );
  }

  Widget _buildColorBox(int index) {
    return Padding(
      padding: EdgeInsets.all(2),
      child: RaisedButton(
        color: index != _diffIndex ? _color : _diffColor,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(6),
          ),
        ),
        onPressed: () {
          _onColorPressed(index);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'Odd Color',
                  style: Style.bigHead,
                ),
                _buildToolbar(),
                _buildSquare(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
