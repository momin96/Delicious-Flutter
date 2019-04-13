import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './Managers/AuthManager.dart';
//import './Models/StateModel.dart';
//import './Dashboard.dart';

// Shift + opt + f

class LandingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LandingPageState();
  }
}

class LandingPageState extends State<LandingPage> {
  GoogleSignIn _googleSignIn = new GoogleSignIn(scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ]);

  GoogleSignInAccount _currentUser;

  String _contactText;

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  final AuthManager authManager = AuthManager();

  @override
  Widget build(BuildContext context) {
    return androidScaffold();
  }

  void initState() {
    super.initState();

    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      setState(() {
        _currentUser = account;
      });

      if (_currentUser != null) {
        _handleGetContact();
      } else {
        debugPrint("User Not logged In");
      }
    });
    _googleSignIn.signInSilently();
  }

  void _handleGetContact() {
    debugPrint('_handleGetContact');
  }

  Future<void> _handleSignIn() async {
    debugPrint('In Handle signin');

    try {
      await _googleSignIn.signIn();
    } catch (e) {
      debugPrint(e);
    }
  }

  Widget handleState() {
    if (_currentUser != null) {
      debugPrint(_currentUser.displayName);
      return loggedInWidget();
    } else {
      return RaisedButton(
        onPressed: () {
          _handleSignIn();
        },
        child: Text('Google signin'),
      );
    }
  }

  Widget loggedInWidget() {
    var name = _currentUser.displayName;

    return Column(
      children: <Widget>[
        Text('$name is currently logged In'),

        RaisedButton(
          child: Text('Logout'),
          onPressed: () {
            _googleSignIn.signOut();
          },
        )
      ],
    );
  }

  Widget androidScaffold() {
    return Scaffold(
      body: Container(
        child: ListView(
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  handleState(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
