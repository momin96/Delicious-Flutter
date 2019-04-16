import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './AndroidUI.dart';
import 'dart:io' show Platform;

class UserProfile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return UserProfileState();
  }
}

class UserProfileState extends State<UserProfile> {
  TextEditingController nameContoller;
  TextEditingController emailContoller;
  TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return androidScafolld();

    if (Platform.isAndroid) {
      return androidScafolld();
    } else if (Platform.isIOS) {
      return iOSScaffold();
    }
    return null;
  }

  Widget androidScafolld() {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: getAndroidBody(),
    );
  }

  Widget iOSScaffold() {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('User Profile'),
      ),
      child: getIOSBody(),
    );
  }

  Widget getIOSBody() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: ListView(
              children: <Widget>[],
            ),
          ),
        ],
      ),
    );
  }

  Widget getAndroidBody() {
    return Container(
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ListView(children: <Widget>[
            AndroidUI.fullNameWidget(nameContoller),
            // AndroidUI.emailWidget(emailContoller),
            // AndroidUI.phoneWidget(phoneController),
          ]),
        ],
      )),
    );
  }
}
