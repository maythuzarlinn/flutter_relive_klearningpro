import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoScreen extends StatefulWidget {
  final DocumentSnapshot video;
  VideoScreen({required this.video});
  //final String video;
  //VideoScreen({required this.video});

//final QuerySnapshot snapshot;
  //nal int index;
  //onst VideoScreen({Key? key, required this.snapshot, required this.index}) : super(key: key);

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late YoutubePlayerController _controller;
  var data;
  late String videoId;

  //var firestoreDb = FirebaseFirestore.instance.collection('Beginner').snapshots();
  @override
  void initState() {
    super.initState();
    //var url = FirebaseFirestore.instance.collection('Beginner').doc('url').toString();
    data = widget.video.data();
    videoId = YoutubePlayer.convertUrlToId(data["url"])!;
    print("videoId: " + videoId);
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 36.0),
          padding: EdgeInsets.all(1.0),
          width: MediaQuery
              .of(context)
              .size
              .width / 0.1,
          height: MediaQuery
              .of(context)
              .size
              .height / 2,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 1),
                blurRadius: 6.0,
              ),
            ],
          ),
          child: Column(
              children: <Widget>[
                YoutubePlayer(
                  controller: _controller,
                  liveUIColor: Colors.amber,
                  showVideoProgressIndicator: true,
                  onReady: () {
                    print('Player is ready.');
                  },
                ),
                SizedBox(width: 10.0),
                Expanded(
                  child: Text(
                    data["title"],
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.0,
                    ),
                  ),
                ),
                SizedBox(width: 10.0),
                Divider(
                  thickness: 1,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 1.0, vertical: 1.0),
                  padding: EdgeInsets.all(10.0),
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text('0'),
                          SizedBox(
                            width: 10,
                          ),
                          Text('views'),
                        ],
                      ),
                      Row(
                        children: [
                          Text('0 Comment'),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          Text(
                            '0',
                            //style: TextStyle(
                            // fontWeight: FontWeight.bold,
                            //),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(FontAwesomeIcons.solidHeart, color: Colors.red,),
                        ],
                      )
                    ],
                  ),
                ),
                Divider(
                  thickness: 1,
                ),
                Padding(padding: const EdgeInsets.all(10.0),

                  ///////////
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [


                      Row(children: [

                        Icon(FontAwesomeIcons.heart, color: Colors.red,),
                        SizedBox(width: 10,),

                      ],
                      ),

                      Row(children: [

                        Icon(FontAwesomeIcons.comment,color: Colors.blueGrey ),
                        SizedBox(width: 10,),
                        Text(
                          'Comment',
                          //style: TextStyle(
                          //  fontWeight: FontWeight.bold,
                          //),
                        ),
                      ],
                      ),
                      Row(
                        children: [
                          Icon(FontAwesomeIcons.solidSave,color: Colors.blueGrey, ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(FontAwesomeIcons.cloudDownloadAlt, color: Colors.blueGrey),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),

                    ],

                  ),
                ),
                Divider(
                  thickness: 1,
                ),

              ]
          ),
        )
    );
  }
}
