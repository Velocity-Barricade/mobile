import 'package:flutter/material.dart';

class DrawerComponent extends StatefulWidget {
  String name;
  Widget child;
  Widget trail;
  DrawerComponent(
      {@required this.name, @required this.child, @required this.trail});

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
            onTap: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => widget.child));
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
