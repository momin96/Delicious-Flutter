import 'package:flutter/material.dart';

class AndroidUI {
  static Widget fullNameWidget(TextEditingController ctr) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 20),
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

  static Widget emailWidget(TextEditingController ctr) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 20),
        child: TextField(
          controller: ctr,
          decoration: InputDecoration(
            hintText: 'Enter your Email Id',
            labelText: 'Email',
          ),
        ),
      ),
    );
  }

  static Widget phoneWidget(TextEditingController ctr) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 20),
        child: TextField(
          keyboardType: TextInputType.phone,
          controller: ctr,
          decoration: InputDecoration(
            hintText: 'Enter Phone No',
            labelText: 'Phone No',
          ),
        ),
      ),
    );
  }

  static Widget saveButton(VoidCallback onTap) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: RaisedButton(
        child: Text('Save'),
        onPressed: () => onTap(),
      ),
    );
  }

  static Widget cancelButton(VoidCallback onTap) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: RaisedButton(
        child: Text('Cancel'),
        onPressed: () => onTap(),
      ),
    );
  }
}
