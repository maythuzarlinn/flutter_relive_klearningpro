/*
import 'package:flutter/material.dart';
import 'package:flutter_relive_klearningpro/main.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavBarWidget extends StatefulWidget {
  @override
  _BottomNavBarWidgetState createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;
    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
        navigateToScreens(index);
      });

    }

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text(
            'Home',
            style: TextStyle(color: Color(0xFF545454)),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.heart),
          title: Text(
            'Music',
            style: TextStyle(color: Color(0xFF545454)),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.shoppingBag),
          title: Text(
            'Discussion',
            style: TextStyle(color: Color(0xFF545454)),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.dashcube),
          title: Text(
            'Profile',
            style: TextStyle(color: Color(0xFF545454)),
          ),
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Color(0xFFAA292E),
      onTap: _onItemTapped,
    );
  }
}

 */
import 'package:flutter/material.dart';
import 'package:flutter_relive_klearningpro/main.dart';
import 'package:flutter_relive_klearningpro/page/home_page.dart';
import 'package:flutter_relive_klearningpro/page/music_screen.dart';
import 'package:flutter_relive_klearningpro/widget/logged_in_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class BottomNavBarWidget extends StatefulWidget {
  @override
  _BottomNavBarWidgetState createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  int _selectedIndex = 0;
  final List<Widget> _children = [

    HomeScreen(),
    MusicPage(slug: 'brands/?limit=3&page=1'),
    HomeScreen(),
    LoggedInWidget(),
  ];
  @override
  Widget build(BuildContext context) {
    //final newTrip = new Chip(null, null, null, null, null, null);
    int _selectedIndex = 0;
    GlobalKey _bottomNavigationKey = GlobalKey();

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
        navigateToScreens(index);

          Navigator.push(context, MaterialPageRoute(
              builder: (context) => LoggedInWidget()
          ));

      });

    }
    //body: _children[_currentIndex],
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text(
            'Home',
            style: TextStyle(color: Color(0xFF545454)),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.youtube),
          title: Text(
            'Lesson',
            style: TextStyle(color: Color(0xFF545454)),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.chalkboardTeacher),
          title: Text(
            'Discussion',
            style: TextStyle(color: Color(0xFF545454)),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.user),
          title: Text(
            'Profile',
            style: TextStyle(color: Color(0xFF545454)),

          ),
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Color(0xFFAA292E),
      onTap: _onItemTapped,
    );
  }
}

