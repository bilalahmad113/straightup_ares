import 'package:animated_splash/animated_splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:straightup_ares/home.dart';
import 'dart:async';

import 'package:straightup_ares/navigation_bar.dart';
class splash_screen extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}
class _SplashState extends State<splash_screen> {
  startTime() async {
    var _duration = new Duration(milliseconds: 2200);
    return new Timer(_duration, navigationPage);
  }
  void navigationPage()async {
    // FirebaseUser user = await FirebaseAuth.instance.currentUser();
    // if(user!=null)
    // {
    //   Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //           builder: (context) => navigation_bar()));
    // }
    // else
    // {
    //   Navigator.of(context).pushReplacementNamed('/Home');
    // }
    Navigator.of(context).pushReplacementNamed('/Home');
  }
  @override
  void initState() {
    super.initState();
    startTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF1F1F1),
      body: SafeArea(
        child: AnimatedSplash
          (
          imagePath: "Images/landingPage.png",
          home: splash_screen(),
          duration: 2000,
          type: AnimatedSplashType.StaticDuration,
        ),
      ),
    );
  }
}