import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import './DatabaseManager.dart';

class AuthManager {
  GoogleSignIn googleSignIn = new GoogleSignIn(scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ]);

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  //GoogleSignInAccount currentUser;
  // GoogleSignInAuthentication googleAuth;
  FirebaseUser currentUser;
  // String contactText;

  String fUid;

  Future<void> handleSignIn() async {
    debugPrint('In Handle signin');

    try {
      var gSigin = await googleSignIn.signIn();

      GoogleSignInAuthentication googleAuth = await gSigin.authentication;

      AuthCredential authCredential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      currentUser = await firebaseAuth.signInWithCredential(authCredential);
      fUid = currentUser.uid;
      DatabaseManager.uid = currentUser.uid;
    } catch (e) {
      debugPrint(e);
    }
  }

  // Future<GoogleSignInAccount> getGoogleSignin(GoogleSignIn gSignin) async {
  //   // Is the user already signed in?
  //   GoogleSignInAccount account = gSignin.currentUser;

  //   if (account == null) {
  //     account = await gSignin.signInSilently();
  //   }

  //   return account;
  // }

  // Future<FirebaseUser> signIntoFirebase(GoogleSignInAccount gSignin) async {
  //   FirebaseAuth fibreaseAuth = FirebaseAuth.instance;
  //   GoogleSignInAuthentication googleAuth = await gSignin.authentication;

  //   print(googleAuth.accessToken);
  //   print(googleAuth.idToken);

  //   AuthCredential credential = GoogleAuthProvider.getCredential(
  //       accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

  //   FirebaseUser user = await fibreaseAuth.signInWithCredential(credential);

  //   return user;
  // }
}
