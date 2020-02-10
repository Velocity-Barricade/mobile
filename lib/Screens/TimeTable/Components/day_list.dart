import 'package:barricade/Models/course_class.dart';
import 'package:flutter/material.dart';

import 'class_card.dart';

class DayList extends StatefulWidget {
  List<CourseClass> dayList;
  DayList({this.dayList});
  @override
  _DayListState createState() => _DayListState();
}

class _DayListState extends State<DayList> {


  List<CourseClass> list;
  var padding=0.0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
      list=widget.dayList;
//    widget.
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(left: padding,right: padding,top: 48),

      itemCount: list.length,
      itemBuilder: (BuildContext context,int index){

      return ClassCard(venue: list[index].venue,
      name: list[index].name,
       time: list[index].time,
      );
    } ,
    );
  }
}
