import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Hi extends StatefulWidget {
  @override
  _HiState createState() => _HiState();
}

class _HiState extends State<Hi> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
          color: Colors.blue,borderRadius: BorderRadius.all(Radius.circular(40))),
      child:null 
    );
  }
}
