import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:straightup_ares/play_vedio.dart';
import 'package:straightup_ares/vedio_data.dart';
import 'fogotPassword.dart';
import 'notifications.dart';

enum WidgetMarker { Beginner, Drills, Kids_space }

class home extends StatefulWidget {
  home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<home> {
  WidgetMarker selectedwidgetMarker = WidgetMarker.Beginner;
  final items = List<String>.generate(10, (i) => "Item $i");
  List<Data> beginnerlist = List();
  List<Data> drilllist = List();
  List<Data> kidslist = List();
  Init() async {
    Firestore firestore = Firestore.instance;
    QuerySnapshot querySnapshot =
    await firestore.collection("Vedio").getDocuments();
    List<DocumentSnapshot> vediodocuments = querySnapshot.documents;
    for (var each in vediodocuments) {
      String vedio_type = each.data["type"];
      switch (vedio_type) {
        case 'Beginner Carriculum':
          {
            Data beginner = new Data(
              type: vedio_type,
              title: each.data["title"],
              file: each.data["file"],
              descrption: each.data["descrption"],
            );
            beginnerlist.add(beginner);
            setState(() {

            });
            break;
          }
        case 'Kids Space':
          {
            Data beginner = new Data(
              type: vedio_type,
              title: each.data["title"],
              file: each.data["file"],
              descrption: each.data["descrption"],
            );
            kidslist.add(beginner);
            setState(() {

            });
            break;
          }
        case 'Drills':
          {
            Data beginner = new Data(
              type: vedio_type,
              title: each.data["title"],
              file: each.data["file"],
              descrption: each.data["descrption"],
            );
            drilllist.add(beginner);
            setState(() {

            });
            break;
          }
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
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;
    return WillPopScope(
      onWillPop: ()async{
        return true;
      },
        child : Scaffold(
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
                                0xffffffff),
                            //new Color.fromRGBO(255, 0, 0, 0.0),
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
                                width: width / 3.5,
                                height: height / 20,
                                child: Center(
                                  child: Text(
                                    "Beginners",
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
                                width: width / 3.5,
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
                                    "Drills",
                                    style: TextStyle(
                                      color: (selectedwidgetMarker ==
                                          WidgetMarker.Drills)
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
                                  selectedwidgetMarker =
                                      WidgetMarker.Kids_space;
                                });
                              },
                              child: Container(
                                width: width / 3.5,
                                height: height / 20,
                                decoration: new BoxDecoration(
                                  color: (selectedwidgetMarker ==
                                      WidgetMarker.Kids_space)
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
                                    "Kids_space",
                                    style: TextStyle(
                                      color: (selectedwidgetMarker ==
                                          WidgetMarker.Kids_space)
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
      case WidgetMarker.Kids_space:
        return getKids_spaceContainer();
    }
    return getBeginnerContainer();
  }

  Widget getBeginnerContainer() {
    return Container(
      //color: Colors.green,
      height: MediaQuery
          .of(context)
          .size
          .height / 1,
      child: ListView.builder(
        itemCount: beginnerlist.length,
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width / 1.05,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                        new video_detail(
                          data: beginnerlist[index],
                        ),
                      ),
                    );
                  },
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
                          height: MediaQuery
                              .of(context)
                              .size
                              .height / 70,
                        ),
                        Text(
                          beginnerlist[index].title,
                          style: TextStyle(
                              color: Color(0xff16001f),
                              fontSize: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 60,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget getDrillsContainer() {
    return Container(
      //color: Colors.green,
      height: MediaQuery
          .of(context)
          .size
          .height / 1,
      child: ListView.builder(
        itemCount: drilllist.length,
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width / 1.05,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                        new video_detail(
                          data: drilllist[index],
                        ),
                      ),
                    );
                  },
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
                          height: MediaQuery
                              .of(context)
                              .size
                              .height / 70,
                        ),
                        Text(
                          drilllist[index].title,
                          style: TextStyle(
                              color: Color(0xff16001f),
                              fontSize: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 60,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
  Widget getKids_spaceContainer() {
    return Container(
      //color: Colors.green,
      height: MediaQuery
          .of(context)
          .size
          .height / 1,
      child: ListView.builder(
        itemCount: kidslist.length,
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width / 1.05,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                        new video_detail(
                          data: kidslist[index],
                        ),
                      ),
                    );
                  },
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Center(
                          child: Image.asset(
                            'Images/tutorial.png',
                            scale: 2.5,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height / 70,
                        ),
                        Text(
                          kidslist[index].title,
                          style: TextStyle(
                              color: Color(0xff16001f),
                              fontSize: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 60,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}