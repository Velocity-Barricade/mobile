import 'package:barricade/Models/config.dart';
import 'package:barricade/Screens/Login/LoginServices.dart';
import 'package:barricade/Screens/Login/login_screen.dart';
import 'package:barricade/Screens/Registration/register.dart';
import 'package:barricade/Utils/connectionStatus.dart';
import 'package:barricade/Utils/local_storage_handler.dart';
import 'package:barricade/Utils/request_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'Screens./Registration/register.dart';
import 'package:camera/camera.dart';
import "package:barricade/Screens/splashScreen/splashscreen.dart";
import 'Screens/AddFriends/add_freinds_screen.dart';
import 'Screens/CompleteTimeTable/CompleteTimeTableScreen.dart';
import 'Screens/CourseAddDrop/course_add_drop_screen.dart';
import 'Screens/FriendTimeTable/friend_timetable_screen.dart';
import 'Screens/HomeScreen/home_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'Utils/local_storage_handler.dart';
import 'Utils/remote_config.dart';
import 'Utils/signin_with_google.dart';

List<CameraDescription> cameraList;

Future main() async {
//  cameraList = await availableCameras();
//  runApp(MyApp(cameralist: cameraList,));
//    SharedPreferences preferences = await SharedPreferences.getInstance();
//    StorageHandler().getInstance(prefrences: preferences);
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Bank App Neomorphism",
      debugShowCheckedModeBanner: false,
      home: StartScreen(),
    );
  }
}
