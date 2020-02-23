import 'package:routetobeselfttaught/src/providers/Generic/activity.dart';
import 'package:routetobeselfttaught/src/providers/Generic/time.dart';

class Step implements Activity<Step>{

String image;
String name;
int dificulty;
String description;
List<String> previousKnowledge;
List<String> knowledgeYouWillLearn;
Time time;
List<Step> predecessors;
List<Step> successors;

Step(this.name,this.dificulty,this.description,
this.image,this.knowledgeYouWillLearn,this.predecessors,
this.previousKnowledge,this.successors,this.time);

}
