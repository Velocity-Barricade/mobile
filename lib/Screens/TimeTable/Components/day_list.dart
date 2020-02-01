import 'package:flutter/material.dart';

import 'class_card.dart';

class DayList extends StatefulWidget {
  @override
  _DayListState createState() => _DayListState();
}

class _DayListState extends State<DayList> {
  var list=[1,2,3,4,5,6,7,8,9];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(left: 18,right: 18,top: 48),

      itemCount: list.length,
      itemBuilder: (BuildContext context,int index){
      return ClassCard(Number: list[index],);
    } ,
    );
  }
}
