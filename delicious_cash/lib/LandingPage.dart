import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

import './Models/StateModel.dart';

class LandingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LandingPageState();
  }
}

class LandingPageState extends State<LandingPage> {
 
  final GoogleSignIn gSigin = GoogleSignIn();

  final FirebaseAuth fAuth = FirebaseAuth.instance; 
 
 
  @override
  Widget build(BuildContext context) {
    return androidScaffold();
  }

  Widget androidScaffold() {
    return Scaffold(
      body: Container(
        child: ListView(
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[Text('Declicious Cash')],
              ),
            )
          ],
        ),
      ),
    );
  }
}