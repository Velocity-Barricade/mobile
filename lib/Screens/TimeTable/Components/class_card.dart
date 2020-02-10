import 'dart:convert';

import 'package:barricade/Models/course_class.dart';
import 'package:barricade/Models/parsedTimetable.dart';
import 'package:barricade/Utils/local_storage_handler.dart';
import 'package:barricade/Values/colors.dart';
import 'package:flutter/material.dart';


class ClassCard extends StatefulWidget {
  bool upcoming;
  CourseClass upcomingClass;
  String email;
  String venue,name, time;
  ClassCard({this.upcoming=false,this.name,this.venue,this.time}){
    if(upcoming){
      ParsedTimetable time=ParsedTimetable.fromJson(json.decode(StorageHandler().getValue("shakeebsiddiqui1998@gmail.com")));
      upcomingClass =time.getUpcomingClass();
    }
  }
  @override
  _ClassCardState createState() => _ClassCardState();
}

class _ClassCardState extends State<ClassCard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

//todo add logic if upcoming class changes whiles user is on screen
  }
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(bottom:0.0),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(17))),
//        color: themeColor,
        child: Container(
          decoration: BoxDecoration(gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [themeColor,themeSecondary],

          ),
            borderRadius: BorderRadius.all(Radius.circular(12))
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(

              leading: Padding(
                padding:  EdgeInsets.only(left:20.0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Text("${(widget.upcomingClass!=null)?widget.upcomingClass.venue:widget.venue}",
                      style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),
                    ),
                    new Text("ISPM",
                      style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w300),

                    ),
                  ],
                ),
              ),
              title: Padding(
                padding:  EdgeInsets.only(left:28.0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text((widget.upcomingClass!=null)?widget.upcomingClass.time:widget.time,
                    style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),

                  ),
                  new Text((widget.upcomingClass!=null)?widget.upcomingClass.name:widget.name,
                    style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w300),

                  )
      ],
                ),
              ),
          ),
      ),
        )
      ),
    );
  }
}
