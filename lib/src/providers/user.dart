import 'package:routetobeselfttaught/src/providers/ImaAndCre.dart';
import 'package:routetobeselfttaught/src/providers/exercise.dart';
import 'package:routetobeselfttaught/src/providers/step.dart';

class User {
  final String uid;
  String name;
  List<String> knowledgeList;
  List<Step> stepsCompleted;
  List<Exercise> exercisesCompleted;
  List<Exercise> exercises;
  List<Step> steps;
  List<Exercise> tricksCompleted;
  List<ImaAndCre> imaAndCreCompleted;

  User({this.uid});
}

class UserData {

  final String uid;
  String name;
  List<String> currentKnowledge;
  List<Step> stepsCompleted;
  List<Exercise> exercisesCompleted;
  List<Exercise> exercises;
  List<Step> steps;
  List<Exercise> tricksCompleted;
  List<ImaAndCre> imaAndCreCompleted;
  int series;
  int repetitions;

  UserData({this.uid,this.series,this.repetitions,this.currentKnowledge, this.name, this.exercises});
}
