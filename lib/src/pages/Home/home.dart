import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:routetobeselfttaught/src/pages/Home/exerciseList.dart';
import 'package:routetobeselfttaught/src/pages/Home/settings_form.dart';
import 'package:routetobeselfttaught/src/providers/exercise.dart';
import 'package:routetobeselfttaught/src/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:routetobeselfttaught/src/services/database.dart';


class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {


    void _showSettingsPanel(){
      //Show the bottoms sheets
      showModalBottomSheet(context: context, builder: (context){
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 60.0),
          child: SettingsForm(),
        );
      });
    }

    
    return StreamProvider<List<Exercise>>.value(
      value: DatabaseService().exercises,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text("Home page"),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('Logout'),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
            FlatButton.icon(
              icon: Icon(Icons.settings),
              label: Text('Settings'),
              onPressed: () => _showSettingsPanel(),
            ),
          ],
        ),
        body: ExerciseList(),
      ),
    );
  }
}
