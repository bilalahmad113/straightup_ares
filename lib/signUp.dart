
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:straightup_ares/signIn.dart';
import 'fogotPassword.dart';
import 'navigation_bar.dart';

class SignUp extends StatefulWidget {
  SignUp({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<SignUp> {
  final _auth=FirebaseAuth.instance;

  var _name = TextEditingController();
  var _email= TextEditingController();
  var _pasword = TextEditingController();
  var _phoneno = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();
  String name,email,password,ph;
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
              child: Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: height / 40,
                    ),
                    Container(
                      child:
                      Image.asset('Images/landingPage.png',
                        height: height/8,),

                    ),
                    SizedBox(
                      height: height / 50,
                    ),
                    Text(
                      'Create a Account',
                      style: TextStyle(
                          color: Color(0xff16001f),
                          fontSize: height / 30,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: height / 20,
                    ),
                    Form(
                      child: Container(
                        width: width / 1.2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Username',
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
                                  child: Form(
                                    key: _formKey,
                                    child: TextFormField(
                                      style: TextStyle(color: Colors.white70),
                                      cursorColor: Color(0xffffffff),
                                      keyboardType: TextInputType.text,
                                      decoration: new InputDecoration(
                                        contentPadding: EdgeInsets.fromLTRB(30.0, 10.0, 20.0, 10.0),
                                        border: new OutlineInputBorder(
                                          borderRadius: const BorderRadius.all(
                                            const Radius.circular(26.0),
                                          ),
                                        ),
                                        hintText: 'ali talib',
                                        hintStyle: TextStyle(
                                            color: Color(0xffffffff),
                                            fontWeight: FontWeight.w400
                                        ),
                                        filled: true,
                                        fillColor: Color(0xffbdbdbd),
                                      ),
                                      controller: _name,
                                      onChanged: (value) {
                                        name = value;
                                      },
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Please enter some text';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
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
                                  child: Form(
                                    key: _formKey1,
                                    child: TextFormField(
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
                                      ),
                                      controller: _email,
                                      onChanged: (value) {
                                        email = value;
                                      },
                                      validator: validateEmail,

                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height / 60,
                            ),
                            Text(
                              'Password',
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
                                  child: Form(
                                    key: _formKey2,
                                    child: TextFormField(
                                      obscureText: true,
                                      style: TextStyle(color: Colors.white70),
                                      cursorColor: Color(0xffffffff),
                                      keyboardType: TextInputType.visiblePassword,
                                      decoration: new InputDecoration(
                                        contentPadding: EdgeInsets.fromLTRB(30.0, 10.0, 20.0, 10.0),
                                        border: new OutlineInputBorder(
                                          borderRadius: const BorderRadius.all(
                                            const Radius.circular(26.0),
                                          ),
                                        ),
                                        hintText: '.....',
                                        hintStyle: TextStyle(
                                            color: Color(0xffffffff),
                                            fontWeight: FontWeight.bold
                                        ),
                                        filled: true,
                                        fillColor: Color(0xffbdbdbd),
                                      ),
                                      controller: _pasword,
                                      onChanged: (value) {
                                        password = value;
                                      },
                                      validator: validatePass,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height / 60,
                            ),
                            Text(
                              'phone no',
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
                                  child: Form(
                                    key: _formKey3,
                                    child: TextFormField(
                                      style: TextStyle(color: Colors.white70),
                                      cursorColor: Color(0xffffffff),
                                      keyboardType: TextInputType.phone,
                                      decoration: new InputDecoration(
                                        contentPadding: EdgeInsets.fromLTRB(30.0, 10.0, 20.0, 10.0),
                                        border: new OutlineInputBorder(
                                          borderRadius: const BorderRadius.all(
                                            const Radius.circular(26.0),
                                          ),
                                        ),
                                        hintText: '+923345304474',
                                        hintStyle: TextStyle(
                                            color: Color(0xffffffff),
                                            fontWeight: FontWeight.bold
                                        ),
                                        filled: true,
                                        fillColor: Color(0xffbdbdbd),
                                      ),
                                      controller: _phoneno,
                                      onChanged: (value) {
                                        ph = value;
                                      },
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Please enter some text';
                                        }
                                        return null;
                                      },
                                    ),
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
                      height: height / 20,
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
                            "SignUp",
                            style: TextStyle(
                                fontSize: width / 25,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                          onPressed: () async{
                            final form = _formKey2.currentState;
                            if (form.validate()){
                              if (_formKey.currentState.validate()) {
                                if (_formKey1.currentState.validate()) {
                                                                if (_formKey2.currentState.validate()) {
                                  if (_formKey3.currentState.validate()) {
                                    try {
                                      final newuser = await _auth
                                          .createUserWithEmailAndPassword(
                                          email: email, password: password);
                                      Firestore firestore = Firestore.instance;
                                      firestore.collection("Users").document(email).setData({
                                        "email": email,
                                        "name": name,
                                        "ph": ph,
                                        "status": "0",

                                      }).whenComplete(() => print("File Uploaded"));
                                      Navigator.push(context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SignIn()));
                                    } catch (e) {
                                      print(e);
                                    }
                                  }
                                  }
                                }
                              }
                            }
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height / 40,
                    ),
                    SizedBox(
                      height: height / 70,
                    ),
                    Container(
                      //color: Colors.white70,
                      width: width / 1.2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Already have an account?  ',
                            style: TextStyle(
                                color: Color(0xff16001f),
                                fontSize: height / 60,
                                fontWeight: FontWeight.w700),
                          ),
                          GestureDetector(
                            onTap: ()async {
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
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignIn()));
                                }
                            },
                            child: Text(
                              'Login here',
                              style: TextStyle(
                                  color: Color(0xff16001f),
                                  fontSize: height / 60,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height / 50,
                    ),
                    Center(
                      child: Text('OR', style: TextStyle(
                        fontSize: height/50,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff16001f),
                      ),),
                    ),
                    SizedBox(height: height/70,),
                    Center(
                      child: Container(
                        //color: Colors.red,
                        width: width/2.3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            GestureDetector(onTap: (){
                              print("Facebook Login");
                              FacebookLogin fblogin = new FacebookLogin();
                              fblogin.logIn(['email']).then(
                                      (result) async {
                                    switch (result.status) {
                                      case FacebookLoginStatus.loggedIn:
                                        {
                                          FirebaseAuth _firebaseAuth =
                                              FirebaseAuth.instance;
                                          final AuthCredential credential =
                                          FacebookAuthProvider.getCredential(
                                              accessToken: result.accessToken.token,
                                          );
                                          AuthResult authResult = await _firebaseAuth
                                              .signInWithCredential(credential);
                                          FirebaseUser userDetail = authResult.user;
                                          String email = userDetail.email;
                                          String name = userDetail.displayName;
                                          print(email);
                                          print(name);
                                          Firestore firestore = Firestore.instance;
                                          try
                                          {
                                            var reference = await firestore.collection("Users").document(email);
                                            await reference.get().then((value) async
                                            {
                                              print(value.data);
                                              if(value.exists)
                                              {
                                                print("Data Exist");
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            navigation_bar()));
                                              }
                                              else
                                              {
                                                print("Data Not Exist");
                                                Firestore firestore = Firestore.instance;
                                                firestore.collection("Users").document(email).setData({
                                                  "email": email,
                                                  "name": name,
                                                  "ph": "",
                                                  "status": "0",

                                                }).whenComplete(() => print("File Uploaded"));
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            navigation_bar()));
                                              }
                                            });
                                          }
                                          catch(e)
                                          {
                                            print("returning false catch");
                                          }

                                          break;
                                        }
                                      case FacebookLoginStatus.cancelledByUser:
                                        // TODO: Handle this case.
                                        break;
                                      case FacebookLoginStatus.error:
                                        // TODO: Handle this case.
                                        break;
                                    }
                                  }).catchError((e) {
                                print(e);
                              });
                              },
                              child: Image.asset(
                                'Images/facebook.png',
                                scale: 2,
                              ),
                            ),
                            GestureDetector(onTap: ()async{
                              FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
                              GoogleSignIn _googleSignIn = new GoogleSignIn(scopes: [
                                'https://www.googleapis.com/auth/drive',
                              ],);
                              final GoogleSignInAccount googleUser =
                                  await _googleSignIn.signIn();
                              final GoogleSignInAuthentication googleAuth =
                                  await googleUser.authentication;
                              final AuthCredential credential =
                              GoogleAuthProvider.getCredential(
                                  idToken: googleAuth.idToken,
                                  accessToken: googleAuth.accessToken);
                              AuthResult authResult = await _firebaseAuth
                                  .signInWithCredential(credential);
                              FirebaseUser userDetail = authResult.user;
                              String email = userDetail.email;
                              String name = userDetail.displayName;
                              print("Google Login");
                              print(email);
                              print(name);
                              Firestore firestore = Firestore.instance;
                              try
                              {
                                var reference = await firestore.collection("Users").document(email);
                                await reference.get().then((value) async
                                {
                                  print(value.data);
                                  if(value.exists)
                                  {
                                    print("Data Exist");
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                navigation_bar()));
                                  }
                                  else
                                  {
                                    print("Data Not Exist");
                                    Firestore firestore = Firestore.instance;
                                    firestore.collection("Users").document(email).setData({
                                      "email": email,
                                      "name": name,
                                      "ph": "",
                                      "status": "0",

                                    }).whenComplete(() => print("File Uploaded"));
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                navigation_bar()));
                                  }
                                });
                              }
                              catch(e)
                              {
                                print("returning false catch");
                              }
                              },
                              child: Image.asset(
                                'Images/google.png',
                                scale: 2,
                                //color: Colors.black45,
                              ),
                            )
                          ],),
                      ),
                    ),
                    Container(
                      width: width/1.1,
                      child: Center(
                        child: Column(children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                'By creating an account, You are agree to our ',
                                style: TextStyle(
                                  color: Color(0xffcecccf),
                                  fontSize: height / 70,
//                           fontWeight: FontWeight.w700),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignIn()));
                                },
                                child: Text(
                                  'Terms of Services ',
                                  style: TextStyle(
                                      color: Color(0xff16001f),
                                      fontSize: height / 70,
                                      fontWeight: FontWeight.w500

                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                'and ',
                                style: TextStyle(
                                  color: Color(0xffcecccf),
                                  fontSize: height / 70,
//                           fontWeight: FontWeight.w700),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignIn()));
                                },
                                child: Text(
                                  'Privacy Policy',
                                  style: TextStyle(
                                      color: Color(0xff16001f),
                                      fontSize: height / 70,
                                      fontWeight: FontWeight.w500

                                  ),
                                ),
                              )
                            ],
                          ),
                        ],),
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
String validatePass(String value) {
  if (value.length < 5)
    return 'Password must be more than 5 charater';
  else
    return null;
}
String validateEmail(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value))
    return 'Enter Valid Email';
  else
    return null;
}
