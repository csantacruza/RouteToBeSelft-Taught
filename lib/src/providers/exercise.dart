import 'package:routetobeselfttaught/src/providers/Generic/activity.dart';

import 'Generic/time.dart';

class Exercise extends Activity<Exercise>{

final String name;
int difficulty;
//if you try [Static] you $value will be in seconds
//if you try [Quantity] you $value will be in numbers
int repetitions;
int series;
String image;
//if you try [Hypertrophy] you need 30sec - 1min of restTime
//if you try [Strength] you need 1min - 2,3 min of restTime
Time restTime;
final DateTime date;
bool completed;
List<Exercise> predecessors;
List<Exercise> successors;



Exercise({this.completed,this.name,this.difficulty,this.date,
this.series,this.repetitions,this.restTime,this.image,this.successors,this.predecessors});

}
