import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_relive_klearningpro/common_widget/BottomNavBarWidget.dart';
import 'package:flutter_relive_klearningpro/models/user.dart';
import 'package:flutter_relive_klearningpro/page/CreateAccountPage.dart';
import 'package:flutter_relive_klearningpro/page/UploadPage.dart';
import 'package:flutter_relive_klearningpro/page/home_page.dart';
import 'package:flutter_relive_klearningpro/page/music_screen.dart';
import 'package:flutter_relive_klearningpro/widget/logged_in_widget.dart';
import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn gSignIn = GoogleSignIn();
final usersReference = FirebaseFirestore.instance.collection("users");

final DateTime timestamp = DateTime.now();
User? currentUser;

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageNewState createState() => _MyHomePageNewState();
}

class _MyHomePageNewState extends State<MyHomePage> {
  bool isSignedIn = false;
  late PageController pageController;
  int getPageIndex = 0;

  void initState(){
    super.initState();

    pageController = PageController();

    gSignIn.onCurrentUserChanged.listen((gSigninAccount){
      controlSignIn(gSigninAccount!);
    }, onError: (gError){
      print("Error Message: " + gError);
    });

    gSignIn.signInSilently(suppressErrors: false).then((gSignInAccount){
      controlSignIn(gSignInAccount!);
    }).catchError((gError){
      print("Error Message: " + gError);
    });

    setState(() {});
  }


  controlSignIn(GoogleSignInAccount signInAccount) async
  {
    if(signInAccount != null)
    {
      await saveUserInfoToFireStore();
      setState(() {
        isSignedIn = true;
      });
    }
    else
    {
      setState(() {
        isSignedIn = false;
      });
    }
  }

  saveUserInfoToFireStore() async {
    final GoogleSignInAccount? gCurrentUser = gSignIn.currentUser;
    DocumentSnapshot documentSnapshot = await usersReference.doc(gCurrentUser!.id).get();

    if(!documentSnapshot.exists){
      final username = await Navigator.push(context, MaterialPageRoute(builder: (context) => CreateAccountPage()));

      usersReference.doc(gCurrentUser.id).set({
        "id": gCurrentUser.id,
        "profileName": gCurrentUser.displayName,
        "username": username,
        "url": gCurrentUser.photoUrl,
        "email": gCurrentUser.email,
        "bio": "",
        "timestamp": timestamp,
      });
      documentSnapshot = await usersReference.doc(gCurrentUser.id).get();
    }

    currentUser = User.fromDocument(documentSnapshot);

  }

  void dispose(){
    pageController.dispose();
    super.dispose();
  }

  loginUser(){
    gSignIn.signIn();
  }
  logoutUser(){
    gSignIn.signOut();
  }
  whenPageChanges(int pageIndex){
    setState(() {
      this.getPageIndex = pageIndex;
    });
  }

  Scaffold buildHomeScreen(){
    return Scaffold(
      bottomNavigationBar: BottomNavBarWidget(),
    );
  }

  Scaffold buildSignInScreen(){
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Theme.of(context).accentColor, Theme.of(context).primaryColor],
          ),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Youk Tat Yar Yar",
              style: TextStyle(fontSize: 92.0, color: Colors.white,fontFamily: "Signatra"),
            ),
            GestureDetector(
              onTap: loginUser,
              child: Container(
                width: 270.0,
                height: 65.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/google_signin_button.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    if(isSignedIn)
    {
      return buildHomeScreen();
    }
    else
    {
      return buildSignInScreen();
    }
  }

}