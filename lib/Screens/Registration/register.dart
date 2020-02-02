import 'package:barricade/Screens/Registration/registerValidators.dart';
import 'package:flutter/material.dart';
import 'package:barricade/Screens/Login/LoginServices.dart';
import 'package:barricade/Values/colors.dart';

class Registeration extends StatefulWidget {
  @override
  _RegisterationState createState() => _RegisterationState();
}

class _RegisterationState extends State<Registeration> {
  AuthUser authUser = new AuthUser();
  var email;
  var pass;
  var name;
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  bool validate = false;
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
                              style:
                                  TextStyle(fontSize: 33.0, color: themeColor)),
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
              Form(
                autovalidate: validate,
                key: formKey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 36.0, left: 10),
                      child: Container(
                        width: queryData.size.width * 0.84,
                        child: Theme(
                          data: new ThemeData(
                            primaryColor: themeColor,
                            accentColor: Colors.blue,
                          ),
                          child: Center(
                            child: TextFormField(
                              validator: (val) => validatorEmail(val),
                              keyboardType: TextInputType.emailAddress,
                              onSaved: (val) {
                                email = val;
                              },
                              decoration: InputDecoration(
                                  labelStyle: new TextStyle(color: Colors.blue),
                                  border: new UnderlineInputBorder(
                                      borderSide:
                                          new BorderSide(color: Colors.red)),
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
                            child: TextFormField(
                              onSaved: (val) {
                                name = val;
                              },
                              keyboardType: TextInputType.text,
                              validator: (val) => validatorName(val),
                              decoration: InputDecoration(
                                  labelStyle: new TextStyle(color: Colors.blue),
                                  border: new UnderlineInputBorder(
                                      borderSide:
                                          new BorderSide(color: Colors.red)),
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
                            child: TextFormField(
                              onSaved: (val) {
                                pass = val;
                              },
                              validator: (val) => validatorPass(val),
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                  labelStyle: new TextStyle(color: Colors.blue),
                                  border: new UnderlineInputBorder(
                                      borderSide:
                                          new BorderSide(color: Colors.red)),
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
                          color: themeColor,
                          onPressed: () async {
                            var form = formKey.currentState;
                            if (form.validate()) {
                              form.save();

                              print(await authUser.signUp(email, pass));
                              authUser.sendVerification();
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  // return object of type Dialog
                                  return AlertDialog(
                                    title: new Text("Email Varification"),
                                    content: new Text(
                                        "Click link in email for Varification"),
                                    actions: <Widget>[
                                      // usually buttons at the bottom of the dialog
                                      new FlatButton(
                                        child: new Text("Ok"),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            } else {
                              final snackBar =
                                  SnackBar(content: Text('Not Valid Email'));
                              Scaffold.of(context).showSnackBar(snackBar);
                              setState(() {
                                validate = true;
                              });
                            }
                          },
                          child: new Text(
                            "Sign up",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _showDialog(BuildContext context) {
  // flutter defined function
}
