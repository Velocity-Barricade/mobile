import 'package:barricade/Utils/request_manager.dart';
import 'package:barricade/Utils/validators.dart';
import 'package:flutter/material.dart';

class DrawerComponent extends StatefulWidget {
  String name;
  Widget child;
  Widget trail;
  bool checkFornet;
  DrawerComponent(
      {@required this.name, @required this.child, @required this.trail,this.checkFornet=false});

  @override
  State createState() => _ZDrawerItemsState();
}

class _ZDrawerItemsState extends State<DrawerComponent> {
  Divider divider = new Divider(
    height: 15,
  );

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        InkWell(
            onTap: () async {
              if(widget.checkFornet){
                if(await hasNet()){
//                  todo add loader
//                 var map = await RequestManager().getCourses();
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) => widget.child));
                }
                else{
                  Scaffold.of(context).showSnackBar(SnackBar(content: Text("Needs Internet")));
                }
              }
              else{
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => widget.child));
              }
            },
            child: ListTile(
              leading: widget.trail,
              title: new Text(widget.name),
            )),
        divider,
      ],
    );
  }
}
