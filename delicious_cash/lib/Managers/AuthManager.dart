//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:google_sign_in/google_sign_in.dart';

class AuthManager {
  // GoogleSignIn _googleSignIn = new GoogleSignIn(
  //     scopes: ['email', 'https://www.googleapis.com/auth/contacts.readonly']);

  void initLogin() {
    print("doLogin");

    // _googleSignIn.onCurrentUserChanged
    //     .listen((GoogleSignInAccount account) async {
    //   if (account != null) {
    //   } else {}
    // });

    // _googleSignIn.signInSilently().whenComplete(() {});
  }

  // void doLogin() {
    
  //   //await _googleSignIn.signIn();
  // }

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
