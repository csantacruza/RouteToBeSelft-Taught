import 'package:flutter/material.dart';
import 'package:routetobeselfttaught/src/services/auth.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

//This variable conect wuth the auth.dart class and her methods
final AuthService _auth = AuthService();

//Text field state
String email = "";
String pass = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text("Sing in"),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text("Register"),
            onPressed: (){
              widget.toggleView();
            },
            ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0 ,horizontal: 50.0),
        child: Form(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                onChanged: (val){
                  setState(() => email = val);
                }, 
              ),
              SizedBox(height: 20.0),
              TextFormField(
                obscureText: true,
                onChanged: (val){
                  setState(() => pass = val);
                }, 
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.pink[400],
                child: Text(
                  'Sign in',
                  style: TextStyle(color:Colors.white),               
                ),
                onPressed: () async {
                  print('$email $pass');
                },
              ),
          ],)
        ),
        ),
    );
  }
}