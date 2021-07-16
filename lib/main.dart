import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_relive_klearningpro/common_widget/AppBarWidget.dart';
import 'package:flutter_relive_klearningpro/common_widget/BottomNavBarWidget.dart';
import 'package:flutter_relive_klearningpro/models/user.dart';
import 'package:flutter_relive_klearningpro/page/MyHomePage.dart';
import 'package:flutter_relive_klearningpro/page/home_page.dart';
import 'package:flutter_relive_klearningpro/page/music_screen.dart';
import 'package:flutter_relive_klearningpro/page/profile_overview.dart';
import 'package:flutter_relive_klearningpro/provider/google_sign_in.dart';
import 'package:flutter_relive_klearningpro/widget/CreateAccountPage.dart';
import 'package:flutter_relive_klearningpro/widget/sign_up_widget.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

/*
void main()
{

  runApp(MyApp());
}

 */

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  static final String title = 'MainPage';

  @override
  /*Widget build(BuildContext context) => ChangeNotifierProvider(
  create: (context) => GoogleSignInProvider(),
  child: MaterialApp(

   */
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        fontFamily: 'Roboto',
        //primaryColor: Colors.white,
        //primaryColorDark: Colors.blueGrey,
        //backgroundColor: Colors.white
        appBarTheme: AppBarTheme(
          color: Colors.blueGrey,
        ),

      ),
      //ThemeData.dark().copyWith(accentColor: Colors.indigo),//primarySwatch: Colors.blue,
      home: MyHomePage(), //ProfileOverview()
      //)//ChangeNotifierProvider
      //}
    );
  }
}



