
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:straightup_ares/documents_download.dart';
import 'package:straightup_ares/play_vedio.dart';
import 'package:straightup_ares/vedio_data.dart';

import 'fogotPassword.dart';
import 'model.dart';
import 'notifications.dart';

enum WidgetMarker {
  Beginner,
  Drills,
}
class kids extends StatefulWidget {
  kids({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _WelcomePageState createState() => _WelcomePageState();
}
class _WelcomePageState extends State<kids> {
  WidgetMarker selectedwidgetMarker = WidgetMarker.Beginner;
  List<Need> list = List();
  Future isertData(Users) async {
    Firestore firestore = Firestore.instance;
    firestore.collection("Users").add(Users).then((DocumentReference document) {
    });
  }
  Future Init() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    Firestore firestore = Firestore.instance;
    QuerySnapshot querySnapshot =
    await firestore.collection("Documents").getDocuments();
    List<DocumentSnapshot> documentSnapshot = querySnapshot.documents;
    for (var docs in documentSnapshot) {
      Need need = new Need(
          plan: docs.data["name"],
          checkout: docs.data["title"],
          appointment: docs.data["type"],
          link: docs.data["file"]
      );
      list.add(need);
    }
    setState(() {});
  }
  @override
  void initState() {
    Init();
    // TODO: implement initState
    super.initState();
  }
  final items = List<String>.generate(10, (i) => "Item $i");
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => notifications()));
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height / 50,
                  ),
                  Container(
                    width: width / 1.1,
                    height: height / 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            setState(() {
                              selectedwidgetMarker = WidgetMarker.Beginner;
                            });
                          },
                          child: Container(
                            decoration: new BoxDecoration(
                              color: (selectedwidgetMarker ==
                                      WidgetMarker.Beginner)
                                  ? Color(0xff16001f)
                                  : Colors.transparent,
                              borderRadius: new BorderRadius.only(
                                topLeft: Radius.circular(12),
                                bottomLeft: Radius.circular(12),
                              ),
                              // border: Border.all(color: Colors.grey)
                            ),
                            width: width / 2.4,
                            height: height / 20,
                            child: Center(
                              child: Text(
                                "videos",
                                style: TextStyle(
                                  color: (selectedwidgetMarker ==
                                          WidgetMarker.Beginner)
                                      ? Colors.white
                                      : Color(0xffbdbdbd),
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              selectedwidgetMarker = WidgetMarker.Drills;
                            });
                          },
                          child: Container(
                            width: width / 2.4,
                            height: height / 20,
                            decoration: new BoxDecoration(
                              color:
                                  (selectedwidgetMarker == WidgetMarker.Drills)
                                      ? Color(0xff16001f)
                                      : Colors.transparent,
                              borderRadius: new BorderRadius.only(
                                topRight: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                              ),
                              // border: Border.all(color: Colors.grey)
                            ),
                            child: Center(
                              child: Text(
                                "Documents",
                                style: TextStyle(
                                  color: (selectedwidgetMarker ==
                                          WidgetMarker.Drills)
                                      ? Colors.white
                                      : Color(0xffbdbdbd),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: Container(
                      height: height / 1.5,
                      child: getCustomContainor(),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }

  Widget getCustomContainor() {
    switch (selectedwidgetMarker) {
      case WidgetMarker.Beginner:
        return getBeginnerContainer();
      case WidgetMarker.Drills:
        return getDrillsContainer();
    }
    return getBeginnerContainer();
  }

  Widget getBeginnerContainer() {
    return Container(
      //color: Colors.green,
      height: MediaQuery.of(context).size.height / 1,
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 0.0),
                height: MediaQuery.of(context).size.height / 1.2,

                child: StreamBuilder<QuerySnapshot>(
                  stream: Firestore.instance.collection("Vedio").snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) return new CircularProgressIndicator();
                    return new ListView(children: getExpenseItems(snapshot));
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget getDrillsContainer() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      //color: Colors.green,
      height: MediaQuery.of(context).size.height / 1,
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, int position) {
          return Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width / 1.4,
                      child: Row(
                        children: <Widget>[
                          Image.asset(
                            'Images/brain.png',
                            scale: 2,
                            color: Color(0xff16001f),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 30,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                '${list[position].plan}',
                                style: TextStyle(
                                    color: Color(0xffbdbdbd),
                                    fontSize:
                                        MediaQuery.of(context).size.height / 50,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(),
                              Text(
                                '${list[position].checkout}',
                                style: TextStyle(
                                    color: Color(0xff16001f),
                                    fontSize:
                                        MediaQuery.of(context).size.height / 50,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                '${list[position].appointment}',
                                style: TextStyle(
                                    color: Color(0xffbdbdbd),
                                    fontSize:
                                        MediaQuery.of(context).size.height / 50,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          SizedBox(width: width/6,),
                        ],
                      ),
                    ),
                    Container(
                      width: width/15,
                      padding: const EdgeInsets.all(5.0),
                      alignment: Alignment.center,
                      // color: Colors.blue,
                      child: GestureDetector(
                          onTap: () async
                          {
                            return showDialog(
                              context: context,
                              builder: (context) {
                                return MyDialog(
                                  width: width,
                                  height: height,
                                  link: list[position].link,
                                  title: list[position].checkout,
                                );
                              },
                            );
                          },
                          child: Icon(Icons.file_download,
                            color: Color(0xff16001f),
                            size: height / 30,)
                      ),
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
    );
  }
  getExpenseItems(AsyncSnapshot<QuerySnapshot> snapshot) {
    return snapshot.data.documents
        .map((doc) => new ListTile(
      title: InkWell(
        onTap: ()
        {
          final videodata = Data(
            file: doc["file"].toString(),
            title: doc["title"].toString(),
            type: doc["type"].toString(),
            descrption: doc["descrption"].toString(),
          );
          Navigator.push(context,
              MaterialPageRoute(
                  builder: (context) => new video_detail(
                    data: videodata,
                  )
              ));
        },
        child: Container(
          child: Card(
              child: Column(
                children: <Widget>[
                  Center(
                      child: Image(
                        image: AssetImage("Images/tutorial.png"),
                      )
                  ),
                  SizedBox(height: 12,),
                  Text(doc["title"].toString()),
                  SizedBox(height: 12,),
                ],
              )
          ),
        ),
      ),
    ),

    )
        .toList();
  }
}