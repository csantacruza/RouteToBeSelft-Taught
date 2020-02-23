import 'package:flutter/material.dart';
import 'package:routetobeselfttaught/src/shared/constants.dart';

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
  String _currentTypeBlindness;
  int _currentSeries;
  int _currentRepetitions;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Text('Update yor exercise settings',
              style: TextStyle(fontSize: 18.0)),
          SizedBox(height: 10.0),
          TextFormField(
            decoration: textInputDecoration,
            validator: (val) => val.isEmpty ? 'Please enter the name' : null,
            onChanged: (val) => setState(() => _currentName = val),
          ),
          SizedBox(
            height: 10.0,
          ),
          //dropdown
          DropdownButtonFormField(
            decoration: textInputDecoration,
            value: _currentSeries ?? 3,
            items: series.map((serie) {
              return DropdownMenuItem(
                value: serie, 
                child: Text('${serie.toString()} series'),
              );
            }).toList(), onChanged: (val) => setState(() => _currentSeries = val),
          ),
          //slider
          Slider(
            value: (_currentRepetitions ?? 8).toDouble(),
            activeColor: Colors.brown[400],
            inactiveColor: Colors.brown[100],
            min: 8.0,
            max: 20.0,
            divisions: 6,
            onChanged: (val) => setState(()=>_currentRepetitions = val.round()),

          ),

          RaisedButton(
            color: Colors.pink[400],
            child: Text(
              'Update',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () async {
              print(_currentName);
              print(_currentSeries);
              print(_currentRepetitions);

            },
          ),
        ],
      ),
    );
  }
}
