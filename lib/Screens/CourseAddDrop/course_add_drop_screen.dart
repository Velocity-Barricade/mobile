import 'package:barricade/Screens/CourseAddDrop/Components/course_list_card.dart';
import 'package:barricade/Utils/request_manager.dart';
import 'package:barricade/Utils/signin_with_google.dart';
import 'package:barricade/Values/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:barricade/Models/course.dart';
import 'package:loader_search_bar/loader_search_bar.dart';

class ListSelected {
  static List selected = [];
}

class CourseAddDrop extends StatefulWidget {
  List<Course> sugesstion;
  CourseAddDrop({Key key, @required this.sugesstion}) : super(key: key) {}
  @override
  _CourseAddDropState createState() => _CourseAddDropState(sugesstion);
}

class _CourseAddDropState extends State<CourseAddDrop> {
  int flexSearch = 20;
  int flexCourseList = 80;
  List<Course> sugesstion;
  _CourseAddDropState(this.sugesstion);

  List filterPersonsByQuery(String query) {
//    print(sugesstion);
    return sugesstion
        .where((courseQuery) =>
            courseQuery.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  Widget buildPersonRow(dynamic course) {
//    print(course.name);
    return Container(
      color: Colors.white,
      child: Column(
        children: [CourseListCard(course: course)],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    RequestManager().getCourses();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
//          await signInWithGoogle();
//          todo add loader screen
          //todo solve flicker on add drop
          //  Shakeeb List of Selected Courseswe

          List<Map<String, String>> list = [];
          for (var i in ListSelected.selected) {
            list.add({"id": i.id.toString(), "name": i.name});
            print("qwertyui");
          }
          RequestManager().updateCourselist(list);
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
          iconTheme: new IconThemeData(
            color: themeGrey,
            size: 3,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20),
        child: Container(
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Flexible(
                    flex: 15,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                            child: Row(
                          children: <Widget>[
                            Container(
                                child: new Text(
                              "Available Courses",
                              style: TextStyle(color: themeColor, fontSize: 32),
                            )),
                          ],
                        )),
                      ],
                    )),
                Flexible(
                    flex: 85,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                            child: Container(
                          child: ListView.builder(
                              itemCount: sugesstion.length,
                              itemBuilder: (context, index) {
                                return CourseListCard(
                                  course: sugesstion[index],
                                );
                              }),
                        )),
                      ],
                    )),
              ],
            )),
      ),
    );
  }
}
