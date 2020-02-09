import 'package:flutter/material.dart';
import 'package:barricade/Screens/FriendTimeTable/friend_timetable_screen.dart';
import 'package:barricade/Screens/TimeTable/timetable_screen.dart';
import 'package:barricade/Screens/CourseAddDrop/course_add_drop_screen.dart';
import 'package:barricade/Screens/Drawer/Components/DrawerComponent.dart';
import 'package:barricade/Models/course.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerComponent(
            name: "TimeTableScreen",
            child: TimeTableScreen(),
            trail: Icon(Icons.people),
          ),
          DrawerComponent(
            name: "FreindTimeTable",
            child: FreindTimeTable(),
            trail: Icon(Icons.people),
          ),
          DrawerComponent(
            name: "CourseAddDrop",
            child: CourseAddDrop(
              sugesstion: [
                Course(name: "name1", id: 778),
                Course(name: "name3", id: 778),
                Course(name: "name2", id: 778),
                Course(name: "name4", id: 778),
                Course(name: "name5", id: 778),
                Course(name: "name6", id: 778),
                Course(name: "name7", id: 778),
                Course(name: "name8", id: 778),
              ],
            ),
            trail: Icon(Icons.people),
          ),
        ],
      ),
    );
  }
}