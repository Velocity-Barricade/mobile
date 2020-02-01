import 'package:flutter/material.dart';

import 'Screens/HomeScreen/HomeScreen.dart';
import 'Screens/Login/LoginScreen.dart';
import 'Screens/QR/qr_helper.dart';
import 'Screens/TimeTable/TimeTableScreen.dart';
import 'Temp/card.dart';
import 'package:camera/camera.dart';


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
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "Bank App Neomorphism",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: HomeScreen(),
      ),
    );
  }
}
