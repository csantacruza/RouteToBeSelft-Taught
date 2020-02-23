import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routetobeselfttaught/src/pages/Authenticate/authenticate.dart';
import 'package:routetobeselfttaught/src/pages/Home/home.dart';

import 'providers/user.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    //We can do this because we have the StreamProvider in the main
    final user = Provider.of<User>(context);
    //return either(ya sea, ó) the Home or Authenticate screen
    if (user == null){
      return Authenticate();
    }else{
      return Home();
    }
    
  }
}