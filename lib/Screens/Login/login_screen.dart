import 'package:barricade/Screens/Login/Components/login_form.dart';
import 'package:flutter/material.dart';

import 'Components/hi.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("assets/fast.jfif"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              LoginForm(),
              Positioned(
//
                  top: 0,
//                  alignment: Alignment.topCenter,
                  child: Hi()),
              Positioned(
                bottom: 25,
                child: new Text(
                  "Forgot your password?",
                  style: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
