import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_relive_klearningpro/page/MyHomePage.dart';
import 'package:flutter_relive_klearningpro/widget/HeaderWidget.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_relive_klearningpro/main.dart';
import 'package:flutter_relive_klearningpro/page/home_page.dart';
import 'package:flutter_relive_klearningpro/widget/logged_in_widget.dart';
import 'package:flutter_relive_klearningpro/widget/sign_up_widget.dart';


class ProfileOverview extends StatelessWidget {
  @override

  Widget build(BuildContext context) => Scaffold(
    appBar: header(context, strTitle: 'Profile',),
    body: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());
        }else if(snapshot.hasData){
          return MyHomePage();
        } else if (snapshot.hasError){
          return Center(child: Text('Something Went Wrong!'));
        }else {
          return SignUpWidget();
        }
      },
    ),

  );
}
