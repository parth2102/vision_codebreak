import 'package:flutter/material.dart';
import 'package:flutter_appfull/pages/home_screen.dart';
import 'package:flutter_appfull/pages/intro_screen.dart';
import 'package:flutter_appfull/pages/splash_screen.dart';

var routes = <String, WidgetBuilder>{
  "/home": (BuildContext context) => HomeScreen(),
  "/intro": (BuildContext context) => IntroScreen(),
};

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.red, accentColor: Colors.yellowAccent),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        routes: routes);
  }
}
