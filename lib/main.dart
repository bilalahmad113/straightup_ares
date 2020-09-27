import 'dart:async';
import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:straightup_ares/home.dart';
import 'package:straightup_ares/navigation_bar.dart';
import 'package:straightup_ares/splash_screen.dart';
import 'package:straightup_ares/welcome.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: SplashScreen(),
      theme: ThemeData(primarySwatch: Colors.blue), home:splash_screen(),
      routes: <String,WidgetBuilder>
      {
        '/Home': (BuildContext context) => new welcome()
      },
    );
  }
}






