import 'package:chewie/chewie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:polygon_clipper/polygon_border.dart';
import 'package:straightup_ares/home.dart';
import 'package:straightup_ares/vedio_data.dart';
import 'package:video_player/video_player.dart';
import 'package:polygon_clipper/polygon_clipper.dart';
import 'kids.dart';
class video_detail extends StatefulWidget {
  final Data data;
  video_detail({this.data});
  @override
  _video_detailState createState() => _video_detailState(data);
}
class _video_detailState extends State<video_detail> {
  VideoPlayerController  videoPlayerController;
  ChewieController chewieController;
  bool isPlaying = false, isEndPlaying = false;
  Future<void> futureController;
  @override
  void initState() {
    // TODO: implement initState
    videoPlayerController = VideoPlayerController.network(data.file);
    futureController = videoPlayerController.initialize();
    videoPlayerController.setLooping(true);
    videoPlayerController.setVolume(25.0);
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 3 / 3,
      autoPlay: true,
      looping: false,
    );
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }
  Data data;
  _video_detailState(this.data);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => home()));
                      },
                    ),
                  ],
                ),
              ),
              Center(
                child:  _playView(),
              ),
              SizedBox(height: height/40,),
              Container(
                width: width/1.1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('${data.title}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),),
                    SizedBox(height: height/70,),
                    Text(
                      '${data.descrption}',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                      ),),
                    Divider(
                    ), // Column(
                    //   children: <Widget>[
                    //     Text("Video Powered by:",
                    //       style: TextStyle(
                    //           color: Colors.grey,
                    //           fontWeight: FontWeight.w300
                    //       ),
                    //     ),
                    SizedBox(height: height/20,),

                        // Container(
                        //   height: height/6,
                        //   padding: EdgeInsets.all(18.0),
                        //   margin: EdgeInsets.only(right: 16.0),
                        //   decoration: ShapeDecoration(
                        //       image: DecorationImage(
                        //           image: AssetImage("Images/tutorial.png"),
                        //           fit: BoxFit.contain
                        //       ),
                        //       shape: PolygonBorder(
                        //           sides: 7,
                        //           borderRadius: 8.0,
                        //           border: BorderSide(color: Colors.blueGrey, width: 2))),
                        // ),
                        // Text("ARES",
                        //   style: TextStyle(
                        //       color: Colors.black54,
                        //       fontWeight: FontWeight.w400
                        //   ),
                        // ),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _playView() {
    chewieController.play();
    return Chewie(controller: chewieController);
  }
}
