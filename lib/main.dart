import 'package:barricade/Screens/Login/LoginServices.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Screens./Registration/register.dart';
import 'package:camera/camera.dart';

import 'Screens/CourseAddDrop/course_add_drop_screen.dart';
import 'Screens/HomeScreen/home_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'Utils/signin_with_google.dart';


List<CameraDescription> cameraList;

Future main()
async {
//  cameraList = await availableCameras();
//  runApp(MyApp(cameralist: cameraList,));
    runApp(MyApp());
}
class MyApp extends StatefulWidget {
//  var cameralist;
//  MyApp({this.cameralist}){
//  }


  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AuthUser authFunc =  new AuthUser();
  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      title: "Bank App Neomorphism",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
//<<<<<<< Updated upstream
        body: Registeration(),
//=======
        floatingActionButton: FloatingActionButton (onPressed: () async {
          FirebaseUser user = await signInWithGoogle();
          print(user.email);
          print((await user.getIdToken()).token);
          print(user.uid);

          String token = (await user.getIdToken()).token;
          while (token.length > 0) {
            int initLength = (token.length >= 500 ? 500 : token.length);
            print(token.substring(0, initLength));
            int endLength = token.length;
            token = token.substring(initLength, endLength);

          }
         },)
//        body: CourseAddDrop(),
//>>>>>>> Stashed changes
      ),
    );
  }
}
