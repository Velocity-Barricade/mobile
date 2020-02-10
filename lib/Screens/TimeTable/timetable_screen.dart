import 'package:barricade/Models/course_class.dart';
import 'package:barricade/Models/parsedTimetable.dart';
import 'package:barricade/Screens/TimeTable/Components/timetable.dart';
import 'package:flutter/material.dart';
import 'package:barricade/Values/colors.dart';
class TimeTableScreen extends StatefulWidget {

  ParsedTimetable TimeTable;
  TimeTableScreen({this.TimeTable});


  @override
  _TimeTableScreenState createState() => _TimeTableScreenState();
}

class _TimeTableScreenState extends State<TimeTableScreen> {
  @override
  Widget build(BuildContext context) {
    double leftPadding=18.0;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(backgroundColor: Colors.white,elevation: 0,),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left:leftPadding),
          child: new Text("Timetable",style: TextStyle(color: themeColor,fontSize: 40),),
        ),
        Expanded(child: TimeTable(timeTable: widget.TimeTable,))

      ],),
    );
  }
}
