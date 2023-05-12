import 'dart:html';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
    static String tag="Home-page";
  @override

  Widget build(BuildContext context) {
    final alucard=Hero(
      tag: "hero",
       child: Padding(
          padding: EdgeInsets.all(16),
          child: CircleAvatar(
            radius: 72,
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage('assets/alucard.jpg'),
          ),

       ));
       final welcome =Padding(
          padding: EdgeInsets.all(8),
          child: Text("Welcome Alucard",style: TextStyle(fontSize: 29,color: Colors.white),),
          

       );
       final randomText=Padding(
          padding: EdgeInsets.all(8),
          child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum"
          ,style: TextStyle(fontSize: 29,color: Colors.white),),
          

       );
       final body=Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(28),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors:[Colors.blue,Colors.lightBlue] ,
            
            )
        ),
            child: Column(
              children: [
                alucard,
                welcome,
                randomText,

              ],),
        );
    return Scaffold(
      body: body,
    );
  }
}