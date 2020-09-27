import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:straightup_ares/signIn.dart';
import 'package:straightup_ares/updateProfile.dart';

import 'fogotPassword.dart';
import 'notifications.dart';

class editProfile extends StatefulWidget {
  editProfile({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<editProfile> {
  String phoneNumber = '03400888104';
  String email = 'alitalib167@gmail.com';
  String name = 'Sohail Ahmad';
  Future Init() async
  {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    Firestore firestore = Firestore.instance;
    QuerySnapshot querySnapshot = await firestore.collection("Users").getDocuments();
    List<DocumentSnapshot> documentSnapshot = querySnapshot.documents;
    for (var document in documentSnapshot)
    {
      if(document["email"] == user.email)
      {
        name = document["name"];
        email = document["email"];
        phoneNumber = document["ph"];
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
                            onPressed: () => SystemNavigator.pop()
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
                            }
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height / 40,
                    ),
                    //image
                    Container(
                      child: Image.asset(
                        'Images/updateProfile.jpg',
                        height: height / 8,
                      ),
                    ),
                    SizedBox(
                      height: height / 50,
                    ),
                    Text(
                      '$name',
                      style: TextStyle(
                          color: Color(0xff16001f),
                          fontSize: height / 30,
                          fontWeight: FontWeight.bold),
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    Container(
                      color: Colors.white,
                      width: width/1.1,
                      // height: height/5,
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Personal Info', style: TextStyle(
                              color: Color(0xff16001f),
                              fontSize: height/50,
                              fontWeight: FontWeight.w500
                          ),),
                          SizedBox(height: height/80,),
                          Container(
                            width: width/2,
                            child: Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Icon(
                                  Icons.email,
                                  color:  Color(0xffbdbdbd),
                                  size: height/30,
                                ),
                                SizedBox(width: width/50,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('Email', style: TextStyle(
                                        color:  Color(0xffbdbdbd),
                                        fontSize: height/60,
                                        fontWeight: FontWeight.w500
                                    ),),
                                    SizedBox(
                                      height: height/90,
                                    ),
                                    Text('$email', style: TextStyle(
                                        color:  Color(0xffbdbdbd),
                                        fontSize: height/60,
                                        fontWeight: FontWeight.w500
                                    ),),

                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height/80,
                          ),
                          Divider(color: Colors.grey,),




                          SizedBox(height: height/80,),
                          Container(
                            width: width/2,
                            child: Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Icon(
                                  Icons.phone,
                                  color:  Color(0xffbdbdbd),
                                  size: height/30,
                                ),
                                SizedBox(width: width/50,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('Phone No', style: TextStyle(
                                        color:  Color(0xffbdbdbd),
                                        fontSize: height/60,
                                        fontWeight: FontWeight.w500
                                    ),),
                                    SizedBox(
                                      height: height/90,
                                    ),
                                    Text('$phoneNumber', style: TextStyle(
                                        color:  Color(0xffbdbdbd),
                                        fontSize: height/60,
                                        fontWeight: FontWeight.w500
                                    ),),

                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height/80,
                          ),

                          Divider(color: Colors.grey,),
                          SizedBox(height: height/80,),
                          Container(
                            width: width/2,
                            child: Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Icon(
                                  Icons.arrow_back,
                                  color:  Color(0xffbdbdbd),
                                  size: height/30,
                                ),
                                SizedBox(width: width/50,),
                                GestureDetector(
                                  onTap: () async
                                  {
                                    await FirebaseAuth.instance.signOut();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SignIn()));
                                  },
                                  child: Text('Logout', style: TextStyle(
                                      color:  Color(0xffbdbdbd),
                                      fontSize: height/60,
                                      fontWeight: FontWeight.w500
                                  ),),
                                ),
                                SizedBox(
                                  height: height/90,
                                ),

                              ],
                            ),
                          ),
                          SizedBox(
                            height: height/80,
                          ),
                          Divider(color: Colors.grey,),
                        ],
                      ),
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
                            "Edit Profile",
                            style: TextStyle(
                                fontSize: width / 25,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => updateProfile()));
                          },
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
