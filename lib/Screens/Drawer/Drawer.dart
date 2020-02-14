import 'dart:convert';

import 'package:barricade/Models/config.dart';
import 'package:barricade/Models/parsedTimetable.dart';
import 'package:barricade/Screens/AddFriends/add_freinds_screen.dart';
import 'package:barricade/Screens/splashScreen/splashscreen.dart';
import 'package:barricade/Utils/connectionStatus.dart';
import 'package:barricade/Utils/local_storage_handler.dart';
import 'package:barricade/Utils/request_manager.dart';
import 'package:barricade/Utils/signin_with_google.dart';
import 'package:barricade/Utils/validators.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:barricade/Screens/FriendTimeTable/friend_timetable_screen.dart';
import 'package:barricade/Screens/TimeTable/timetable_screen.dart';
import "package:barricade/Screens/CourseAddDrop/course_add_drop_screen.dart";
import 'package:barricade/Screens/Drawer/Components/DrawerComponent.dart';
import 'package:barricade/Models/course.dart';
import 'package:barricade/Screens/FriendsList/friend_list.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  List<Course> a = [];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerComponent(
            name: "TimeTableScreen",
            child: TimeTableScreen(
                TimeTable: ParsedTimetable.fromJson(
              json.decode(
                  StorageHandler().getValue("shakeebsiddiqui1998@gmail.com")),
            )),
            trail: Icon(Icons.people),
          ),
//          DrawerComponent(
//            name: "FreindTimeTable",
//            child: FreindTimeTable(),
//            trail: Icon(Icons.people),
//          ),

          InkWell(
              onTap: () async {
                if (await checkConnectionStatus()) {
//                  todo add loader
//                 var map = await RequestManager().getCourses();
                  List<dynamic> list = await RequestManager().getCourses();
                  for (dynamic i in list) {
                    a.add(Course(id: i['id'], name: i['name']));
                  }

                  Widget course = CourseAddDrop(
                    sugesstion: a,
                  );
                  print("addding courses");
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) => course));
                } else {
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text("Needs Internet")));
                }
              },
              child: ListTile(
                title: new Text("Course Add Drop"),
              )),
          DrawerComponent(
            name: "Add friends",
            child: AddFriendsScreen(),
            trail: Icon(Icons.people),
          ),
          ListTile(
            title: Text("Log Out"),
            leading: Icon(Icons.exit_to_app),
            onTap: () {
              StorageHandler.preferences.clear();
              signOutGoogle();
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => StartScreen()));
            },
          )
        ],
      ),
    );
  }
}
