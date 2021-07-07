
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_relive_klearningpro/provider/google_sign_in.dart';
import 'package:provider/provider.dart';

class LoggedInWidget extends StatelessWidget {
  //final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile',
        style: TextStyle(color: Colors.blueGrey),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: [

          TextButton(
              child: Text('Sign Out',
              style: TextStyle(color: Colors.blueGrey),
            ),
            onPressed: (){
              final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.logout();
            },
          )
        ],
      ),
      body: Container(
        alignment: Alignment.topCenter,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Text(
             // 'Profile',
             // style: TextStyle(color: Colors.blueGrey,fontSize: 24),
           // ),

            SizedBox(height: 32),
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(user.photoURL!),//photoURL!.
            ),
            SizedBox(height: 8),
            Text(
              'Name: ' + user.displayName!,//displayName!
              style: TextStyle(color: Colors.blueGrey, fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Email: ' + user.email!,//email!
              style: TextStyle(color: Colors.blueGrey, fontSize: 16),
            ),


          ],
        ),
      ),
    );
  }
}