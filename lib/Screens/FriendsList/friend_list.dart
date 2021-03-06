import 'package:barricade/Models/parsedTimetable.dart';
import 'package:barricade/Screens/HomeScreen/Components/friend_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:barricade/Values/colors.dart';

class FriendsList extends StatefulWidget {
  List listOfFriends;
  FriendsList({@required this.listOfFriends});
  @override
  _FriendsListState createState() => _FriendsListState();
}

class _FriendsListState extends State<FriendsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: new IconThemeData(
          color: themeGrey,
          size: 3,
        ),
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
                child: widget.listOfFriends == null
                    ? Container()
                    : ListView.builder(
                        itemCount: widget.listOfFriends.length,
                        itemBuilder: (BuildContext context, int index) {
                          return FriendListCard(
                            friend: widget.listOfFriends[index],
                          );
                        }))
          ],
        )),
      ),
    );
  }
}

class FriendListCard extends StatefulWidget {
  var friend;
  FriendListCard({@required this.friend});
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
              "Id",
              style: TextStyle(color: Colors.black, fontSize: 22),
            )),
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
