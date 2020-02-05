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
      length: 6,

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
                  Container(
                    height: 40,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(color: Colors.white,width: 100,height: 0,),
                        new TabBar(
                          isScrollable: true,

                          indicator: CustomTabIndicator(),
                          unselectedLabelColor: themeGrey,
//                    labelPadding: EdgeInsets.only(left: 0),
                          tabs: [

                            new Text("Mon",style: TextStyle(fontSize: 18),)
                            , new Text("Tue",style: TextStyle(fontSize: 18),)
                            , new Text("Wed",style: TextStyle(fontSize: 18),)
                            , new Text("Thu",style: TextStyle(fontSize: 18),)
                            , new Text("Fri",style: TextStyle(fontSize: 18),)
                            , new Text("Sat",style: TextStyle(fontSize: 18),)


                          ],
                        ),
                        Container(color: Colors.white,width: 100,height: 0,),

                      ],
                    ),
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
            new DayList(),

          ],
        ),
      )
    );
  }
}
