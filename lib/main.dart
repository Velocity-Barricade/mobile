import 'package:barricade/Screens/Login/LoginServices.dart';
import 'package:flutter/material.dart';
import 'Screens./Registration/register.dart';
import 'Screens./Login/login_screen.dart';
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
  AuthUser authFunc =  new AuthUser();
  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      title: "Bank App Neomorphism",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton: FloatingActionButton (onPressed: () async {
          print("usama");
          await authFunc.signIn("k180194@nu.edu.pk", "qwerty") ;
          print(await authFunc.isVarified());
        },) ,
        body: LoginScreen(),
      ),
    );
  }
}
