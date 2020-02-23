import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routetobeselfttaught/src/providers/exercise.dart';

class ExerciseList extends StatefulWidget {

  @override
  _ExerciseListState createState() => _ExerciseListState();
}

class _ExerciseListState extends State<ExerciseList> {
  @override
  Widget build(BuildContext context) {


    final exercises = Provider.of<List<Exercise>>(context);
    if(exercises != null){
    exercises.forEach((exercise) {
      print(exercise.name);
      print(exercise.dificulty);
      print(exercise.date);
      print(exercise.series);
      print(exercise.repetitions);
    });
    }else{
      print('exercisesList.dart - exercises = $exercises');
    }
    return Container();
  }
}
