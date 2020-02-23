
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