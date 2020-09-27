import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'fogotPassword.dart';
import 'notifications.dart';

class updateProfile extends StatefulWidget {
//  updateProfile({Key key, this.title}) : super(key: key);

//  final String title;

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<updateProfile> {
  String email = 'alitalib167@gmail.com';
  FirebaseUser user;
  var _Password = TextEditingController();
  var _cnfrmpasword = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _formKey1 = GlobalKey<FormState>();
  String password;
  String cnfrmpassword;

  Future Init() async
  {
    user = await FirebaseAuth.instance.currentUser();
    Firestore firestore = Firestore.instance;
    QuerySnapshot querySnapshot = await firestore.collection("Users").getDocuments();
    List<DocumentSnapshot> documentSnapshot = querySnapshot.documents;
    for (var document in documentSnapshot)
    {
      if(document["email"] == user.email)
      {
        email = document["email"];
        setState(() {});
      }
    }
  }
  @override
  void initState() {
    Init();
    // TODO: implement initState
    super.initState();
  }

  void showToast() {
    Fluttertoast.showToast(
        msg: 'update successfully',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white
    );
  }
  void showToast1() {
    Fluttertoast.showToast(
        msg: 'password miss match',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Color(0xffffffff),
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: height / 35,
                ),
                Container(
                  decoration: new BoxDecoration(
                      boxShadow: [
                        new BoxShadow(
                          color: Colors.grey,
                          blurRadius: 10.0,
                        ),
                      ],
                      color: Color(
                          0xffffffff), //new Color.fromRGBO(255, 0, 0, 0.0),
                      borderRadius: new BorderRadius.only(
                          bottomLeft: const Radius.circular(40.0),
                          bottomRight: const Radius.circular(40.0))),
                  height: height / 8,
                  width: width / 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      IconButton(
                        icon: new Icon(Icons.arrow_back,
                            color: Color(0xff16001f)),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      Image.asset(
                        'Images/appbar.png',
                        height: height / 20,
                      ),
                      IconButton(
                        icon: new Icon(Icons.notifications,
                            color: Color(0xff16001f)),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => notifications()));
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height / 40,
                ),
                Container(
                  child: Image.asset(
                    'Images/updateProfile.jpg',
                    height: height / 8,
                  ),
                ),


                SizedBox(
                  height: height / 50,
                ),
                Divider(
                  color: Colors.grey,
                ),
                Container(
                  color: Colors.white,
                  width: width/1.1,
                  child: Column(
                    children: [
    Text('$email', style: TextStyle(
                          color: Color(0xff16001f),
                          fontSize: height / 30,
                          fontWeight: FontWeight.bold


                      ),),
                      SizedBox(height: height/80,),

                    ],
                  ),

                ),
                SizedBox(
                  height: height / 50,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Password', textAlign: TextAlign.right, style: TextStyle(
                      color: Color(0xff16001f),
                      fontSize: 15.0,

                    ),),
                    SizedBox(
                      height: height/90,
                    ),
                    Center(
                      child: Container(
                          alignment: Alignment.center,
                          width: width/1.2,
                          height: height/15,
                          child: Form(
                              key: _formKey1,
                              child: TextFormField(
                                textAlign: TextAlign.left,
                                validator: validatePass,
                                obscureText: true,
                                decoration: new InputDecoration(
                                    border: new OutlineInputBorder(
                                        borderSide: new BorderSide(color: Colors.black)
                                    ),
                                    filled: true,
                                    hintStyle: new TextStyle(color: Color(0XFFCECCCF)),
                                    hintText: "Password",
                                    contentPadding: EdgeInsets.all(10.0),
                                    labelStyle: TextStyle(
                                        color: Colors.grey, fontSize: 18, fontWeight: FontWeight.w500),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.black, width: 1)),
                                    fillColor: Colors.white),
                                    controller: _Password,
                                    onChanged: (value) {
                                    password = value;
                                    },
                              )
                          )
                      ),
                    ),
                    SizedBox(
                      height: height / 50,
                    ),
//                    Divider(
//                      color: Colors.grey,
//                    ),
                    Text('Confirm Password', textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Color(0xff16001f),
                        fontSize: 15.0,
                      ),),
                    SizedBox(
                      height: height/90,
                    ),
                    Center(
                      child: Container(
                          alignment: Alignment.center,
                          width: width/1.2,
                          height: height/15,
                          child: Form(
                              key: _formKey,
                              child: TextFormField(
                                textAlign: TextAlign.left,
                                validator: validatePass,
                                obscureText: true,
                                decoration: new InputDecoration(
                                    border: new OutlineInputBorder(
                                        borderSide: new BorderSide(color: Colors.black)
                                    ),
                                    filled: true,
                                    hintStyle: new TextStyle(color: Color(0XFFCECCCF)),
                                    hintText: "Confirm Password",
                                    contentPadding: EdgeInsets.all(10.0),
                                    labelStyle: TextStyle(
                                        color: Colors.grey, fontSize: 18, fontWeight: FontWeight.w500),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.black, width: 1)),
                                    fillColor: Colors.white),
                                controller: _cnfrmpasword,
                                onChanged: (value) {
                                  cnfrmpassword = value;
                                },
                              )
                          )
                      ),
                    )
                  ],
                ),
              SizedBox(
                height: height/20,
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
                        "Update Profile",
                        style: TextStyle(
                            fontSize: width / 25,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                      onPressed: () async {
                        final form = _formKey1.currentState;
                        if (password == cnfrmpassword) {
                          if (form.validate()){
                           user.updatePassword(cnfrmpassword)
                               .whenComplete(() => cnfrmpassword);
                           showToast();
                          }} else {
                          showToast1();
                        }
                      },
//                       Navigator.push(context,
//                          MaterialPageRoute(builder: (context) => updateProfile()));
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
String validatePass(String value) {
  if (value.length < 5)
    return 'Password must be more than 5 charater';
  else
    return null;
}
