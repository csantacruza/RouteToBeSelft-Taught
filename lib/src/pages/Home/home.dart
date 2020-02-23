import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:routetobeselfttaught/src/services/auth.dart';

class Home extends StatelessWidget{

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.brown[50],
      appBar: AppBar(title: Text("Home page"),
      backgroundColor: Colors.brown[400],
      elevation: 0.0,
      actions: <Widget>[
        FlatButton.icon(icon: Icon(Icons.person),
        label: Text('Logout'),
        onPressed: () async{
          await _auth.signOut();
        },
        ),
        ],
      ),
      body: Center(child: Text("Text center"),
      ),
    );
  }

}