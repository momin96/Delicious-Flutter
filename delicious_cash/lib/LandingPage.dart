import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'dart:convert' show json;
import "package:http/http.dart" as http;
import 'UserProfile.dart';
import './Managers/AuthManager.dart';
import './Home.dart';

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
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  final AuthManager authManager = AuthManager();

  BuildContext context;
  @override
  Widget build(BuildContext context) {
    this.context = context;
    return androidScaffold();
  }

  void initState() {
    super.initState();

    authManager.googleSignIn.onCurrentUserChanged
        .listen((GoogleSignInAccount account) {
      setState(() {
        authManager.currentUser = account;
      });

      if (authManager.currentUser != null) {
        _handleGetContact();
      } else {
        debugPrint("User Not logged In");
      }
    });
    try {
      authManager.googleSignIn.signInSilently();
    } catch (e) {
      debugPrint(e);
    }
  }

  Future<void> _handleGetContact() async {
    setState(() {
      authManager.contactText = "Loading contact info...";
    });

    http.Response response = await http.get(
      'https://people.googleapis.com/v1/people/me/connections'
          '?requestMask.includeField=person.names',
      headers: await authManager.currentUser.authHeaders,
    );

    if (response.statusCode != 200) {
      setState(() {
        authManager.contactText = "People API gave ${response.statusCode}"
            "response. Check logs for details";
      });
      return;
    }

    Map<String, dynamic> data = json.decode(response.body);
    var namedContact = _pickFirstNameContact(data);

    setState(() {
      if (namedContact != null) {
        authManager.contactText = "I see you know $namedContact";
      } else {
        authManager.contactText = "No contacts to display";
      }
    });
  }

  String _pickFirstNameContact(Map<String, dynamic> data) {
    List<dynamic> connections = data['connections'];
    Map<String, dynamic> contact = connections.firstWhere(
      (dynamic contact) => contact['names'] != null,
      orElse: () => null,
    );
    if (contact != null) {
      Map<String, dynamic> name = contact['names'].firstWhere(
        (dynamic name) => name['displayName'] != null,
        orElse: () => null,
      );
      if (name != null) {
        return name['displayName'];
      }
    }
    return null;
  }

  Widget handleState() {
    if (authManager.currentUser != null) {
      return loggedInWidget();
    } else {
      return loggedOutWidget();
    }
  }

  Widget loggedOutWidget() {
    return Column(
      children: <Widget>[
        Text('You are currently not Logged In!'),
        RaisedButton(
          onPressed: () {
            authManager.handleSignIn();
          },
          child: Text('Google SIGN IN'),
        )
      ],
    );
  }

  Widget loggedInWidget() {
    return Column(
      children: <Widget>[
        const Text('Signed In Successfully'),
        Text(authManager.contactText ?? ''),
        RaisedButton(
          child: Text('Logout'),
          onPressed: () {
            authManager.googleSignIn.signOut();
          },
        ),
        RaisedButton(
          child: Text('Refresh'),
          onPressed: () {
            _handleGetContact();
          },
        )
      ],
    );
  }

  Widget androidScaffold() {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        leading: menuDrawer(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            handleState(),
          ],
        ),
      ),
    );
  }

  Widget menuDrawer() {
    if (authManager.currentUser != null) {
      return Padding(
        padding: EdgeInsets.only(left: 10),
        child: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            debugPrint('menu drawer');

            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserProfile(),
                ));
          },
        ),
      );
    } else {
      return Container();
    }
  }
}
