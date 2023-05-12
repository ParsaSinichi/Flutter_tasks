import 'dart:js';

import 'package:flutter/material.dart';
import 'loginPage.dart';
import 'homePage.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  // This widget is the root of your application.
  final route=<String,WidgetBuilder>{
      LoginPage.tag:(context)=>LoginPage(),
      HomePage.tag:(context)=>HomePage(),
  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.lightBlue,
          fontFamily:'Nunito',

      ),
      home: LoginPage(),
      routes: route,
    );
  }
}

