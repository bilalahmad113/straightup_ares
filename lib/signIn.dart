
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:straightup_ares/signUp.dart';
import 'fogotPassword.dart';
import 'navigation_bar.dart';

class SignIn extends StatefulWidget {
  SignIn({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<SignIn> {
  String status;
  Future Init() async
  {
  }
  @override
  void initState() {
    Init();
    // TODO: implement initState
    super.initState();
  }
  String email;
  String password;
  String CnPassword;
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  bool isLoading = false;
  TextEditingController controllerEmail;
  TextEditingController controllerPass;
  TextEditingController controllerCnPass;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  void showToast() {
    Fluttertoast.showToast(
        msg: 'please for admin confirmation',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white
    );
  } @override
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
                  'Sign In',
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
                            ),
                            child: Center(
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
                                validator: validateEmail,
                                controller: controllerEmail,

                                onChanged: (val) =>
                                    setState(() => email = val),
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
                              child: TextFormField(
                                obscureText: true,
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
                                  hintText: '.....',
                                  hintStyle: TextStyle(
                                      color: Color(0xffffffff),
                                      fontWeight: FontWeight.bold
                                  ),
                                  filled: true,
                                  fillColor: Color(0xffbdbdbd),
                                  // border: InputBorder.none

                                  //suffixStyle: const TextStyle(color: Colors.green)
                                ),

                                // The validator receives the text that the user has entered.
                                validator: validatePass,
                                controller: controllerPass,
                                onSaved: (val) =>
                                    setState(() => password = val),
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
                Container(
                  width: width/1.2,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => forgotPassword()));
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                            color: Color(0xffcecccf),
                            fontSize: height / 60,
                            fontWeight: FontWeight.w700),
                      ),
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
                        "Login",
                        style: TextStyle(
                            fontSize: width / 25,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                      onPressed: ()async{
                        Firestore firestore = Firestore.instance;
                        QuerySnapshot querySnapshot = await firestore.collection("Users").getDocuments();
                        List<DocumentSnapshot> documentSnapshot = querySnapshot.documents;
                        for (var document in documentSnapshot)
                        {
                          print(document["email"]);
                          print(document["status"]);
                          print(email);
                          if(document["email"] == email)
                          {
                            print(document["email"]);
                            status = document["status"];
                            print("Sataalskdjalksjd");
                            print(status);
                          }
                        }
                        final form = _formKey.currentState;
                        if (form.validate()) {
                          if (status == '1') {
                            isLoading = true;
                            form.save();
                            FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                email: email, password: password)
                                .then((auth) {
                              isLoading = false;
                              clearControllers();
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) =>
                                      navigation_bar()));
                            }).catchError((e) {
                              isLoading = false;
                              Fluttertoast.showToast(msg: "Sign in fail");
                              this.setState(() {
                                isLoading = false;
                              });
                              print(e);
                            });
                          }else{
                            showToast();

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
                        'Dont have an account?  ',
                        style: TextStyle(
                            color: Color(0xff16001f),
                            fontSize: height / 60,
                            fontWeight: FontWeight.w700),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUp()));
                        },
                        child: Text(
                          'SignUp here',
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

                        GestureDetector(onTap: ()async{
                          print("Facebook Login");
                          FacebookLogin fblogin = new FacebookLogin();
                          fblogin.logIn(['email', 'public_profile']).then(
                                  (result) async
                          {
                          print("Resut Status");
                          print(result.status);
                          switch (result.status) {
                          case FacebookLoginStatus.loggedIn:
                          {
                          FirebaseAuth _firebaseAuth =
                          FirebaseAuth.instance;
                          final AuthCredential credential =
                          FacebookAuthProvider.getCredential(
                          accessToken:
                          result.accessToken.token);
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
                          }
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
                            GoogleSignIn _googleSignIn = new GoogleSignIn();
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
//terms and privacy policy
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
  clearControllers() {
    controllerEmail = new TextEditingController(text: "");
    controllerPass = new TextEditingController(text: "");
    controllerCnPass = new TextEditingController(text: "");
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