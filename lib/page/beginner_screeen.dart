import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_relive_klearningpro/models/video_model.dart';
import 'package:flutter_relive_klearningpro/screens/video_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marquee/marquee.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class BeginnerScreen extends StatefulWidget {
  BeginnerScreen();
  @override
  _BeginnerScreenState createState() => _BeginnerScreenState();
}

class _BeginnerScreenState extends State<BeginnerScreen> {
  _BeginnerScreenState();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: null,
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Beginner').snapshots(),
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView(
              children: snapshot.data!.docs.map((document) {
                var url = document['url'];
                var des = document['description'];
                //snapshot.data!.docs.length;
                /*YoutubePlayerController _controller = YoutubePlayerController(
                  initialVideoId: YoutubePlayer.convertUrlToId(url).toString(),
                  flags: YoutubePlayerFlags(
                    autoPlay: false,
                    mute: false,
                    disableDragSeek: false,
                    loop: false,
                    isLive: false,
                    forceHD: false,
                  ),
                );

                 */
                return  GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => VideoScreen(video: document,),
                    ),
                 ),
                  child:Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 5.0),
                    padding: EdgeInsets.all(10.0),
                    height: 80.0,
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
                        Image(
                          width: 80.0,
                          image: NetworkImage(document['thumbnailUrl']),
                        ),
                        SizedBox(width: 10.0),
                        Expanded(
                          child: Marquee(
                            text: document['title'],
                            style: TextStyle(fontWeight: FontWeight.bold),
                            scrollAxis: Axis.horizontal,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            blankSpace: 20.0,
                            velocity: 100.0,
                            pauseAfterRound: Duration(seconds: 1),
                            startPadding: 10.0,
                            accelerationDuration: Duration(seconds: 1),
                            accelerationCurve: Curves.linear,
                            decelerationDuration: Duration(milliseconds: 500),
                            decelerationCurve: Curves.easeOut,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            );
          }
      ),
    );
  }
}

    /*return Container(
      child: FutureBuilder(
        future: getBeginner(),
          builder: (_, snapshot){
            if (snapshot.connectionState = ConnectionState.waiting) {
              return Center(
                child: Text("Loading..."),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, int index){
                  return ListTile(
                    title: Text(snapshot.data![index].data["title"]),
                  );

                });
            }
          }),
    );
  }

     */
    ////////////Version_2///////////////////////////////
    /*return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Beginner').snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
            if(!snapshot.hasData){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView(
              children: snapshot.data!.docs.map((document) {
                var url = document['url'];

                YoutubePlayerController _controller = YoutubePlayerController(
                  initialVideoId: YoutubePlayer.convertUrlToId(url).toString(),
                  flags: YoutubePlayerFlags(
                    autoPlay: false,
                    mute: false,
                    disableDragSeek: false,
                    loop: false,
                    isLive: false,
                    forceHD: false,
                  ),
                );
                return Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: Column(
                      children: <Widget>[
                        YoutubePlayer(
                          controller: _controller,
                          liveUIColor: Colors.amber,
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            );
          }
          ),
    );

  }

     */
    ////////////Version_1///////////////////////////////



////// _buildVideo
  /*_buildVideo (String video) {
    return Scaffold(
      floatingActionButton: null,
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Beginner').snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
            if(!snapshot.hasData){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView(
              children: snapshot.data!.docs.map((document) {
                var url = document['url'];

                YoutubePlayerController _controller = YoutubePlayerController(
                  initialVideoId: YoutubePlayer.convertUrlToId(url).toString(),
                  flags: YoutubePlayerFlags(
                    autoPlay: false,
                    mute: false,
                    disableDragSeek: false,
                    loop: false,
                    isLive: false,
                    forceHD: false,
                  ),
                );
                return GestureDetector(
                   onTap: () => Navigator.push(
                  context,
                   MaterialPageRoute(
                    builder: (_) => VideoScreen(id: video),
                   ),
                   ),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                    padding: EdgeInsets.all(10.0),
                    height: 80.0,
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
                    /*
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,

                        //SizedBox(width: 15.0),
                      */
              child: Row(
                      children: <Widget>[
                        Image(
                          width: 80.0,
                          image: NetworkImage(document['thumbnailUrl']),
                        ),
                        SizedBox(width: 10.0),
                        Expan                         child: Marque                   text: document['title'],
                            style: TextStyle(fontWeight: FontWeight.bold),
                            scrollAxis: Axis.horizontal,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            blankSpace: 20.0,
                            velocity: 100.0,
                            pauseAfterRound: Duration(seconds: 1),
                            startPadding: 10.0,
                            accelerationDuration: Duration(seconds: 1),
                            accelerationCurve: Curves.linear,
                            decelerationDuration: Duration(milliseconds: 500),
                            decelerationCurve: Curves.easeOut,
                          ),
                        ),
                        //),
                        //YoutubePlayer(
                        //  controller: _controller,
                        //   liveUIColor: Colors.amber,
                        // ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            );
          }
      ),


    );
  }


}
*/



