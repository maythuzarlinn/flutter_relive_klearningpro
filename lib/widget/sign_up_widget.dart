

import 'package:flutter/material.dart';
import 'package:flutter_relive_klearningpro/provider/google_sign_in.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class SignUpWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.all(32.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(),
        FlutterLogo(size: 120),
        Spacer(),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Welcome to Youk Tat Yar Yar Learning.',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 8),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Login to your gmail account to continue.',
            style: TextStyle(fontSize: 16),
          ),
        ),
        Spacer(),
        ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              onPrimary: Colors.black,
              minimumSize: Size(double.infinity, 50),
            ),
            icon: FaIcon(FontAwesomeIcons.google, color: Colors.red,),
            label: Text('Sign Up with Google'),
            onPressed: () {
              final provider =
              Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.googleLogin();
            }
        ),
        SizedBox(height: 40),
        RichText(
          text: TextSpan(
            text: 'Already have an accoount? ',
            children: [
              TextSpan(
                  text: 'Log in',
                  style: TextStyle(decoration: TextDecoration.underline)
              ),
            ],
          ),
        ),
        Spacer(),
      ],
    ),
  );
}