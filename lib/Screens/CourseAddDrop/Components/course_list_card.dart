import 'package:flutter/material.dart';

class CourseListCard extends StatefulWidget {
  @override
  _CourseListCardState createState() => _CourseListCardState();
}

class _CourseListCardState extends State<CourseListCard> {
  bool selectvalue = true;
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Container(
        height: 70,
        child: Opacity(
          opacity: 0.8,
          child: Center(
            child: Card(
                elevation: 8,
                child: Center(
                  child: Wrap(
                    direction: Axis.vertical,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                    child: Row(children: <Widget>[
                                  Text(
                                    "Teacher Name :",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 18),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Container(
                                      width: 150,
                                      child: Text(
                                        "subject : ",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Center(
                                      child: Checkbox(
                                    value: selectvalue,
                                    onChanged: (bool value) {
                                      setState(() {
                                        selectvalue = value;
                                      });
                                    },
                                  )),
                                ])),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
