import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
import './UserProfile.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return androidScaffold();

    if (Platform.isAndroid) {
      return androidScaffold();
    } else if (Platform.isIOS) {
      return iOSScaffold();
    }
    return null;
  }

  Widget iOSScaffold() {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(''),
      ),
      child: getiOSBody(),
    );
  }

  Widget androidScaffold() {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Test App'),
      ),
      body: getAndroidBody(),
    );
  }

  Widget getiOSBody() {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('Text'),
          ],
        ),
      ),
    );
  }

  Widget getAndroidBody() {
    return Container(
        child: Center(
      child: Column(
        children: <Widget>[
          RaisedButton(
            child: Text('Navigate To User Profile '),
            onPressed: () {
              Navigator.push(
                this.context,
                MaterialPageRoute(builder: (context) => UserProfile()),
              );
            },
          )
        ],
      ),
    ));
  }
}
