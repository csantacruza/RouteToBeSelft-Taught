import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:routetobeselfttaught/src/providers/exercise.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  //collection reference
  final CollectionReference exercisesCollection =
      Firestore.instance.collection('exercises');

  Future updateUserData(String name, int series, int repetitions,
      int difficulty, Timestamp date, bool completed) async {
    return await exercisesCollection.document(uid).setData({
      'name': name,
      'series': series,
      'repetitions': repetitions,
      'difficulty': difficulty,
      'date': date,
      'completed': completed
    });
  }

  //Exercise list form snapshot
  List<Exercise> _exerciseListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {      
      return Exercise(
          // x ?? y Mean -> If x doesn't exist then y
          date: doc.data['date'].toDate() ?? '',
          dificulty: doc.data['difficulty'] ?? 1,
          name: doc.data['name'] ?? 'exercise',
          repetitions: doc.data['repetitions'] ?? 8,
          series: doc.data['series'] ?? 3,
          completed: doc.data['completed'] ?? false);
          }).toList();
  }

  //Get exercises stream
  Stream<List<Exercise>> get exercises {
    return exercisesCollection.snapshots()
    .map(_exerciseListFromSnapshot);
  }
}
