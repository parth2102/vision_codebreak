import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_appfull/utils/flutkart.dart';
import 'package:flutter_appfull/utils/my_navigator.dart';
import 'package:flutter_tts/flutter_tts.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final FlutterTts flutterTts = new FlutterTts();

  @override
  void initState() {
    _speak();
    super.initState();
    Timer(Duration(milliseconds: 4000), () => MyNavigator.goToIntro(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          _speak1();
//          Timer(Duration(seconds: 5), () => MyNavigator.goToIntro(context));
        },
//        onDoubleTap: () {
//          _speak1();
//        },
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(color: Colors.redAccent),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 50.0,
                          child: Icon(
                            Icons.layers,
                            color: Colors.greenAccent,
                            size: 50.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                        ),
                        Text(
                          Flutkart.name,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 24.0),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircularProgressIndicator(),
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                      ),
                      Text(
                        Flutkart.store,
                        softWrap: true,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            color: Colors.white),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Future _speak() async {
    await flutterTts.speak("Hello , Welcome To Vision!");
  }

  Future _speak1() async {
    await flutterTts.speak(
        "The purpose of Vision is to provide you the help for reading easily !");
  }
}
