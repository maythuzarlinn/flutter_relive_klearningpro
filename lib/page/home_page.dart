import 'package:flutter/material.dart';
import 'package:flutter_relive_klearningpro/common_widget/BottomNavBarWidget.dart';
import 'package:flutter_relive_klearningpro/main.dart';
import 'package:flutter_relive_klearningpro/page/PopularMenu.dart';
import 'package:flutter_relive_klearningpro/page/course_category.dart';
import 'package:flutter_relive_klearningpro/page/music_screen.dart';
import 'package:flutter_relive_klearningpro/page/profile_overview.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          //SearchWidget(),
          //TopPromoSlider(),
          PopularMenu(),
          SizedBox(
            height: 10,
            child: Container(
              color: Color(0xFFf5f6f7),
            ),
          ),
          PreferredSize(
            preferredSize: Size.fromHeight(50.0),
            child: Material(
              child: TabBar(
                controller: _tabController,
                labelColor: Colors.black,
                tabs: [
                  Tab(
                    text: 'Basic',
                  ),
                  Tab(
                    text: '',
                  ),
                  Tab(
                    text: '   ',
                  )
                ], // list of tabs
              ),
            ),
          ),
          SizedBox(
            height: 10,
            child: Container(
              color: Color(0xFFf5f6f7),
            ),
          ),
          Expanded(
            child: Material(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Container(
                    color: Colors.white24,
                    //child: CategoryPage(slug: 'categories/?limit=3&page=1'),
                    child: BrandHomePage(slug: 'brands/?limit=3&page=1'),

                  ),
                  Container(
                    color: Colors.white24,
                    /*child: ListTile(
                      title: Text("Grammar"),
                    )

                     */
                    //child: BrandHomePage(slug: 'brands/?limit=3&page=1'),
                  ),
                  Container(
                    color: Colors.white24,
                    //child: ShopHomePage(slug: 'custom/shops/?page=1&limit=1'),
                  ) // class name
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// ignore: camel_case_types

class MyHomePage_After extends StatefulWidget {
  @override
  _MyHomePageNewState createState() => _MyHomePageNewState();
}

class _MyHomePageNewState extends State<MyHomePage_After> {
  final List<Widget> viewContainer = [

    HomeScreen(),
    //MusicPage(slug: 'brands/?limit=3&page=1'),
    //HomeScreen(),
    //ProfileOverview()
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(title: Text('Youk Tat Yar Yar'),),
        //drawer: DrawerWidget(),
        body: IndexedStack(
          index: currentIndex,
          children: viewContainer,
        ),
        bottomNavigationBar: BottomNavBarWidget(),
      ),
    );
  }
}


