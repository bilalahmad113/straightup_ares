import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:straightup_ares/signIn.dart';

import 'fogotPassword.dart';

class forgotPassword extends StatefulWidget {
  forgotPassword({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<forgotPassword> {
  TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String email;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return MaterialApp(
        home: Scaffold(
          backgroundColor: Color(0xffffffff),
          appBar: AppBar(
            backgroundColor: Color(0xffffffff),
            title: new IconButton(
              icon: new Icon(Icons.arrow_back, color: Color(0xff16001f)),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              height: height / 1.1,
//              decoration: BoxDecoration(
//                  gradient: LinearGradient(
//                    begin: Alignment.topCenter,
//                    end: Alignment.bottomCenter,
//                    colors: [Color(0xff413564), Color(0xFF5F3567)],
//                  )),
              child: Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: height / 40,
                    ),
                    Container(
//              decoration: BoxDecoration(
//                  color: Colors.transparent
//              ),
                      child:
                      Image.asset('Images/landingPage.png',
                        height: height/8,),

                    ),
                    SizedBox(
                      height: height / 50,
                    ),
                    Text(
                      'Forgot Password',
                      style: TextStyle(
                          color: Color(0xff16001f),
                          fontSize: height / 30,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: height / 20,
                    ),
                    Form(
                      key: _formKey,
                      child: Container(
                        width: width / 1.2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Email',
                              style: TextStyle(
                                  color: Color(0xffcecccf),
                                  fontSize: height / 60,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: height / 90,
                            ),
                            Container(
                              width: width / 1.2,
                              height: height / 15,
                              child: Theme(
                                data: new ThemeData(
                                  primaryColor: Color(0xffbdbdbd),
                                  //primaryColorDark: Colors.grey,
                                ),
                                child: Center(
                                  child: TextFormField(
                                    controller: emailController,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please enter valid Email';
                                      }
                                      return null;
                                    },
                                    style: TextStyle(color: Colors.white70),
                                    cursorColor: Color(0xffffffff),
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: new InputDecoration(
                                      contentPadding: EdgeInsets.fromLTRB(30.0, 10.0, 20.0, 10.0),
                                      border: new OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                          const Radius.circular(26.0),
                                        ),
                                      ),
                                      hintText: 'helo@gmail.com',
                                      hintStyle: TextStyle(
                                          color: Color(0xffffffff),
                                          fontWeight: FontWeight.w400
                                      ),
                                      filled: true,
                                      fillColor: Color(0xffbdbdbd),
                                      // border: InputBorder.none

                                      //suffixStyle: const TextStyle(color: Colors.green)
                                    ),

                                    // The validator receives the text that the user has entered.
                                    onChanged: (value)
                                    {
                                      email = value;
                                    },
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height / 60,
                            ),


                          ],
                        ),
                      ),
                    ),

                    SizedBox(
                      height: height / 40,
                    ),
                    Center(
                      child: ButtonTheme(
                        minWidth: width/2,
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
                            "Send",
                            style: TextStyle(
                                fontSize: width / 25,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              await _firebaseAuth
                                  .sendPasswordResetEmail(email: email)
                                  .whenComplete(() {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20))),
                                          content: Container(
                                            height: height / 5.5,
                                            child: Column(
                                              children: <Widget>[
                                                Text(
                                                    "We sent email to : "
                                                ),
                                                SizedBox(
                                                  height: height / 60,
                                                ),
                                                Text(
                                                  "$email",
                                                  style: TextStyle(
                                                    color: Colors.blue,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: height / 60,
                                                ),
                                                Row(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    ButtonTheme(
                                                      minWidth: width / 4,
                                                      height: height / 18,
                                                      child: FlatButton(
                                                        shape:
                                                        new RoundedRectangleBorder(
                                                          borderRadius:
                                                          new BorderRadius
                                                              .circular(20.0),
                                                        ),
                                                        color: Color(0xff9847b7),
                                                        textColor: Colors.white,
                                                        child: Text(
                                                          "Ok",
                                                          style: TextStyle(
                                                              fontSize: height / 40,
                                                              fontWeight:
                                                              FontWeight.w500
                                                            //letterSpacing: 1
                                                          ),
                                                        ),
                                                        onPressed: () {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (context) =>
                                                                      SignIn()));
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ));
                                    });
                              });
                            }
                          }
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
