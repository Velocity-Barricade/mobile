import 'package:flutter/material.dart';

class Registeration extends StatefulWidget {
  @override
  _RegisterationState createState() => _RegisterationState();
}

class _RegisterationState extends State<Registeration> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 85),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 40,
                  ),
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: Text("Welcome Stranger",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 33.0, color: Colors.blueGrey)),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Container(
                            child: Text(
                              "We would like to know more about you!",
                              style: TextStyle(fontSize: 17.0),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: Text(
                              "Please fill in the details below to register",
                              style: TextStyle(fontSize: 17.0)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 36.0, left: 10),
                child: Container(
                  width: queryData.size.width * 0.84,
                  child: Theme(
                    data: new ThemeData(
                      primaryColor: Colors.yellow,
                      accentColor: Colors.blue,
                    ),
                    child: Center(
                      child: TextField(
                        decoration: InputDecoration(
                            labelStyle: new TextStyle(color: Colors.blue),
                            border: new UnderlineInputBorder(
                                borderSide: new BorderSide(color: Colors.red)),
                            hintText: 'Email ID'),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 10),
                child: Container(
                  width: queryData.size.width * 0.84,
                  child: Theme(
                    data: new ThemeData(
                      primaryColor: Colors.yellow,
                      accentColor: Colors.blue,
                    ),
                    child: Center(
                      child: TextField(
                        decoration: InputDecoration(
                            labelStyle: new TextStyle(color: Colors.blue),
                            border: new UnderlineInputBorder(
                                borderSide: new BorderSide(color: Colors.red)),
                            hintText: 'Full Name'),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 10),
                child: Container(
                  width: queryData.size.width * 0.84,
                  child: Theme(
                    data: new ThemeData(
                      primaryColor: Colors.yellow,
                      accentColor: Colors.blue,
                    ),
                    child: Center(
                      child: TextField(
                        decoration: InputDecoration(
                            labelStyle: new TextStyle(color: Colors.blue),
                            border: new UnderlineInputBorder(
                                borderSide: new BorderSide(color: Colors.red)),
                            hintText: 'Password'),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 110),
                child: Container(
                  height: queryData.size.height * 0.06,
                  width: queryData.size.width * 0.580,
                  child: RaisedButton(
                    color: Colors.blueGrey,
                    onPressed: () {},
                    child: new Text(
                      "Sign up",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
