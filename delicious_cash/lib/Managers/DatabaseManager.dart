import 'package:firebase_database/firebase_database.dart';

class DatabaseManager {
  FirebaseDatabase _database = FirebaseDatabase.instance;

  DatabaseManager._internal() {
    _database = FirebaseDatabase.instance;
  }

  DatabaseManager() {
    _database = FirebaseDatabase.instance;
  }

  static final DatabaseManager _singlton = new DatabaseManager._internal();
  static get instance => _singlton;

  static String uid;

  void getUserProfile() {
    var path = '/users/$uid/userProfile';
    print(path);
    var ref = _database.reference().child(path);

    // ref.onValue.listen((event) {
    //   var val = event.snapshot.value;
    //   print('object');
    //   print(val);
    // });

    ref.once().then((snapshot) {
      print('  once ');
      print(snapshot.value);
    });
  }
}
