import 'package:flutter/material.dart';

import 'fogotPassword.dart';

class notifications extends StatefulWidget {
  notifications({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<notifications> {
  final items = List<String>.generate(10, (i) => "Item $i");
  String name = 'Ali talib';
  String message = 'How are You?';
  String time = '3 hours ago';
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return MaterialApp(
        home: Scaffold(

      backgroundColor: Color(0xffffffff),

      body:
      SingleChildScrollView(
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
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => notifications()));
                          },
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child:  ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: <Widget>[
                            SizedBox(
                              height: height / 50,
                            ),

                            Container(
                              width: width / 1.2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    width: width / 2,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        CircleAvatar(
                                          backgroundImage:
                                          ExactAssetImage('Images/notification.png'),
                                          minRadius: height / 50,
                                          maxRadius: height / 35,
                                        ),
                                        SizedBox(
                                          width: width / 40,
                                        ),
                                        Column(
                                          children: <Widget>[
                                            Text(
                                              '$name',
                                              style: TextStyle(
                                                  color: Color(0xff16001f),
                                                  fontSize: height / 50,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            SizedBox(

                                            ),
                                            Expanded(
                                              child: Text(
                                                '$message',

                                                style: TextStyle(
                                                    color: Color(0xffbdbdbd),
                                                    fontSize: height / 60,

                                                    fontWeight: FontWeight.w500),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    '$time',
                                    style: TextStyle(
                                        color: Color(0xffbdbdbd),
                                        fontSize: height / 50,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
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
