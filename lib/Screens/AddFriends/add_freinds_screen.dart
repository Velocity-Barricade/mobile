import 'dart:convert';

import 'package:barricade/Models/config.dart';
import 'package:barricade/Utils/connectionStatus.dart';
import 'package:barricade/Utils/local_storage_handler.dart';
import 'package:barricade/Utils/request_manager.dart';
import 'package:barricade/Utils/validators.dart';
import 'package:flutter/material.dart';


class AddFriendsScreen extends StatefulWidget {
  @override
  _AddFriendsScreenState createState() => _AddFriendsScreenState();
}

class _AddFriendsScreenState extends State<AddFriendsScreen> {
  Widget temp=Container();
  TextEditingController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller= new TextEditingController();
  }
  var key =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(elevation: 0,backgroundColor: Colors.white,),
      body: Form(
        key: key,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: new TextFormField(
                controller: controller ,
                onFieldSubmitted: (val) async {
                  print("sflk");
                  if(key.currentState.validate()){
                    print("checking for net");
                    if(await checkConnectionStatus()){
                      print("net available");
                        setState(() {
                          temp=new CircularProgressIndicator();
                        });
                       RequestManager().getClasses(email: val).then((respBool){
                            if(respBool){
                            //todo dont save invalid emials
                            print('hlele');
                            setState(() {
                              temp = new Text("has been added");
                              dynamic frenList=StorageHandler().getValue(Config.friendsListKey);
                              print(frenList.runtimeType);
                              print(frenList);
                              if (frenList==null || frenList=='null'){
                                print("first time ");
                                frenList=["$val"];
                                frenList=json.encode(frenList);
                                StorageHandler().setValue(Config.friendsListKey, frenList);
                                print("end");
                              }
                              else{
                                print("second time");
//                                StorageHandler().setValue(Config.freindsListKey,json.encode((json.decode(StorageHandler().getValue(Config.freindsListKey))).add(val)));
                                frenList=json.decode(frenList);
                                print(frenList);
                                frenList.add(val);
                                print(frenList);
                                frenList=json.encode(frenList);
                                StorageHandler().setValue(Config.friendsListKey, frenList);
                                print(StorageHandler().getValue(Config.friendsListKey));
                              }
                            });

                            }
                            else{
                                setState(() {
                                  temp = new Text("invalid email");
                                });
                            }
                       });
                    }
                    else{
                      setState(() {
                        print("no ner");
                        temp = new Text("Needs Internet");

                      });
                    }
                  }
                  else{
                  }
                },
                decoration: InputDecoration(border: OutlineInputBorder(),labelText: "email"),
              ),
            ),
            Center(child: temp)
          ],
        ),
      ),
    );
  }
}
