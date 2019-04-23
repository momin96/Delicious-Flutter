import 'package:firebase_database/firebase_database.dart';
import '../Models/User.dart';
import 'dart:async' show Future;

class DatabaseManager {
  FirebaseDatabase _database = FirebaseDatabase.instance;

  DatabaseManager._internal() {
    FirebaseDatabase.instance.setPersistenceEnabled(true);
    _database = FirebaseDatabase.instance;
  }

  DatabaseManager() {
    DatabaseManager._internal();
  }

  static final DatabaseManager _singlton = new DatabaseManager._internal();
  static get instance => _singlton;

  static String uid;

  Future<User> getUserProfile() async {
    var path = '/users/$uid/userProfile';
    print(path);
    var ref = _database.reference().child(path);

    var user;

    await ref.onValue.listen((event) async {
      print('object');
      user = await User.fromSnapshot(event.snapshot);
    });

    return user;

    // ref.once().then((snapshot) {
    //   print('  once ');
    //   print(snapshot.value);
    // });
  }
}
