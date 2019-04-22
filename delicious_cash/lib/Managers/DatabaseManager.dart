import 'package:firebase_database/firebase_database.dart';

class DatabaseManager {
  FirebaseDatabase _database = FirebaseDatabase.instance;

  DatabaseManager._internal() {
    _database = FirebaseDatabase.instance;
  }

  static final DatabaseManager _singlton = new DatabaseManager._internal();
  static get instance => _singlton;

  void getUserProfile() {
    var ref = _database.reference().child('/users/userProfile');
    ref.once().then((snapshot) {});
  }
}
