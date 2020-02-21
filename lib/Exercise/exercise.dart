class Exercise {

String name;
int dificulty;
Repetitions repetitions;
int series;
String image;
Time restTime;
Date date;
List<Exercise> predecessors;
List<Exercise> successors;

Exercise(){
}


}

class Date {
  DateTime date = new DateTime.now().toLocal();
  // date = new DateTime(date.year; )date.toLocal();
}

class Time {
  //if you try [Hypertrophy] you need 30sec - 1min of restTime
  //if you try [Strength] you need 1min - 2,3 min of restTime
  bool hypertrophy;
  int value;
}

class Repetitions {
  //if you try [Static] you $value will be in seconds
  //if you try [Quantity] you $value will be in numbers
  bool time;
  int value;
}