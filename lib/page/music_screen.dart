import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_relive_klearningpro/common_widget/CircularProgress.dart';
import 'package:flutter_relive_klearningpro/models/BrandModel.dart';
import 'package:flutter_relive_klearningpro/page/beginner_screeen.dart';
import 'package:flutter_relive_klearningpro/page/home_screen.dart';
import 'package:flutter_relive_klearningpro/page/vocab_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


BrandModel? brandModel;

class MusicPage extends StatefulWidget {

  String slug;
  bool isSubList;

  MusicPage({Key? key, required this.slug, this.isSubList=false}) : super(key: key);
  @override
  _BrandHomePageState createState() => _BrandHomePageState();
}

class _BrandHomePageState extends State<MusicPage> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getCategoryList(widget.slug,widget.isSubList),
      builder: (context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return CircularProgress();
          default:
            if (snapshot.hasError)
              return Text('Error: ${snapshot.error}');
            else
              return createListView(context);
        }
      },
    );
  }
}
////test
@override
Widget createListView(BuildContext context) {
  double width, height = 55.0;
  double customFontSize = 13;
  String defaultFontFamily = 'Roboto-Light.ttf';
  return Padding(
    padding: EdgeInsets.all(10),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              width: 100.0,
              height: height,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle, color: Color(0xFFF2F3F7)),
              child: RawMaterialButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => BeginnerListViewDetails(

                      )));
                },
                shape: CircleBorder(),
                child: Icon(
                  Icons.book_sharp,
                  color: Color(0xFFAB436B),


                ),
              ),
            ),
            Text(
              "K-Pop",
              style: TextStyle(
                  color: Color(0xFF969696),
                  fontFamily: 'Roboto-Light.ttf',
                  fontSize: customFontSize),

            )

          ],
        ),
        Column(
          children: <Widget>[
            Container(
              width: 100.0,
              height: height,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle, color: Color(0xFFF2F3F7)),
              child: RawMaterialButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => CourseListViewDetails(

                      )));
                },
                shape: CircleBorder(),
                child: Icon(
                  FontAwesomeIcons.bookReader,
                  color: Color(0xFFC1A17C),
                ),
              ),
            ),
            Text(
              "Dramma OST",
              style: TextStyle(
                  color: Color(0xFF969696),
                  fontFamily: defaultFontFamily,
                  fontSize: customFontSize),
            )
          ],
        ),
        Column(
          children: <Widget>[
            Container(
              width: 100.0,
              height: height,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle, color: Color(0xFFF2F3F7)),
              child: RawMaterialButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => VocabListViewDetails(

                      )));
                },
                shape: CircleBorder(),
                child: Icon(
                  FontAwesomeIcons.bookOpen,
                  color: Color(0xFF5EB699),
                ),
              ),
            ),
            Text(
              "Rap",
              style: TextStyle(
                  color: Color(0xFF969696),
                  fontFamily: defaultFontFamily,
                  fontSize: customFontSize),
            )
          ],
        ),
      ],
    ),
  );
}

/*
Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
  BrandModel values = snapshot.data;
  List<Results> results = values.results;
  final List result = [
    "Beginner",
    "Grammar",
    "Vocab",
  ];
  return GridView.count(
    crossAxisCount: 3,
    padding: EdgeInsets.all(1.0),
    childAspectRatio: 8.0 / 9.0,
    children: List<Widget>.generate(result.length, (index) {
      return Card(
          /*child: GridTilesCategory(
              //name: results[index].name,
             // imageUrl: results[index].imageUrl,
              //slug: results[index].slug
            title: Text(result[index]),
          )*/
      child: ListTile(
        //title: Text(result[index]),
        title: Text('Grammar'),
        onTap: (){
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => CourseListViewDetails(

              )));

        },
      ),

      );

    }),
  );
}

 */
//New route(Detail Page)
class CourseListViewDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grammar"),
      ),
      body: Container(
        child: RaisedButton(
          onPressed: () {  },
          child: VideoScreen(),
        ),
      ),

    );
  }
}
class BeginnerListViewDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Beginner"),
      ),
      body: Container(
        child: RaisedButton(
          onPressed: () {  },
          child: BeginnerScreen(),
        ),
      ),

    );
  }
}
class VocabListViewDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vocab"),
      ),
      body: Container(
        child: RaisedButton(
          onPressed: () {  },
          child: VocabScreen(),
        ),
      ),

    );
  }
}




Future<BrandModel?> getCategoryList(String slug, bool isSubList) async {
  if (brandModel == null) {
    //Response response = await get(Urls.ROOT_URL + slug);//Urls.ROOT_URL! + slug
    //int statusCode = response.statusCode;
    //var body = json.decode(response.body);
    // log('${body}');
    // if (statusCode == 200) {
    // brandModel = BrandModel.fromJson(body);
//  //  brandModel = (body).map((i) =>BrandModel.fromJson(body)) ;
    // return brandModel;
    // }
    // } else {
    return brandModel;
  }
}



//https://api.evaly.com.bd/core/public/brands/?limit=20&page=1&category=bags-luggage-966bc8aac