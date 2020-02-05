import 'package:barricade/Models/config.dart';
import 'package:barricade/Screens/Login/LoginServices.dart';
import 'package:barricade/Screens/Login/login_screen.dart';
import 'package:barricade/Screens/Registration/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'Screens./Registration/register.dart';
import 'package:camera/camera.dart';

import 'Screens/CourseAddDrop/course_add_drop_screen.dart';
import 'Screens/FriendTimeTable/friend_timetable_screen.dart';
import 'Screens/HomeScreen/home_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'Utils/local_storage_handler.dart';
import 'Utils/remote_config.dart';
import 'Utils/signin_with_google.dart';


List<CameraDescription> cameraList;

Future main()
async {
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
  AuthUser authFunc =  new AuthUser();
  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      title: "Bank App Neomorphism",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Test(),
        floatingActionButton: FloatingActionButton (onPressed: () async {
//          print('here');

         },)

      ),
    );
  }
}

//FirebaseUser user = await signInWithGoogle();
//print(user.email);
//print((await user.getIdToken()).token);
//print(user.uid);
//String token = (await user.getIdToken()).token;
//while (token.length > 0) {
//int initLength = (token.length >= 500 ? 500 : token.length);
//print(token.substring(0, initLength));
//int endLength = token.length;
//token = token.substring(initLength, endLength);
//
//}

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchRemoteConfig().then((val){
      SharedPreferences.getInstance().then((prefs){
        StorageHandler().getInstance(prefrences: prefs);
        print('done');

      });
//      Config.
    });
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: new RaisedButton(onPressed: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FreindTimeTable()),
        );
      }),
    );
  }
}
