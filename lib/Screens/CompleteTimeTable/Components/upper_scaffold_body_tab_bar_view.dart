import 'package:barricade/Screens/TimeTable/Components/class_card.dart';
import 'package:barricade/Screens/TimeTable/Components/custom_tab_indicator.dart';
import 'package:barricade/Values/colors.dart';
import 'package:flutter/material.dart';


class UpperScafoldTabBarView extends StatefulWidget {
  var timeTable;
  UpperScafoldTabBarView({this.timeTable}){
//    print();
  }
  @override
  _UpperScafoldTabBarViewState createState() => _UpperScafoldTabBarViewState();
}

class _UpperScafoldTabBarViewState extends State<UpperScafoldTabBarView> {
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: <Widget>[
        UpperTabBarViewItem(daysTimeTable: widget.timeTable["0"],),
        UpperTabBarViewItem(daysTimeTable: widget.timeTable["1"],),
        UpperTabBarViewItem(daysTimeTable: widget.timeTable["2"],),
        UpperTabBarViewItem(daysTimeTable: widget.timeTable["3"],),
        UpperTabBarViewItem(daysTimeTable: widget.timeTable["4"],),
        UpperTabBarViewItem(daysTimeTable: widget.timeTable["5"],),
      ],
    );
  }
}

class UpperTabBarViewItem extends StatefulWidget {
  var daysTimeTable;
  UpperTabBarViewItem({this.daysTimeTable});
  @override
  _UpperTabBarViewItemState createState() => _UpperTabBarViewItemState();
}

class _UpperTabBarViewItemState extends State<UpperTabBarViewItem> {
  var leftPadding =18.0;

  List<Widget>tabList=[];
  List<String> uniqueTimes=[];
  Map <String, List<dynamic>>slotsClasses={};
  List<Widget> lowertabbarviewItems=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    for (var i in widget.daysTimeTable){
      if(! uniqueTimes.contains(i['time'].substring(0,2)))
        {
          tabList.add(new Text(i['time'],style: TextStyle(fontSize: 18)));
          uniqueTimes.add(i['time'].substring(0,2));
          slotsClasses[i['time'].substring(0,2)]=[];
        }
      slotsClasses[i['time'].substring(0,2)].add(i);


//        print(i['time'].substring(0,2));
    }
    slotsClasses.forEach( (k ,v){
      lowertabbarviewItems.add(LowerTabBarViewItem(slotsClasses: v,));
    });
  }


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabList.length,
      child: Scaffold(
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
                          tabs: tabList,
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
        body: TabBarView(
          children: lowertabbarviewItems,
        ),
      ),
    );
  }
}

class LowerTabBarViewItem extends StatefulWidget {
  var slotsClasses;
  LowerTabBarViewItem({this.slotsClasses});
  @override
  _LowerTabBarViewItemState createState() => _LowerTabBarViewItemState();
}

class _LowerTabBarViewItemState extends State<LowerTabBarViewItem> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: widget.slotsClasses.length,itemBuilder: (context,index){
      return Padding(
        padding: const EdgeInsets.only(bottom:10.0),
        child: ClassCard(
          venue: widget.slotsClasses[index]['venue'],
          name: widget.slotsClasses[index]['name'],
          time: widget.slotsClasses[index]['time'],
        ),
      );
    });
  }
}
