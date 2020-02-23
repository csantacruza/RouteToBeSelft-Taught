import 'package:routetobeselfttaught/src/providers/Generic/activity.dart';
import 'package:routetobeselfttaught/src/providers/step.dart';

class ImaAndCre implements Activity<Step>{

String name;
List<Step> predecessors;
List<Step> successors;
bool cloned;
String description;
List<String> funtionalities;
List<Step> steps;

ImaAndCre(this.cloned,this.description,this.funtionalities,this.steps); 

}