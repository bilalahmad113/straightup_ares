
import 'package:flutter/material.dart';

import 'fogotPassword.dart';

class home1 extends StatefulWidget {
  home1({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<home1> {
  final items = List<String>.generate(10, (i) => "Item $i");
  String date = '3/7/2020';
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
//              decoration: BoxDecoration(
//                  gradient: LinearGradient(
//                    begin: Alignment.topCenter,
//                    end: Alignment.bottomCenter,
//                    colors: [Color(0xff413564), Color(0xFF5F3567)],
//                  )),
              child: Center(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: height / 40,
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
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: <Widget>[
                                Container(
                                  width: width / 1.05,
                                  child: Card(
                                    child: Column(
                                      //  mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Center(
                                          child: Image.asset(
                                            'Images/tutorial.png',
                                            scale: 2.5,
                                          ),
                                        ),
                                        SizedBox(
                                          height: height/70,
                                        ),
                                        Text(
                                          'Tutorial No.3',
                                          style: TextStyle(
                                              color: Color(0xff16001f),
                                              fontSize: height / 60,
                                              fontWeight: FontWeight.bold),
                                        ),
//                                        SizedBox(
//                                          height: height/90,
//                                        ),
                                        Text(
                                          '$date',
                                          style: TextStyle(
                                              color: Color(0xffbdbdbd),
                                              fontSize: height / 60,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Divider(
                                  color: Colors.grey,
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
