import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int flexHi=1;
    int flexText1 =1;
    int flexText2=1;
    int flexSignin=1;
    return SizedBox(
      width: (size.width)*0.7,
      height: (size.height)*0.50,
      child: Padding(
        padding: const EdgeInsets.only(top:30.0),
        child: Container(
          decoration: BoxDecoration(
              color: Color.fromRGBO(0, 0, 0, 0.75),
              borderRadius: BorderRadius.all(Radius.circular(30.0))),

          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Flexible(flex: flexHi,
                    child: Container()
                ),



                //tesxt fied 1
                Flexible(flex: flexText1,
                  child: Padding(
                    padding: const EdgeInsets.only(left:14.0,right: 14.0),
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),

                      decoration: InputDecoration(hintText: "Email Id",hintStyle: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.7)),focusColor: Colors.white,labelText: "Email",labelStyle: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.75)) ,alignLabelWithHint: true),


                    ),
                  ),
                ),
//tesxt fied 1


                //tesxt fied 2
                Flexible(flex: flexText2,
                 child: Padding(
                   padding: const EdgeInsets.only(left:14.0,right: 14.0),
                   child: TextFormField(
                     style: TextStyle(color: Colors.white),
                     decoration: InputDecoration(hintText: "Password",hintStyle: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.7)),focusColor: Colors.white,labelText: "Password",labelStyle: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.75)) ,alignLabelWithHint: true),
                   ),
                 ),
                ),
                //tesxt fied 2



                // Sign in and Forgot password
                Flexible(flex: flexSignin,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left:14.0,right: 14.0,),
                                child: RaisedButton(
                                  color: Colors.blue,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
                                  child: new Text("Sign In",style: TextStyle(color: Colors.white),),
                                  onPressed: (){},
                                ),
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                )
// Sign in and Forgot password


              ],
            ),
          ),
        ),
      ),
    );
  }
}
