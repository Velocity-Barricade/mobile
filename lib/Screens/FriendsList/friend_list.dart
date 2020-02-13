import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:barricade/Values/colors.dart';

class FriendList extends StatefulWidget {
  var friendList;
  @override
  _FriendListState createState() => _FriendListState();
}

class _FriendListState extends State<FriendList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
            child: Column(
          children: <Widget>[
            Expanded(
              flex: 10,
              child: Container(
                width: 400,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      "Friends",
                      style: TextStyle(color: themeColor, fontSize: 40),
                    )
                  ],
                ),
              ),
            ),
            Flexible(
                flex: 90,
                child: ListView(
                  children: <Widget>[FriendListCard()],
                ))
          ],
        )),
      ),
    );
  }
}

class FriendListCard extends StatefulWidget {
  @override
  _FriendListCardState createState() => _FriendListCardState();
}

class _FriendListCardState extends State<FriendListCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListTile(
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                child: Text(
              "Name",
              style: TextStyle(color: Colors.black, fontSize: 22),
            )),
            Container(
              child: Text(
                "Friends",
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            )
          ],
        ),
        trailing: Icon(Icons.arrow_forward),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  child: Text(
                    "Friends",
                    style: TextStyle(color: Colors.grey, fontSize: 22),
                  ),
                ),
                Container(
                  child: Text(
                    "Friends",
                    style: TextStyle(color: Colors.grey, fontSize: 10),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
