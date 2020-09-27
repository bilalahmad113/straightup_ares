import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:straightup_ares/signUp.dart';

import 'fogotPassword.dart';
import 'navigation_bar.dart';

class welcome1 extends StatefulWidget {
  welcome1({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<welcome1> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return MaterialApp(
        home: Scaffold(
          backgroundColor: Color(0xffffffff),
          body: SingleChildScrollView(
            child: Container(
              height: height / 1.1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: height / 10,
                  ),
                  Center(
                    child: Container(
                      child: Image.asset(
                        'Images/updateProfile.jpg',
                        height: height / 4,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height / 20,
                  ),
                  Text(
                    'Ready To Learn',
                    style: TextStyle(
                        color: Color(0xff16001f),
                        fontSize: height / 24,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: height/80,),
                  Container(
                    width: width/1.2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        Text(
                          'To connected with us login with ',
                          style: TextStyle(
                              color:  Color(0xffbdbdbd),
                              fontSize: height / 45,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(),
                        Text(
                          '  your Personal info. ',
                          style: TextStyle(
                              color:  Color(0xffbdbdbd),
                              fontSize: height / 45,
                              fontWeight: FontWeight.w400),
                        ),
                      ],),
                  ),
                  SizedBox(height: height/30,),
                  Center(
                    child: ButtonTheme(
                      minWidth: width/1.5,
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
                          "Next",
                          style: TextStyle(
                              fontSize: width / 25,
                              fontWeight: FontWeight.w400
                          ),
                        ),
                        onPressed: () async{
                          FirebaseUser user = await FirebaseAuth.instance.currentUser();
                          if(user!=null)
                          {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => navigation_bar()));
                          }
                          else
                          {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => SignUp()));
                          }
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) => SignUp()));
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: height/30,),
                  Center(
                    child: ButtonTheme(
                      minWidth: width/1.5,
                      height: height/17,
                      child: FlatButton(
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            side: BorderSide(   color:  Color(0xffbdbdbd),
                            )
                        ),
                        color:  Color(0xffbdbdbd),
                        textColor: Color(0xffffffff),
                        child: Text(
                          "Skip for Now",
                          style: TextStyle(
                              fontSize: width / 25,
                              fontWeight: FontWeight.w400
                          ),
                        ),
                        onPressed: () async{
                          FirebaseUser user = await FirebaseAuth.instance.currentUser();
                          if(user!=null)
                          {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => navigation_bar()));
                          }
                          else
                          {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => SignUp()));
                          }
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) => SignUp()));
                        },
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ));
  }
}
