import 'package:flutter/material.dart';

import 'Screens/QR/qr_helper.dart';
import 'Temp/card.dart';
import 'Temp/login_dart.dart';
import 'package:camera/camera.dart';


List<CameraDescription> cameraList;

Future main()
async {
  cameraList = await availableCameras();
  runApp(MyApp(cameralist: cameraList,));
}
class MyApp extends StatefulWidget {
  var cameralist;
  MyApp({this.cameralist}){
  }

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
        body: QRTest(cameras: widget.cameralist,),
      ),
    );
  }
}
