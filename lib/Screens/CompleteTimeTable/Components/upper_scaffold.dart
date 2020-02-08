import 'package:barricade/Screens/CompleteTimeTable/Components/upper_scaffold_body_tab_bar_view.dart';
import 'package:barricade/Screens/TimeTable/Components/custom_tab_indicator.dart';
import 'package:barricade/Values/colors.dart';
import 'package:flutter/material.dart';


class UpperScaffold extends StatefulWidget {
  var completeTimeTable;
  UpperScaffold({this.completeTimeTable});
  @override
  _UpperScaffoldState createState() => _UpperScaffoldState();
}

class _UpperScaffoldState extends State<UpperScaffold> {
 var leftPadding =18.0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar:new PreferredSize(
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
        body: new UpperScafoldTabBarView(timeTable: widget.completeTimeTable,),
      ),
    );
  }
}
