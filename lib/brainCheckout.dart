import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:straightup_ares/chat.dart';
import 'package:straightup_ares/documents_download.dart';
import 'model.dart';
class brainCheckout extends StatefulWidget {
  brainCheckout({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _WelcomePageState createState() => _WelcomePageState();
}
class _WelcomePageState extends State<brainCheckout> {
  List<Need> list = List();
  List<String> links = List();
  List<String> names = List();
  Future getData() async {
    Firestore firestore = Firestore.instance;
    CollectionReference collectionReference = firestore.collection("Documents");
    QuerySnapshot documentSnapshot = await collectionReference.getDocuments();
    List<DocumentSnapshot> dataSnapshot = documentSnapshot.documents;
    for (var each in dataSnapshot) {
      String link = each.data["file"];
      String name = each.data["name"];
      links.add(link);
      names.add(name);
    }
  }
  Future isertData(Users) async {
    Firestore firestore = Firestore.instance;
    firestore
        .collection("Users")
        .add(Users)
        .then((DocumentReference document) {});
  }

  final items = List<String>.generate(11, (i) => "Item $i");

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
        link: docs.data["file"],

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
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (context, int position){
                        return Column(
                          children: <Widget>[
                            SizedBox(
                              height: height / 50,
                            ),
                            Center(
                              child: Container(
                                width: MediaQuery.of(context).size.width / 1.2,
                                // width: width / 1,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width / 1.4,
                                      // width: width / 1.1,
                                      // color: Colors.amber,
                                      child: Row(
                                        children: <Widget>[
                                          Image.asset(
                                            'Images/brain.png',
                                            scale: 2,
                                            color: Color(0xff16001f),
                                          ),
                                          SizedBox(
                                            // width: width / 30,
                                            width: MediaQuery.of(context).size.width / 30,
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                '${list[position].plan}',
                                                style: TextStyle(
                                                    color: Color(0xffbdbdbd),
                                                    fontSize: height / 50,
                                                    fontWeight: FontWeight.w500),
                                              ),
                                              SizedBox(),
                                              Text(
                                                '${list[position].checkout}',
                                                style: TextStyle(
                                                    color: Color(0xff16001f),
                                                    fontSize: height / 50,
                                                    fontWeight: FontWeight.w500),
                                              ),
                                              Text(
                                                '${list[position].appointment}',
                                                style: TextStyle(
                                                    color: Color(0xffbdbdbd),
                                                    fontSize: height / 60,
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
                                            print('Downloading');
                                            var Dir =
                                            await getExternalStorageDirectory();
                                            Dio dio = Dio();
                                            print(list[position]);
                                            try {
                                              await dio.download(list[position].link,
                                                  "${Dir.path}/DownloadFiles/File_${list[position].checkout}",
                                                  onReceiveProgress:
                                                      (int recv, int total) {
                                                    print("Recv : ${recv} , Total : ${total} ");
                                                  });
                                              print(Dir.path);
                                            }
                                            catch (e)
                                            {
                                              print(e);
                                            }
                                          },
                                          child: Icon(Icons.file_download,
                                            color: Color(0xff16001f),
                                            size: height / 30,)
                                      ),
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




