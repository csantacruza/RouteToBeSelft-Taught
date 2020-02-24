import 'package:flutter/material.dart';
import 'package:routetobeselfttaught/src/providers/exercise.dart';

class ExerciseTile extends StatelessWidget {

  final Exercise exercise;
  ExerciseTile({this.exercise});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top:8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/default_exercise.png'),
            radius: 25.0,
            backgroundColor: Colors.brown[100],
          ),
          title: Text(exercise.name),
          subtitle: Text('Takes ${exercise.series} series with ${exercise.repetitions} repetitions'),
        ),
      ),
    );
  }
}