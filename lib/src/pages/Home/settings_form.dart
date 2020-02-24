import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routetobeselfttaught/src/providers/user.dart';
import 'package:routetobeselfttaught/src/services/database.dart';
import 'package:routetobeselfttaught/src/shared/constants.dart';
import 'package:routetobeselfttaught/src/shared/loading.dart';

class SettingsForm extends StatefulWidget {
  SettingsForm({Key key}) : super(key: key);

  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<int> series = [3, 4, 5, 6];
  final List<int> repetitions = [8, 10, 12, 13, 14, 15, 16];

  String _currentName;
  int _currentSeries;
  int _currentRepetitions;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return StreamBuilder(
        stream: DatabaseService(uid: user.uid).userData,
        //this snapshot is not the firebase snapshot,
        // this is the data in the stream
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;

            return Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Text('Update yor exercise settings',
                      style: TextStyle(fontSize: 18.0)),
                  SizedBox(height: 5.0),
                  TextFormField(
                    initialValue: userData.name,
                    decoration: textInputDecoration,
                    validator: (val) =>
                        val.isEmpty ? 'Please enter the name' : null,
                    onChanged: (val) => setState(() => _currentName = val),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  //dropdown
                  DropdownButtonFormField(
                    decoration: textInputDecoration,
                    value: _currentSeries ?? userData.series,
                    items: series.map((serie) {
                      return DropdownMenuItem(
                        value: serie,
                        child: Text('${serie.toString()} series'),
                      );
                    }).toList(),
                    onChanged: (val) => setState(() => _currentSeries = val),
                  ),
                  //slider
                  Slider(
                    value: (_currentRepetitions ?? userData.repetitions)
                        .toDouble(),
                    activeColor: Colors.brown[400],
                    inactiveColor: Colors.brown[100],
                    min: 8.0,
                    max: 20.0,
                    divisions: 6,
                    onChanged: (val) =>
                        setState(() => _currentRepetitions = val.round()),
                  ),

                  RaisedButton(
                    color: Colors.pink[400],
                    child: Text(
                      'Update',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        await DatabaseService(uid: user.uid).updateUserData(
                            _currentName ?? userData.name,
                            _currentSeries ?? userData.series,
                            _currentRepetitions ?? userData.repetitions,
                            1 ?? 1,
                            Timestamp.now(),
                            false);
                      }
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
