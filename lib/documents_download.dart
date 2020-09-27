import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';


class MyDialog extends StatefulWidget {
  final double width;
  final String link;
  final String title;
  final double height;
  const MyDialog({Key key, this.width,this.title, this.link, this.height})
      : super(key: key);
  @override
  _MyDialogState createState() =>
      new _MyDialogState(width,title, link, height);
}
class _MyDialogState extends State<MyDialog> {
  var progress = "Downloading";
  bool downloading = false, completed = false;
  final double width;
  final String title;
  final String link;
  final double height;
  _MyDialogState(this.width,this.title, this.link, this.height);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      content: Container(
        height: height / 5,
        child: Column(
          children: <Widget>[
            Text(
              downloading == false
                  ? completed == false
                  ? 'Click Download File'
                  : 'File Downloaded'
                  : 'Downloading File',
              style: TextStyle(
                  color: Colors.purple,
                  fontSize: height / 50,
                  fontWeight: FontWeight.w500
                //letterSpacing: 1
              ),
            ),
            SizedBox(
              height: height / 60,
            ),
            downloading == false
                ? FlatButton(
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(20.0),
                //    side: BorderSide(color: Color(0xff2CBE77))
              ),
              color: Color(0xff9847b7),
              textColor: Colors.white,
              child: Text(
                completed == false ? "Start Downloading" : "Close",
                style: TextStyle(
                    fontSize: height / 40, fontWeight: FontWeight.w500
                  //letterSpacing: 1
                ),
              ),
              onPressed: () async {
                if (completed == false) {
                  var Dir = await getExternalStorageDirectory();;
                  Dio dio = Dio();
                  try {
                    downloading = true;
                    await dio.download(link,
                        "${Dir.path}/DownloadFiles/File_${title}",
                        onReceiveProgress: (int recv, int total) {
                          setState(() {
                            downloading == true
                                ? progress =
                            "Downloading File ${title}: ${((recv / total) * 100).toStringAsFixed(0)}% of 100"
                                : progress = "Completed";
                            ;
                          });
                        });
                    print(Dir.path);
                    downloading = false;
                    setState(() {
                      downloading == true
                          ? progress = "Downloading"
                          : progress = "Completed";
                      completed = true;
                    });
                  } catch (e) {
                    print(e);
                  }
                } else {
                  Navigator.pop(context);
                }
              },
            )
                : Text(
              '${progress}',
              style: TextStyle(
                  fontSize: height / 50, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}