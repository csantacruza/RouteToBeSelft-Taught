import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routetobeselfttaught/src/pages/Home/exercise_tile.dart';
import 'package:routetobeselfttaught/src/providers/exercise.dart';

class ExerciseList extends StatefulWidget {

  @override
  _ExerciseListState createState() => _ExerciseListState();
}

class _ExerciseListState extends State<ExerciseList> {
  @override
  Widget build(BuildContext context) {


    final exercises = Provider.of<List<Exercise>>(context);
  
    return ListView.builder(
      itemCount: exercises.length,
      itemBuilder: ((context,index){
        return ExerciseTile(exercise: exercises[index]);
      }));
  }
}
