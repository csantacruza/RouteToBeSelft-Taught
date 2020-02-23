import 'package:flutter/material.dart';
import 'package:routetobeselfttaught/src/services/auth.dart';
class Register extends StatefulWidget {

   final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

//This variable conect wuth the auth.dart class and her methods
final AuthService _auth = AuthService();
final _formKey = GlobalKey<FormState>();
  //Text field state
String email = "";
String pass = "";
String error ="";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text("Register"),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text("Sign In"),
            onPressed: (){
              widget.toggleView();
            },
            ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 15.0 ,horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 10.0),
              TextFormField(
                validator: (val) => val.isEmpty? 'Enter an email' : null,
                onChanged: (val){
                  setState(() => email = val);
                }, 
              ),
              SizedBox(height: 10.0),
              TextFormField(
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
                  'Register',
                  style: TextStyle(color:Colors.white),               
                ),
                onPressed: () async {
                  //Validate() use valdiator atributte of TextFormFields
                  if(_formKey.currentState.validate()){
                    dynamic result = await _auth.registerWithEmailAndPassword(email, pass);
                    if(result == null){
                      setState(() => error = "Please supply a valid email");
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