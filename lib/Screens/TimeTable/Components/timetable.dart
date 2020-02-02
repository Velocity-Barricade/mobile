import 'package:barricade/Values/colors.dart';
import 'package:flutter/material.dart';

import 'custom_tab_indicator.dart';
import 'day_list.dart';



class TimeTable extends StatefulWidget {
  @override
  _TimeTableState createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  @override
  Widget build(BuildContext context) {
    var leftPadding=0.0;
    return DefaultTabController(
      length: 5,

      child: Scaffold(
        backgroundColor: Colors.white,

        appBar: new PreferredSize(
          preferredSize: Size.fromHeight(46),
          child: new Container(
            color: Colors.white,
            child: Padding(
              padding:  EdgeInsets.only(left:leftPadding,right: leftPadding),
              child: Column(
                children: <Widget>[
                  new Expanded(child: new Container()),
                  new TabBar(
                    //isScrollable: true,

                    indicator: CustomTabIndicator(),
                    unselectedLabelColor: themeGrey,
                    tabs: [Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: new Text("Mon"),
                    )
                      , new Text("Tue")
                      , new Text("Wed")
                      , new Text("Thu")
                      , new Text("Fri")


                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        body: new TabBarView(
          children: <Widget>[
            new DayList(),
            new DayList(),
            new DayList(),
            new DayList(),
            new DayList(),

          ],
        ),
      )
    );
  }
}
