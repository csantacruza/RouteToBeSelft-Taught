class Time {
  //if you try [Hypertrophy] you need 30sec - 1min of restTime
  //if you try [Strength] you need 1min - 2,3 min of restTime
  bool hypertrophy;
  int hours;
  int minutes;
  int seconds;

  Time.exercise({this.hypertrophy,this.hours,this.minutes,this.seconds});
  Time.programming({this.hours,this.minutes,this.seconds});
}

class Date {

int day;
int mounth;
int year;

Date({this.day,this.mounth,this.year});

}