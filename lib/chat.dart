import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'constants.dart';
import 'model.dart';
final firestore = Firestore.instance;
FirebaseUser loggedInUser;
String name = '';
class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}
class _ChatScreenState extends State<ChatScreen> {

  final messageTextController=TextEditingController();
  final _auth = FirebaseAuth.instance;
  String messagetext;

  Future Init() async
  {
    if(loggedInUser.email!="admin@gmail.com") {
      FirebaseUser user = await FirebaseAuth.instance.currentUser();
      Firestore firestore = Firestore.instance;
      DocumentReference documentReference = await firestore.collection("Users")
          .document(loggedInUser.email);
      documentReference.get().then((value) {
        name = value.data["name"];
        setState(() {});
      });
    }
  }
  Future get() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    Firestore firestore = Firestore.instance;
    QuerySnapshot querySnapshot =
    await firestore.collection("messages").getDocuments();
    List<DocumentSnapshot> documentSnapshot = querySnapshot.documents;
    setState(() {});
  }
  @override
  void initState()
  {
    getCurrentUser();
    Init();
    get();
    super.initState();
  }
  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser =await FirebaseAuth.instance.currentUser();
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
              }),
        ],
        title: Text(
          'Chat',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessagesStream(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      onChanged: (value) {
                        messagetext = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      messageTextController.clear();
                      //Implement send functionality.
                      firestore.collection('messages').document(loggedInUser.email).collection("admin").document().setData(
                          {'text': messagetext, 'sender': loggedInUser.email,
                            'date': DateTime.now().toIso8601String().toString(),});
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class MessagesStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: firestore.collection('messages').document(loggedInUser.email).collection("admin").orderBy('date').snapshots(),
      builder: (context, snapshots) {
        if (!snapshots.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Color(0XFFCECCCF),
            ),
          );
        }
        final messages = snapshots.data.documents.reversed;
        List<MessageBubble> messageWidgets = [];
        for (var message in messages)
        {
          final datetime = message.data["date"];
          final messageText = message.data["text"];
          final messageSender = message.data["sender"];
          final currentUser=loggedInUser.email;
          final messageBubble = MessageBubble(
            sender: messageSender,
            text: messageText,
            time: datetime,
            isme:  currentUser==messageSender,);
          messageWidgets.add(messageBubble);
        }
        return  Expanded(
          child: ListView(
            reverse: true,
            padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 20.0),
            children: messageWidgets,
          ),
        );
      },
    );
  }
}
class MessageBubble extends StatelessWidget
{
  MessageBubble({this.sender,this.text,this.time,this.isme});
  final String sender;
  final String time;
  final String text;
  final bool isme;
  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: EdgeInsets.all(10.0),
        child:
        Column(
          crossAxisAlignment:isme ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children:[
            Text(
              sender == "admin@gmail.com" ? "Admin" : '${name}',
              style: TextStyle(
                fontSize: 12,
                color: Colors.black54
            ),),
            Material(
              borderRadius:isme ? BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  bottomLeft: Radius.circular(30.0),
                  bottomRight:Radius.circular(30.0)):
              BorderRadius.only(
                bottomLeft: Radius.circular(30.0),
                bottomRight:Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              elevation: 5.0,
              color:isme ? Color(0XFFCECCCF):Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
                child: Text('$text ',
                  style:TextStyle
                    (fontSize: 15.0,
                      color:isme ? Colors.white:Colors.black54
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment:isme ? MainAxisAlignment.end : MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('${time.substring(11,19)}',
                      style:TextStyle
                        (fontSize: 15.0,
                          color:Colors.black
                      )
                      ,  ),
                  ],
                ),
              ],
            ),
          ],
        ),
      );;
  }
}