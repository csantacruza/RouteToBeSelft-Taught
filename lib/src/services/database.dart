import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  //collection reference
  final CollectionReference exercisesCollection =
      Firestore.instance.collection('exercises');

  Future updateUserData(String name, int series, int repetitions,
      int difficulty, Timestamp date, bool completed) async {
    return await exercisesCollection.document(uid);
  }
}
