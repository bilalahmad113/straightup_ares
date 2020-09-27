

import 'package:flutter/material.dart';
import 'package:straightup_ares/signIn.dart';
import 'package:straightup_ares/signUp.dart';

class landingPage extends StatefulWidget {
  landingPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<landingPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xffffffff),
        body: Container(
//          decoration: BoxDecoration(
//              gradient: LinearGradient(
//                begin: Alignment.topCenter,
//                end: Alignment.bottomCenter,
//                colors: [Color(0xff413564), Color(0xFF5F3567)],
//              )),
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: height / 10,
                ),
                Container(
//              decoration: BoxDecoration(
//                  color: Colors.transparent
//              ),
                  child:
                  Image.asset('Images/landingPage.png',
                    height: height/5,),

                ),
                SizedBox(
                  height: height / 30,
                ),
                Text(
                  'ARES BJJ',
                  style: TextStyle(
                      color: Color(0xff16001f),
                      //letterSpacing: 2,

                      fontSize: height / 30,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: height / 80,
                ),
                Text(
                  'Welcome to Ares BJJ Academy',
                  style: TextStyle(
                      color: Color(0xffcecccf),
                      //letterSpacing: 2,

                      fontSize: height / 50,
                      fontWeight: FontWeight.w400
                  ),
                ),

                SizedBox(
                  height: height / 80,
                ),


                SizedBox(
                  height: height / 20,
                ),
                ButtonTheme(
                  minWidth: width/1.4,
                  height: height/17,
                  child: FlatButton(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        side: BorderSide(  color: Color(0xff16001f),
                        )
                    ),
                    color: Color(0xff16001f),
                    textColor: Color(0xffffffff),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          fontSize: width / 25,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUp()));
                    },
                  ),
                ),
                SizedBox(
                  height: height / 30,
                ),
                ButtonTheme(
                  minWidth: width/1.4,
                  height: height/17,
                  child: FlatButton(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        side: BorderSide(  color: Color(0xff16001f),
                        )
                    ),
                    color: Color(0xff16001f),
                    textColor: Color(0xffffffff),
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                          fontSize: width / 25,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignIn()));
                    },
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
