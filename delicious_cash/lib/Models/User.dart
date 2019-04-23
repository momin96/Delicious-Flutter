import 'package:firebase_database/firebase_database.dart';

class User {
  String key;
  String userId;
  String fullName;
  String email;
  String phoneNo;
  String photoURL;

  User() {}

  static User createTestUser() {
    User user = new User();
    user.fullName = 'Nasir Ahmed Momin';
    user.email = 'momin96@gmail.com';
    return user;
  }

  User.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        userId = snapshot.value['uid'],
        fullName = snapshot.value['displayName'],
        email = snapshot.value['email'],
        phoneNo = snapshot.value['phoneNo'],
        photoURL = snapshot.value['photoURL'];

  toJson() {
    return {
      'uid': userId,
      'email': email,
      'phoneNo': phoneNo,
      'displayName': fullName,
      'photoURL': photoURL,
    };
  }
}
