import 'package:flutter/material.dart';

class AndroidUI {
  static Widget fullNameWidget(TextEditingController ctr) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: TextField(
          controller: ctr,
          decoration: InputDecoration(
            hintText: 'Enter yout Full Name',
            labelText: 'Full Name',
          ),
        ),
      ),
    );
  }

  // static Widget emailWidget(TextEditingController ctr) {}

  // static Widget phoneWidget(TextEditingController ctr) {}
}
