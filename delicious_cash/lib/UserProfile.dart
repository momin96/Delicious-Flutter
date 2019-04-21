import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './AndroidUI.dart';
import './Models/User.dart';
import 'dart:io' show Platform;

class UserProfile extends StatefulWidget {
  User user;

  UserProfile({this.user});

  @override
  State<StatefulWidget> createState() {
    return UserProfileState(user: this.user);
  }
}

class UserProfileState extends State<UserProfile> {
  User user;
  UserProfileState({this.user});

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
    debugPrint(this.user.fullName);

    if (this.user.fullName != null) {
      nameContoller = new TextEditingController();
      nameContoller.text = this.user.fullName;
    }

    if (this.user.email != null) {
      emailContoller = new TextEditingController();
      emailContoller.text = this.user.email;
    }

    if (this.user.phoneNo != null) {
      phoneController = new TextEditingController();
      phoneController.text = this.user.phoneNo;
    }

    return GestureDetector(
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: ListView(children: <Widget>[
          AndroidUI.fullNameWidget(nameContoller),
          AndroidUI.emailWidget(emailContoller),
          AndroidUI.phoneWidget(phoneController),
          Row(
            children: <Widget>[
              Expanded(child: AndroidUI.cancelButton(() {})),
              Container(
                width: 20,
              ),
              Expanded(
                child: AndroidUI.saveButton(() {
                  // debugPrint(emailContoller.text);
                  // debugPrint(nameContoller.text);
                  setState(() {
                    debugPrint(phoneController.text);
                    this.user.phoneNo = phoneController.text;
                  });
                }),
              ),
            ],
          ),
        ]),
      ),
      onTap: () {
        // debugPrint('gesture detector');
        // dismissKeypad();
      },
      onVerticalDragDown: (DragDownDetails detail) {
        dismissKeypad();
      },
    );
  }

  void dismissKeypad() {
    FocusScope.of(context).requestFocus(new FocusNode());
  }
}
