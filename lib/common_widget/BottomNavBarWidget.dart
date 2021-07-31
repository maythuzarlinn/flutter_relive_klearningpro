import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_relive_klearningpro/models/user.dart';
import 'package:flutter_relive_klearningpro/page/MyHomePage.dart';
import 'package:flutter_relive_klearningpro/page/UploadPage.dart';
import 'package:flutter_relive_klearningpro/page/home_page.dart';
import 'package:flutter_relive_klearningpro/page/music_screen.dart';
import 'package:flutter_relive_klearningpro/widget/HeaderWidget.dart';
import 'package:flutter_relive_klearningpro/widget/logged_in_widget.dart';

class BottomNavBarWidget extends StatefulWidget {
  final User currentUser;

  const BottomNavBarWidget({Key? key, required this.currentUser})
      : super(key: key);

  @override
  _BottomNavBarWidgetState createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  int currentIndex = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();
  final List<Widget> viewContainer = [
    HomeScreen(),
    MusicPage(slug: 'brands/?limit=3&page=1'),
    UploadPage(gCurrentUser: currentUser!),
    //UploadPage(),
    LoggedInWidget(),
  ];
  @override
  Widget build(BuildContext context) {
    //final newTrip = new Chip(null, null, null, null, null, null);
    //int _selectedIndex = 0;

    //void _onItemTapped(int index) {
    // setState(() {
    //  currentIndex = index;
    /*if(_selectedIndex == 0 ){
          navigateToScreens(0);

          Navigator.push(context, MaterialPageRoute(
              builder: (context) => LoggedInWidget()
          ));
        }else if(_selectedIndex == 1){
          navigateToScreens(1);

          Navigator.push(context, MaterialPageRoute(
              builder: (context) => MusicPage(slug: 'brands/?limit=3&page=1')
          ));
        }else if(_selectedIndex == 2){
          navigateToScreens(2);

          Navigator.push(context, MaterialPageRoute(
            builder: (context) => HomeScreen()
          ));
        }else if(_selectedIndex == 3){
          navigateToScreens(3);

          Navigator.push(context, MaterialPageRoute(
            builder: (context) => LoggedInWidget()
          ));
        }

         */

    //});
    // }

    return MaterialApp(
      home: new Scaffold(
        appBar: header(
          context,
          strTitle: 'Youk Tat Yar Yar',
        ),
        body: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top,
          ),
          child: viewContainer[currentIndex],
        ),
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: currentIndex,
          height: 45.0,
          items: <Widget>[
            Icon(
              Icons.home,
              size: 35,
              color: Colors.blueGrey,
            ),
            Icon(
              Icons.movie,
              color: Colors.blueGrey,
            ),
            Icon(
              Icons.notifications_active_rounded,
              color: Colors.blueGrey,
            ),

            //Icon(Icons.shopping_cart),
            Icon(
              Icons.person,
              color: Colors.blueGrey,
            ),
          ],
          //color: Colors.grey[200],
          buttonBackgroundColor: Colors.grey[400],
          backgroundColor: Colors.white,
          animationCurve: Curves.fastOutSlowIn,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              currentIndex = index;
              print(currentIndex);
            });
          },
          // currentIndex: _selectedIndex,
          // selectedItemColor: Color(0xFFAA292E),
          // onTap: _onItemTapped,
        ),
      ),
    );
  }
}
