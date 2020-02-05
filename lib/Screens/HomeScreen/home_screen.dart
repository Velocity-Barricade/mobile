import 'package:barricade/Screens/TimeTable/Components/class_card.dart';
import 'package:barricade/Values/colors.dart';
import 'package:flutter/material.dart';
import 'package:barricade/Screens/CourseAddDrop/Components/search_bar.dart';
import 'Components/friend_list.dart';
import 'package:barricade/Screens/Drawer/Drawer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 8.0, right: 18),
            child: InkWell(
                onTap: () {
                  showSearch(context: context, delegate: Searchbar());
                },
                child: new Icon(
                  Icons.search,
                  size: 26,
                )),
          ),
        ],
        iconTheme: new IconThemeData(
          color: themeGrey,
          size: 3,
        ),
      ),
      drawer: new DrawerScreen(),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Flexible(
            flex: 35,
            child: Container(
//            hi saad start
              child: Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20),
                child: Column(
                  children: <Widget>[
                    Flexible(
                        flex: 3,
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                color: Colors.white,
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: new Text(
                                      "Hi,Saad",
                                      style: TextStyle(
                                          color: themeColor,
                                          fontSize: 41,
                                          fontWeight: FontWeight.w400),
                                    )),
                              ),
                            ),
                          ],
                        )),

                    //hi saad end

                    //upcoming class starr
                    Flexible(
                        flex: 5,
                        child: Container(
//                        color: Colors.blue,
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: Container(
//                                color: Colors.red,
                                  child: new Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 17.0),
                                            child: new Text(
                                              "Upcoming",
                                              style: TextStyle(
                                                fontSize: 20,
                                              ),
                                            ),
                                          )),
                                      ClassCard(
                                        Number: 2,
                                        upcoming: true,
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              bottom: 10.0, top: 7),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              Text(
                                                "View your timetable ",
                                                style: TextStyle(
                                                    color: themeGrey,
                                                    fontSize: 15),
                                              ),
                                              Icon(Icons.arrow_forward)
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ),

//          upcoming class end

//        your friends sections start
          Flexible(
            flex: 40,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 20.0, left: 20),
                    child: Container(
//                    color: Colors.amber,
                      child: Column(
                        children: <Widget>[
                          Flexible(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
//                                    color: Colors.green,
                                      child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: new Text(
                                            "Your friends",
                                            style: TextStyle(fontSize: 20),
                                          )),
                                    ),
                                  ),
                                ],
                              )),
                          Flexible(flex: 7, child: FriendList()),
                          Flexible(
                            flex: 4,
                            child: Column(
                              children: <Widget>[
                                Expanded(
                                  child: new Container(
//                                  color: Colors.grey,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                children: <Widget>[
                                                  new Text(
                                                    "View the complete list",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: themeGrey),
                                                  ),
                                                  new Icon(
                                                    Icons.arrow_forward,
                                                    size: 15,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: new Text(
                                            "Please dont click this !",
                                            style: TextStyle(
                                                color: themeGrey, fontSize: 15),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )

//          yoyr friends section end
        ],
      ),
    );
  }
}
