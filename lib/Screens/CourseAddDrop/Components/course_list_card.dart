import 'package:flutter/material.dart';
import 'package:barricade/Screens/CourseAddDrop/course_add_drop_screen.dart';

class CourseListCard extends StatefulWidget {
  var course;

  CourseListCard({this.course});
  @override
  _CourseListCardState createState() => _CourseListCardState();
}

class _CourseListCardState extends State<CourseListCard> {
  bool selectvalue = false;
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 70,
      child: ListTile(
        title: Text(
          widget.course.name,
          style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 1.8),
        ),
        trailing: Checkbox(
          value: selectvalue,
          onChanged: (bool value) {
            if (!value && selectvalue)
              ListSelected.selected.remove(widget.course);
            else if (value && !selectvalue)
              ListSelected.selected.add(widget.course);
            print(ListSelected.selected);
            setState(() {
              selectvalue = value;
            });
          },
        ),
      ),
    );
  }
}
