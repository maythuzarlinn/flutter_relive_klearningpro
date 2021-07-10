import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_relive_klearningpro/screens/video_screen.dart';
import 'package:marquee/marquee.dart';

class DetailVideoScreen extends StatefulWidget {
  const DetailVideoScreen({Key? key}) : super(key: key);

  @override
  _DetailVideoScreenState createState() => _DetailVideoScreenState();
}

class _DetailVideoScreenState extends State<DetailVideoScreen> {
  var firestoreDb = FirebaseFirestore.instance.collection("Beginner").snapshots();
  navigateToDetail(DocumentSnapshot video){
    Navigator.push(context, MaterialPageRoute(builder: (context)=> VideoScreen(video: video,)));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: firestoreDb,
          builder: (BuildContext context,
        AsyncSnapshot<QuerySnapshot> snapshot){
            if(!snapshot.hasData) return CircularProgressIndicator();
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, int index){

                //return Text(snapshot.data!.docs[index]['title']);
                  return GestureDetector(
                    onTap: () => navigateToDetail(snapshot.data!.docs[index]),
                    //onTap: () => Navigator.push(
                    //  context,
                     // MaterialPageRoute(
                     //   builder: (_) => VideoScreen(video: snapshot.data!.docs[index]['url'].toString(),),
                     // ),
                   // ),

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
                            image: NetworkImage(snapshot.data!.docs[index]['thumbnailUrl']),
                          ),
                          SizedBox(width: 10.0),
                          Expanded(
                            child: Marquee(
                              text: snapshot.data!.docs[index]['title'],
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

            });
      }),
    );
  }
}
