import 'dart:convert';

import 'package:barricade/Models/config.dart';
import 'package:barricade/Utils/local_storage_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'freind_card.dart';
class FriendList extends StatefulWidget {
  @override
  _FriendListState createState() => _FriendListState();
}

class _FriendListState extends State<FriendList> {
  var list=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    print()
    String frends=StorageHandler().getValue(Config.friendsListKey);

//    list=[];
  }

  @override
  Widget build(BuildContext context) {
    String frends=StorageHandler().getValue(Config.friendsListKey);

    if(frends!= null && frends!='null'){
      list=(json.decode(frends));
    }

    print(list);
    return Container(
//      height: 200,
      child: ListView.builder(
        padding: EdgeInsets.only(top: 0,right: 16),
        scrollDirection: Axis.horizontal,
          itemCount: list.length,
          itemBuilder: (BuildContext context,int index){
        return FreindCard(email: list[index],);
      }),
    );
  }
}
