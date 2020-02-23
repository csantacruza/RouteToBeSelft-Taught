import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routetobeselfttaught/src/pages/Home/home.dart';
import 'package:routetobeselfttaught/src/services/auth.dart';
import 'package:routetobeselfttaught/src/wrapper.dart';

import 'src/providers/user.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}