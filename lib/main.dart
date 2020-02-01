import 'package:barricade/Screens/Login/LoginServices.dart';
import 'package:flutter/material.dart';

import 'Screens./Registration/register.dart';
import 'Screens/QR/qr_helper.dart';
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
        floatingActionButton: FloatingActionButton(onPressed: () async {
          print("usama");
          print(await signIn("k180154hjjhkhkhk@nu.edu.pk" , "123412341234"));
        }),
        body: Registeration(),
      ),
    );
  }
}
