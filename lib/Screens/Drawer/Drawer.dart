import 'package:flutter/material.dart';
import 'package:barricade/Screens/FriendTimeTable/friend_timetable_screen.dart';
import 'package:barricade/Screens/TimeTable/timetable_screen.dart';
import 'package:barricade/Screens/CourseAddDrop/course_add_drop_screen.dart';

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
            child: CourseAddDrop(),
            trail: Icon(Icons.people),
          ),
        ],
      ),
    );
  }
}

class DrawerComponent extends StatefulWidget {
  String name;
  Widget child;
  Widget trail;
  DrawerComponent(
      {@required this.name, @required this.child, @required this.trail});

  @override
  State createState() => _ZDrawerItemsState();
}

class _ZDrawerItemsState extends State<DrawerComponent> {
  Divider divider = new Divider(
    height: 15,
  );

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        InkWell(
            onTap: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => widget.child));
            },
            child: ListTile(
              leading: widget.trail,
              title: new Text(widget.name),
            )),
        divider,
      ],
    );
  }
}
