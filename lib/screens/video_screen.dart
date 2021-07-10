import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
        padding: EdgeInsets.all(10.0),
        height: 140.0,
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
        child: Row(
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
                data["description"],
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
