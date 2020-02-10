import 'package:flutter/material.dart';
import 'package:barricade/Screens/CourseAddDrop/course_add_drop_screen.dart';
import "package:barricade/Values/colors.dart";

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
//      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20))),
      height: 70,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
//        color: themeColor,
        child: Container(
          decoration: BoxDecoration(
            
            gradient: LinearGradient(begin: Alignment.topLeft,end: Alignment.bottomRight,colors: [themeColor,themeSecondary])
          ,borderRadius: BorderRadius.all(Radius.circular(8))
          ),

          child: ListTile(
            title: Text(
              widget.course.name,
              style: DefaultTextStyle.of(context)
                  .style
                  .apply(fontSizeFactor: 1.8, color: Colors.white),
            ),
            trailing: Checkbox(
              value: selectvalue,
              onChanged: (bool value) {
                if (!value && selectvalue)
                  ListSelected.selected.remove(widget.course);
                else if (value && !selectvalue)
                  ListSelected.selected.add(widget.course);
//              print(ListSelected.selected);
                setState(() {
                  selectvalue = value;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
