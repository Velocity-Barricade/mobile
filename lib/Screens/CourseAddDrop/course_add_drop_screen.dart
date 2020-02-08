import 'package:barricade/Screens/CourseAddDrop/Components/course_list_card.dart';
import 'package:flutter/material.dart';
import 'package:barricade/Models/course.dart';
import 'package:loader_search_bar/loader_search_bar.dart';

class ListSelected {
  static List selected = [];
}

class CourseAddDrop extends StatefulWidget {
  List<Course> sugesstion;
  CourseAddDrop({Key key, @required this.sugesstion}) : super(key: key);
  @override
  _CourseAddDropState createState() => _CourseAddDropState(sugesstion);
}

class _CourseAddDropState extends State<CourseAddDrop> {
  int flexSearch = 20;
  int flexCourseList = 80;
  List<Course> sugesstion;
  _CourseAddDropState(this.sugesstion);

  List filterPersonsByQuery(String query) {
    print(sugesstion);
    return sugesstion
        .where((courseQuery) =>
            courseQuery.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  Widget buildPersonRow(dynamic course) {
    print(course.name);
    return Container(
      color: Colors.white,
      child: Column(
        children: [CourseListCard(course: course)],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //  Shakeeb List of Selected Courses
          for (var i in ListSelected.selected) {
            print(i.name);
          }
        },
        child: Text("OK"),
      ),
      appBar: new SearchBar(
        loader: QuerySetLoader(
          querySetCall: filterPersonsByQuery,
          itemBuilder: buildPersonRow,
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
          child: ListView.builder(
              itemCount: sugesstion.length,
              itemBuilder: (context, index) {
                return CourseListCard(
                  course: sugesstion[index],
                );
              })),
    );
  }
}
