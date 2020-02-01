import 'package:barricade/Values/colors.dart';
import 'package:flutter/material.dart';


class ClassCard extends StatefulWidget {
  int Number;
  ClassCard({this.Number});
  @override
  _ClassCardState createState() => _ClassCardState();
}

class _ClassCardState extends State<ClassCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom:13.0),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(17))),
        color: themeColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Padding(
              padding:  EdgeInsets.only(left:20.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text("E${widget.Number}",
                    style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),
                  ),
                  new Text("ISPM",
                    style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w300),

                  ),
                ],
              ),
            ),
            title: Padding(
              padding:  EdgeInsets.only(left:28.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text("8:00 - 8:55",
                  style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),

                ),
                new Text("DR. NomanDurrani",
                  style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w300),

                )
      ],
              ),
            ),
        ),
      )
      ),
    );
  }
}
