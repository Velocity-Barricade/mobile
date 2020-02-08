import 'package:barricade/Screens/CourseAddDrop/Components/course_list_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loader_search_bar/loader_search_bar.dart';

class CourseAddDrop extends StatefulWidget {
  @override
  _CourseAddDropState createState() => _CourseAddDropState();
}

class _CourseAddDropState extends State<CourseAddDrop> {
  int flexSearch = 20;
  int flexCourseList = 80;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new SearchBar(
        loader: QuerySetLoader(
          querySetCall: null,
          itemBuilder: null,
          loadOnEachChange: true,
          animateChanges: true,
        ),
        attrs: SearchBarAttrs(),
//      overlayStyle: SystemUiOverlayStyle(),
        defaultBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
        ),
      ),
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            CourseListCard(),
          ],
        ),
      ),
    );
  }
}
