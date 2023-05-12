import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login/homePage.dart';

class LoginPage extends StatefulWidget {

  static String tag='login_page';
  

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final logo=Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor:Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/logo.png'),
        
          ),

    );
    final email=TextFormField(
      keyboardType: TextInputType.emailAddress ,
      autofocus: false,
      initialValue: "Please enter your email",
      decoration: InputDecoration(
          hintText: "Email",
          contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0))

      ),

    );
        final password=TextFormField(
      autofocus: false,
      initialValue: "Please enter your password",
      obscureText: true,
      decoration: InputDecoration(
          hintText: "Password",
          contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0))

      ),

    );
    final loginButton=Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Material(
            borderRadius: BorderRadius.circular(30),
            shadowColor: Colors.lightBlueAccent.shade100,
            elevation: 5,
            child: MaterialButton(
              minWidth: 200,
              height: 42,
              onPressed: (){
                  Navigator.of(context).pushNamed(HomePage.tag);
              },
              color: Colors.lightBlueAccent,
              child: Text("Login",style: TextStyle(color: Colors.white)),
            ),

        ),

    );
    final forgotLabel=TextButton(
      onPressed: (){}, 
      child: Text("Forgot password?",style: TextStyle(color: Colors.black54),),);
    return  Scaffold(
        backgroundColor: Colors.white,
        body: Center(

          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 24,right: 24),
            children: [
              logo,
              SizedBox(height: 48),
              email,
              SizedBox(height: 8),
              password,
              SizedBox(height: 24),
              loginButton,
              forgotLabel
            ],


          ),
        ),


    );
  }
}