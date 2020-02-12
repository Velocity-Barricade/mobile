import 'package:barricade/Screens/TimeTable/Components/class_card.dart';
import 'package:barricade/Screens/TimeTable/Components/timetable.dart';
import 'package:barricade/Utils/local_storage_handler.dart';
import 'package:barricade/Values/colors.dart';
import 'package:flutter/material.dart';

class FreindTimeTable extends StatefulWidget {
  @override
  _FreindTimeTableState createState() => _FreindTimeTableState();
}

class _FreindTimeTableState extends State<FreindTimeTable> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int section1 = 17;
    int section2 = 18;
    int section3 = 65;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: new IconThemeData(
          color: themeGrey,
          size: 3,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: <Widget>[
            Flexible(
              flex: section1,
              child: Column(
                children: <Widget>[
                  Expanded(
                      child: Container(
//                    color: Colors.green,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Text(
                              "Shakeeb Siddiqui",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 38,
                                  color: themeColor,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            ),
            Flexible(
              flex: section2,
              child: Column(
                children: <Widget>[
                  Expanded(
                      child: Container(
//                    color: Colors.red,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Column(
//                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: <Widget>[
                            new Text(
                              "Shakeebs Upcoming class",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Container(
                                    constraints: BoxConstraints(
                                        maxWidth:
                                            MediaQuery.of(context).size.width -
                                                40),
                                    child: new ClassCard()),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
                ],
              ),
            ),
            Flexible(
              flex: section3,
              child: Column(
                children: <Widget>[
                  Expanded(
                      child: Container(
//                    color: Colors.amber,
                    child: Column(
                      children: <Widget>[
                        Flexible(
                            flex: 17,
                            child: Container(
//                              color: Colors.green,
                              child: Column(
                                children: <Widget>[
                                  Expanded(
                                    child: Center(
                                      child: Row(
                                        children: <Widget>[
                                          new Text(
                                            "Shakeeb's TimeTable",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        Flexible(
                          flex: 83,
                          child: Container(
                            color: Colors.blue,
                            child: TimeTable(),
                          ),
                        )
                      ],
                    ),
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
