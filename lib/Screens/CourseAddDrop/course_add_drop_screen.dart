import 'package:barricade/Screens/CourseAddDrop/Components/course_list_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loader_search_bar/loader_search_bar.dart';

class CourseAddDrop extends StatefulWidget {
  List sugesstion;
  CourseAddDrop({Key key, @required this.sugesstion}) : super(key: key);
  @override
  _CourseAddDropState createState() => _CourseAddDropState(sugesstion);
}

class _CourseAddDropState extends State<CourseAddDrop> {
  int flexSearch = 20;
  int flexCourseList = 80;
  List sugesstion;
  _CourseAddDropState(this.sugesstion);

  List filterPersonsByQuery(String query) {
    print(sugesstion);
    return sugesstion
        .where((courseQuery) =>
            courseQuery.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  Widget buildPersonRow(var course) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [CourseListCard()],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
