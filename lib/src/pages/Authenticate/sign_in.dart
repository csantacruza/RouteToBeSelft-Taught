import 'package:flutter/material.dart';
import 'package:routetobeselfttaught/src/services/auth.dart';
import 'package:routetobeselfttaught/src/shared/constants.dart';
import 'package:routetobeselfttaught/src/shared/loading.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

//This variable conect wuth the auth.dart class and her methods
final AuthService _auth = AuthService();
final _formKey = GlobalKey<FormState>();
bool loading = false;
//Text field state
String email = "";
String pass = "";
String error ="";

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
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
        padding: EdgeInsets.symmetric(vertical: 10.0 ,horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 10.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
                validator: (val) => val.isEmpty? 'Enter an email' : null,
                onChanged: (val){
                  setState(() => email = val);
                }, 
              ),
              SizedBox(height: 10.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Password'),
                validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                obscureText: true,
                onChanged: (val){
                  setState(() => pass = val);
                }, 
              ),
              SizedBox(height: 10.0),
              RaisedButton(
                color: Colors.pink[400],
                child: Text(
                  'Sign in',
                  style: TextStyle(color:Colors.white),               
                ),
                onPressed: () async {
                  //Validate() use valdiator atributte of TextFormFields
                  if(_formKey.currentState.validate()){
                    setState(() => loading = true);
                    dynamic result = await _auth.signInWithEmailAndPassword(email, pass);
                    if(result == null){
                      setState(() {
                        error = "Could not sign in with those credentials";
                        loading = false;                     
                      });
                    }
                  }
                }, 
              ),
              SizedBox(height: 10.0),
              Text(error,style: TextStyle(color: Colors.red,fontSize:14.0)),
          ],)
        ),
        ),
    );
  }
}