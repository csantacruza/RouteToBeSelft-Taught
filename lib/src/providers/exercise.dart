import 'package:routetobeselfttaught/src/providers/Generic/activity.dart';

import 'Generic/time.dart';

class Exercise implements Activity<Exercise>{

String name;
int _dificulty;
//if you try [Static] you $value will be in seconds
//if you try [Quantity] you $value will be in numbers
int _repetitions;
int _series;
String _image;
//if you try [Hypertrophy] you need 30sec - 1min of restTime
//if you try [Strength] you need 1min - 2,3 min of restTime
Time _restTime;
Date _date;
List<Exercise> predecessors;
List<Exercise> successors;

Exercise(this.name,this._dificulty,this._date,
this._series,this._repetitions,this._restTime,this._image,this.predecessors,this.successors);

}
