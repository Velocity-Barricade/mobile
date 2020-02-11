import 'package:barricade/Models/course.dart';
import 'package:barricade/Screens/HomeScreen/home_screen.dart';
import 'package:barricade/Utils/connectionStatus.dart';
import 'package:barricade/Utils/local_storage_handler.dart';
import 'package:barricade/Utils/remote_config.dart';
import 'package:barricade/Utils/request_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:barricade/Screens/CourseAddDrop/course_add_drop_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StartScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StartScreenState();
  }
}

class StartScreenState extends State<StartScreen> {
  String timetable;
  bool isSignedIn = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    initializeApp().then((isInitialized) {
      FirebaseAuth.instance.onAuthStateChanged.first.then((user) {
        if (user != null) {
          print("signed");
          print(user.email);

          RequestManager().getClasses(email: user.email).then((isFetched) {
            this.timetable = StorageHandler().getValue(user.email);
          });
        } else {
          isSignedIn = false;
          print("not signed");
        }
      });
    });
  }

  initializeApp() async {
    await StorageHandler.initialize();
    await fetchRemoteConfig();
    await RequestManager().getClasses(email: "shakeebsiddiqui1998@gmail.com");
    return true;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SplashScreen.navigate(
        name: 'assets/splashScreen.flr',
        next: (isSignedIn) ? HomeScreen() : Container(),
        until: () => Future.delayed(Duration(seconds: 3)),
        startAnimation: '1',
        backgroundColor: Colors.white,
      ),
    );
  }
}
